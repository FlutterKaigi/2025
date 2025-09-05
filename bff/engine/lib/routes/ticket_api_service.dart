import 'dart:convert';

import 'package:bff_client/bff_client.dart';
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
          .getActiveTicketTypesWithOptions();

      return TicketTypesWithOptionsResponse(
        ticketTypes: ticketTypesWithOptions.map((item) {
          return TicketTypeWithOptionsItem(
            ticketType: item.ticketType,
            options: item.options,
          );
        }).toList(),
      ).toJson();
    },
  );

  /// 特定のチケット種別とオプションを取得
  @Route.get('/types/<ticketTypeId>')
  Future<Response> _getTicketTypeWithOptions(
    Request request,
    String ticketTypeId,
  ) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);

      final ticketType = await database.ticketType.getTicketType(ticketTypeId);
      if (ticketType == null) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.routeNotFound,
          detail: 'チケットタイプが見つかりません',
        );
      }

      final options = await database.ticketOption.getTicketOptions(
        ticketTypeId,
      );

      return TicketTypeWithOptionsResponse(
        ticketType: ticketType.toTicketType(),
        options: options.map((e) => e.toTicketOption()).toList(),
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
      final ticketType = await database.ticketType.getTicketType(
        requestData.ticketTypeId,
      );
      if (ticketType == null || !ticketType.isActive) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail: 'このチケットタイプは現在購入できません',
        );
      }

      // 2. 販売期間チェック
      final now = DateTime.now();
      if (ticketType.saleStartsAt == null && ticketType.saleEndsAt == null) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail: 'このチケットの販売はまだ開始されていません: 販売期間が設定されていません',
        );
      }
      if (ticketType.saleStartsAt != null &&
          now.isBefore(ticketType.saleStartsAt!)) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail: 'このチケットの販売はまだ開始されていません: ${ticketType.saleStartsAt}',
        );
      }
      if (ticketType.saleEndsAt != null &&
          now.isAfter(ticketType.saleEndsAt!)) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.badRequest,
          detail: 'このチケットの販売は終了しました: ${ticketType.saleEndsAt}',
        );
      }

      // 3. 既存の購入チェック（同じユーザー・同じチケットタイプ）
      final existingPurchases = await database.ticketPurchase
          .getUserTicketPurchase(
            user.id,
            requestData.ticketTypeId,
          );
      final purchases = existingPurchases
          .map((e) => e.toTicketPurchase())
          .toList();
      // 既存の購入で、同じチケットタイプのもの かつ 購入済みのもの
      final sameTicketTypePurchases = purchases.where(
        (purchase) =>
            purchase.ticketTypeId == requestData.ticketTypeId &&
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

      // 5. チケットオプションの有効性チェック
      final ticketOptions = await database.ticketOption.getTicketOptions(
        requestData.ticketTypeId,
      );
      final availableOptionIds = ticketOptions.map((o) => o.id).toSet();

      for (final option in requestData.options) {
        if (!availableOptionIds.contains(option.optionId) ||
            !ticketOptions.any((o) => o.id == option.optionId)) {
          throw ErrorResponse.errorCode(
            code: ErrorCode.badRequest,
            detail: '無効なオプションが指定されています: ${option.optionId}',
          );
        }
      }

      // Payment Intentを作成
      final internalApiClient = container.read(internalApiClientProvider);
      final ticketCheckoutSessionResponse = await internalApiClient
          .stripeInternalApi
          .internalPaymentApi
          .createCheckoutSession(
            request: PutCheckoutSessionRequest(
              successUrl: requestData.successUrl,
              cancelUrl: 'https://example.com/cancel',
              userId: user.id,
              ticketTypeId: requestData.ticketTypeId,
              ticketOptionIds: requestData.options
                  .map((e) => e.optionId)
                  .toList(),
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
          await database.ticketCheckout.getTicketCheckout(checkoutId);

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

      final database = await container.read(dbClientProvider.future);
      final response = await database.ticketCheckout
          .getUserAllTicketsWithDetails(
            userId: user.id,
          );
      final tickets = response.map((e) => e.toTicketItem()).toList();

      return UserTicketsResponse(
        tickets: tickets,
      ).toJson();
    },
  );

  /// ユーザのチケット一覧を取得する
  @Route.get('/users/<userId>')
  Future<Response> _getUserTickets(Request request, String userId) async =>
      jsonResponse(
        () async {
          final supabaseUtil = container.read(supabaseUtilProvider);
          final userResult = await supabaseUtil.extractUser(request);
          final (_, _, roles) = userResult.unwrap;

          // 管理者権限のチェック
          if (!roles.contains(db_types.Role.admin)) {
            throw ErrorResponse.errorCode(
              code: ErrorCode.forbidden,
              detail: '管理者権限がありません',
            );
          }

          final database = await container.read(dbClientProvider.future);
          final response = await database.ticketCheckout
              .getUserAllTicketsWithDetails(
                userId: userId,
              );
          final tickets = response.map((e) => e.toTicketItem()).toList();
          return UserTicketsResponse(tickets: tickets).toJson();
        },
      );

  Router get router => _$TicketApiServiceRouter(this);
}
