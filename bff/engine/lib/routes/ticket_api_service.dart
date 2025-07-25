import 'dart:convert';

import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/provider/supabase_util.dart';
import 'package:engine/util/json_response.dart';
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
        ticketType: ticketType,
        options: options,
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
      // 既存の購入で、同じチケットタイプのもの かつ 購入済みのもの
      final sameTicketTypePurchases = existingPurchases.where(
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

      // 6. チェックアウトセッションを作成
      final checkoutSession = await database.ticketCheckout
          .createCheckoutSession(
            userId: user.id,
            ticketTypeId: requestData.ticketTypeId,
            totalAmount: ticketType.price,
            options: requestData.options
                .map(
                  (o) => CheckoutOption(
                    optionId: o.optionId,
                    value: o.value,
                  ),
                )
                .toList(),
          );

      // 7. Stripe PaymentIntentを作成
      // TODO: Stripe APIの実装
      final stripeCheckoutUrl =
          'https://checkout.stripe.com/pay/cs_test_${checkoutSession.id}';

      return TicketCheckoutResponse(
        checkoutSessionId: checkoutSession.id,
        stripeCheckoutUrl: stripeCheckoutUrl,
        totalAmount: checkoutSession.totalAmount,
        expiresAt: checkoutSession.expiresAt,
      ).toJson();
    },
  );

  /// チェックアウトセッション詳細取得
  @Route.get('/checkout/<sessionId>')
  Future<Response> _getCheckoutSession(
    Request request,
    String sessionId,
  ) async => jsonResponse(
    () async {
      final supabaseUtil = container.read(supabaseUtilProvider);
      final userResult = await supabaseUtil.extractUser(request);
      final (_, user, _) = userResult.unwrap;

      final database = await container.read(dbClientProvider.future);
      final session = await database.ticketCheckout.getCheckoutSession(
        sessionId,
      );

      if (session == null) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.notFound,
          detail: 'チェックアウトセッションが見つかりません',
        );
      }

      // 自分のセッションかチェック
      if (session.userId != user.id) {
        throw ErrorResponse.errorCode(
          code: ErrorCode.forbidden,
          detail: 'このセッションにアクセスする権限がありません',
        );
      }

      return TicketCheckoutSessionResponse(
        session: session,
      ).toJson();
    },
  );

  Router get router => _$TicketApiServiceRouter(this);
}
