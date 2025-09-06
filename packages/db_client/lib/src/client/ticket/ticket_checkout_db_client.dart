import 'package:db_types/db_types.dart';
import 'package:postgres/postgres.dart';

class TicketCheckoutDbClient {
  TicketCheckoutDbClient({required Connection connection})
    : _connection = connection;

  final Connection _connection;

  /// ユーザーのアクティブなチェックアウトセッションをすべて取得
  /// 複数のアクティブセッションがある場合はすべて返す（作成日時の降順）
  Future<List<TicketCheckoutSessions>> getActiveUserSession(
    String userId,
    String ticketTypeId,
  ) async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT *, status::text as status
        FROM ticket_checkout_sessions
        WHERE user_id = @userId
          AND ticket_type_id = @ticketTypeId
          AND status = 'pending'
          AND expires_at > now()
        ORDER BY created_at DESC
      '''),
      parameters: {
        'userId': userId,
        'ticketTypeId': ticketTypeId,
      },
    );

    return result
        .map((row) => TicketCheckoutSessions.fromJson(row.toColumnMap()))
        .toList();
  }

  /// チェックアウトセッションを作成
  Future<TicketCheckoutSessions> createCheckoutSession({
    required String userId,
    required String ticketTypeId,
    required int totalAmount,
    required List<CheckoutOption> options,
  }) async => _connection.runTx(
    (tx) async {
      // 1. チェックアウトセッションを作成
      final sessionResult = await tx.execute(
        Sql.named('''
        INSERT INTO ticket_checkout_sessions (
          user_id, ticket_type_id, total_amount
        ) VALUES (
          @userId, @ticketTypeId, @totalAmount
        )
        RETURNING *
      '''),
        parameters: {
          'userId': userId,
          'ticketTypeId': ticketTypeId,
          'totalAmount': totalAmount,
        },
      );

      final session = TicketCheckoutSessions.fromJson(
        sessionResult.first.toColumnMap(),
      );

      // 2. オプションを保存
      for (final option in options) {
        await tx.execute(
          Sql.named('''
          INSERT INTO ticket_checkout_options (
            checkout_session_id, ticket_option_id, option_value
          ) VALUES (
            @sessionId, @optionId, @optionValue
          )
        '''),
          parameters: {
            'sessionId': session.id,
            'optionId': option.optionId,
            'optionValue': option.value,
          },
        );
      }

      return session;
    },
  );

  Future<TicketCheckoutSessions?> getTicketCheckout(String checkoutId) async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT * FROM ticket_checkout_sessions WHERE id = @checkoutId
        LIMIT 1
      '''),
      parameters: {
        'checkoutId': checkoutId,
      },
    );
    if (result.isEmpty) {
      return null;
    }
    return TicketCheckoutSessions.fromJson(result.first.toColumnMap());
  }

  Future<TicketCheckoutSessions> cancelTicketCheckout(String checkoutId) async {
    final result = await _connection.execute(
      Sql.named('''
        UPDATE ticket_checkout_sessions
        SET status = 'expired' AND updated_at = now() AND expires_at = now()
        WHERE id = @checkoutId
        RETURNING *
      '''),
    );
    if (result.isEmpty) {
      throw Exception('TicketCheckout not found: $checkoutId');
    }
    return TicketCheckoutSessions.fromJson(result.first.toColumnMap());
  }

  /// Stripe情報でセッションを更新
  Future<void> updateStripeInfo(
    String sessionId, {
    String? stripePaymentIntentId,
    String? stripeCheckoutSessionId,
  }) async {
    await _connection.execute(
      Sql.named('''
        UPDATE ticket_checkout_sessions
        SET
          stripe_payment_intent_id = @paymentIntentId,
          stripe_checkout_session_id = @checkoutSessionId,
          updated_at = now()
        WHERE id = @sessionId
      '''),
      parameters: {
        'sessionId': sessionId,
        'paymentIntentId': stripePaymentIntentId,
        'checkoutSessionId': stripeCheckoutSessionId,
      },
    );
  }

  /// ユーザのすべてのチケット情報を取得する
  /// 完了済みのチケット購入とアクティブなチェックアウトセッションの両方を含む
  Future<List<TicketPurchaseWithDetails>> getUserAllTicketsWithDetails({
    required String userId,
  }) async {
    final result = await _connection.execute(
      Sql.named('''
        -- 完了済みのチケット購入情報
        SELECT
          json_build_object(
            'id', tp.id,
            'user_id', tp.user_id,
            'ticket_type_id', tp.ticket_type_id,
            'status', tp.status::text,
            'stripe_payment_intent_id', tp.stripe_payment_intent_id,
            'created_at', tp.created_at,
            'updated_at', tp.updated_at
          ) AS purchase,
          NULL AS "checkout_session",
          tt.id AS ticket_type_id,
          COALESCE(
            json_agg(
              CASE
                WHEN topt.id IS NOT NULL THEN
                  json_build_object(
                    'id', topt.id,
                    'ticket_type_id', topt.ticket_type_id,
                    'name', topt.name,
                    'description', topt.description,
                    'max_quantity', topt.max_quantity,
                    'created_at', topt.created_at,
                    'updated_at', topt.updated_at
                  )
                ELSE NULL
              END
            ) FILTER (WHERE topt.id IS NOT NULL),
            '[]'::json
          ) AS options,
          tp.created_at as sort_date
        FROM ticket_purchases tp
        INNER JOIN ticket_types tt ON tp.ticket_type_id = tt.id
        LEFT JOIN ticket_purchase_options tpo ON tp.id = tpo.ticket_purchase_id
        LEFT JOIN ticket_options topt ON tpo.ticket_option_id = topt.id
        WHERE tp.user_id = @userId
        GROUP BY
          tp.id, tt.id
        UNION ALL

        -- アクティブなチェックアウトセッション情報
        SELECT
          NULL AS purchase,
          json_build_object(
            'id', tcs.id,
            'user_id', tcs.user_id,
            'ticket_type_id', tcs.ticket_type_id,
            'status', tcs.status::text,
            'stripe_checkout_session_id', tcs.stripe_checkout_session_id,
            'stripe_checkout_url', tcs.stripe_checkout_url,
            'ticket_checkout_workflow_id', tcs.ticket_checkout_workflow_id,
            'expires_at', tcs.expires_at,
            'created_at', tcs.created_at,
            'updated_at', tcs.updated_at
          ) AS "checkout_session",
          tt.id AS ticket_type_id,
          COALESCE(
            json_agg(
              CASE
                WHEN topt.id IS NOT NULL THEN
                  json_build_object(
                    'id', topt.id,
                    'ticket_type_id', topt.ticket_type_id,
                    'name', topt.name,
                    'description', topt.description,
                    'max_quantity', topt.max_quantity,
                    'created_at', topt.created_at,
                    'updated_at', topt.updated_at
                  )
                ELSE NULL
              END
            ) FILTER (WHERE topt.id IS NOT NULL),
            '[]'::json
          ) AS options,
          tcs.created_at as sort_date
        FROM ticket_checkout_sessions tcs
        INNER JOIN ticket_types tt ON tcs.ticket_type_id = tt.id
        LEFT JOIN ticket_checkout_options tco ON tcs.id = tco.checkout_session_id
        LEFT JOIN ticket_options topt ON tco.ticket_option_id = topt.id
        WHERE tcs.user_id = @userId
          AND tcs.status = 'pending'
          AND tcs.expires_at > now()
        GROUP BY
          tcs.id, tt.id
        ORDER BY sort_date DESC
      '''),
      parameters: {
        'userId': userId,
      },
    );

    return result.map((row) {
      return TicketPurchaseWithDetails.fromJson(row.toColumnMap());
    }).toList();
  }
}
