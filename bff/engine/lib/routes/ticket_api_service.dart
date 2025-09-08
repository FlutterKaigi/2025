import 'dart:convert';

import 'package:bff_client/bff_client.dart';
import 'package:collection/collection.dart';
import 'package:db_types/db_types.dart' as db_types;
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/provider/internal_api_client_provider.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
import 'package:internal_api_client/internal_api_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'ticket_api_service.g.dart';

class TicketApiService {
  /// チケット種別一覧を取得（オプション情報も含む）
  @Route.get('/types')
  Future<Response> _getTicketTypes(Request request) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);

      // 販売中のチケットタイプとオプションを一括取得
      final ticketTypesWithOptions = await database.ticketType
          .getActiveTicketTypesWithOptionsAndCounts();

      return TicketTypesWithOptionsResponse(
        ticketTypes: ticketTypesWithOptions
            .map((item) => item.toTicketTypeWithOptionsItem())
            .where(
              (item) =>
                  item.ticketType.status != const TicketStatus.notSelling(),
            )
            .toList(),
      ).toJson();
    },
  );

  /// チケットチェックアウト（Stripe決済開始）
  @Route.post('/checkout')
  Future<Response> _createCheckout(Request request) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, user, _) = userResult.unwrap;

      final body = await request.readAsString();
      final requestData = TicketCheckoutRequest.fromJson(
        jsonDecode(body) as Map<String, dynamic>,
      );

      final database = await container.read(dbClientProvider.future);

      // 1. チケットタイプの有効性チェック
      final dbTicketTypesWithOptions = await database.ticketType
          .getActiveTicketTypesWithOptionsAndCounts();
      final ticketTypesWithOptions = dbTicketTypesWithOptions
          .map((e) => e.toTicketTypeWithOptionsItem())
          .toList();
      final targetTicketTypeAndOptions = ticketTypesWithOptions
          .firstWhereOrNull(
            (e) => e.ticketType.id == requestData.ticketTypeId,
          );
      if (targetTicketTypeAndOptions == null) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail: 'このチケットタイプは現在購入できません: ${requestData.ticketTypeId} not found',
        );
      }
      final targetOptions = targetTicketTypeAndOptions.options
          .where(
            (e) => requestData.optionIds.any((o) => o == e.id),
          )
          .toList();
      if (targetOptions.length != requestData.optionIds.length) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail:
              'このチケットのオプションが見つかりません: '
              '${requestData.optionIds.join(', ')}',
        );
      }

      // 購入可能かチェック
      final targetTicketType = targetTicketTypeAndOptions.ticketType;
      if (targetTicketType.status is! TicketStatusSelling) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail:
              'このチケットは現在購入できません: ${targetTicketType.id} '
              'is not selling status '
              '${targetTicketType.status}',
        );
      }
      for (final option in targetOptions) {
        if (option.status is! TicketStatusSelling) {
          throw ErrorResponse.errorCode(
            code: ErrorCode.badRequest,
            detail:
                'このチケットのオプションは現在購入できません: ${option.id} is not selling status '
                '${option.status}',
          );
        }
      }

      // 3. 既存の購入チェック（同じユーザー・同じチケットタイプ）
      final existingPurchases = await database.ticketPurchase
          .getUserTicketPurchase(
            user.id,
            targetTicketType.id,
          );
      final purchases = existingPurchases
          .map((e) => e.toTicketPurchase())
          .toList();
      // 既存の購入で、同じチケットタイプのもの かつ 購入済みのもの
      final sameTicketTypePurchases = purchases.where(
        (purchase) =>
            purchase.ticketTypeId == targetTicketType.id &&
            purchase.status == TicketPurchaseStatus.completed,
      );
      if (sameTicketTypePurchases.isNotEmpty) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.conflict,
          detail:
              'このチケットタイプは既に購入済みです: '
              '${sameTicketTypePurchases.map((p) => p.id).join(', ')}',
        );
      }

      // 対象ユーザに進行中のCheckoutがないことを確認
      final checkout = await database.ticketCheckout
          .getUserAllTicketsWithDetails(
            userId: user.id,
          );
      final hasPendingCheckout = checkout.any((e) {
        final status = e.checkoutSession?.status;
        if (status == db_types.TicketCheckoutStatus.pending) {
          return true;
        }
        return false;
      });
      if (hasPendingCheckout) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail: '進行中のCheckoutがあります',
        );
      }

      // Payment Intentを作成
      final internalApiClient = container.read(internalApiClientProvider);
      final ticketCheckoutSessionResponse = await internalApiClient
          .stripeInternalApi
          .internalPaymentApi
          .createCheckoutSession(
            request: PutCheckoutSessionRequest(
              successUrl: requestData.successUrl,
              cancelUrl: requestData.cancelUrl,
              userId: user.id,
              ticketTypeId: targetTicketType.id,
              ticketOptionIds: targetOptions.map((e) => e.id).toList(),
            ),
          );
      final ticketCheckoutSessionData = ticketCheckoutSessionResponse.data;

      // Workflowを開始する
      final workflowStatusResponse = await internalApiClient
          .paymentWorkflowInternalApi
          .ticketCheckout
          .startTicketCheckoutWorkflow(
            ticketCheckoutSessionId: ticketCheckoutSessionData.id,
          );
      final workflowStatus = workflowStatusResponse.data;
      print(workflowStatus);

      // チケットチェックアウトセッションを取得
      final tickets = await database.ticketCheckout
          .getUserAllTicketsWithDetails(
            userId: user.id,
          );
      final ticketCheckoutSession = tickets.firstWhere(
        (ticket) =>
            ticket.checkoutSession != null &&
            ticket.checkoutSession!.id == ticketCheckoutSessionData.id,
      );
      return TicketCheckoutSessionResponse(
        session: ticketCheckoutSession.checkoutSession!,
      ).toJson();
    },
  );

  /// TicketCheckoutのキャンセル
  @Route.put('/checkout/<checkoutId>/cancel')
  Future<Response> _cancelCheckout(Request request, String checkoutId) async =>
      jsonResponse(
        () async {
          final supabaseUtil = container.read(supabaseUtilProvider);
          final userResult = await supabaseUtil.extractUser(request);
          final (_, user, roles) = userResult.unwrap;

          final database = await container.read(dbClientProvider.future);
          final checkout = await database.ticketCheckout.getTicketCheckout(
            checkoutId,
          );
          if (checkout == null) {
            throw ErrorResponse.errorCode(
              code: ErrorCode.routeNotFound,
              detail: 'チケットチェックアウトが見つかりません',
            );
          }

          // ticketCheckout.userId == user.id || user.role == Role.admin
          if (checkout.userId != user.id &&
              !roles.contains(db_types.Role.admin)) {
            throw ErrorResponse.errorCode(
              code: ErrorCode.forbidden,
              detail: 'user is not allowed to cancel this checkout',
            );
          }

          final canceledCheckout = await database.ticketCheckout
              .cancelTicketCheckout(checkoutId);

          await container
              .read(internalApiClientProvider)
              .stripeInternalApi
              .internalPaymentApi
              .expireCheckoutSession(
                checkoutSessionId: canceledCheckout.stripeCheckoutSessionId,
              );
          return TicketCheckoutSessionResponse(
            session: canceledCheckout,
          ).toJson();
        },
      );

  /// 自分のチケット一覧を取得
  @Route.get('/me')
  Future<Response> _getMyTickets(Request request) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, user, _) = userResult.unwrap;

      final response = await _getUserTicketsResponse(user.id);
      return response.toJson();
    },
  );

  /// ユーザのチケット一覧を取得する
  @Route.get('/users/<userId>')
  Future<Response> _getUserTickets(Request request, String userId) async =>
      jsonResponse(
        () async {
          final supabaseUtil = container.read(supabaseUtilProvider);
          final userResult = await supabaseUtil.extractUser(request);
          final (_, user, roles) = userResult.unwrap;

          // 管理者権限 もしくは ユーザー自身
          if (!roles.contains(db_types.Role.admin) && userId != user.id) {
            throw ErrorResponse.errorCode(
              code: ErrorCode.forbidden,
              detail: '管理者権限がありません',
            );
          }

          final response = await _getUserTicketsResponse(user.id);
          return response.toJson();
        },
      );

  Router get router => _$TicketApiServiceRouter(this);
}

Future<UserTicketsResponse> _getUserTicketsResponse(String userId) async {
  final database = await container.read(dbClientProvider.future);
  final (response, dbTicketTypes) = await (
    database.ticketCheckout.getUserAllTicketsWithDetails(
      userId: userId,
    ),
    database.ticketType.getActiveTicketTypesWithOptionsAndCounts(),
  ).wait;
  final ticketTypes = dbTicketTypes
      .map((e) => e.toTicketTypeWithOptionsItem())
      .toList();
  final tickets = response.map((item) {
    final matchedTicketType = ticketTypes.firstWhere(
      (e) => e.ticketType.id == item.ticketTypeId,
    );
    final matchedOption = matchedTicketType.options
        .where((e) => item.options.any((o) => o.id == e.id))
        .toList();

    final purchase = item.purchase?.toTicketPurchase();
    final checkout = item.checkoutSession?.toTicketCheckout();

    if (purchase != null) {
      return TicketItem.purchase(
        ticketType: matchedTicketType.ticketType,
        purchase: purchase,
        options: matchedOption,
      );
    } else if (checkout != null) {
      return TicketItem.checkout(
        ticketType: matchedTicketType.ticketType,
        checkout: checkout,
        options: matchedOption,
      );
    } else {
      throw ErrorResponse.errorCode(
        code: ErrorCode.badRequest,
        detail: 'チケット情報が見つかりません',
      );
    }
  }).toList();

  return UserTicketsResponse(
    tickets: tickets,
  );
}
