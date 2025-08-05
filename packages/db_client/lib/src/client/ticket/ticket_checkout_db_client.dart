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

  /// ユーザーの全チェックアウトセッション履歴を取得（状態・期限に関係なく）
  Future<List<TicketCheckoutSessions>> getUserSessionHistory(
    String userId, {
    String? ticketTypeId,
  }) async {
    final sql = ticketTypeId != null
        ? '''
        SELECT *, status::text as status
        FROM ticket_checkout_sessions
        WHERE user_id = @userId AND ticket_type_id = @ticketTypeId
        ORDER BY created_at DESC
      '''
        : '''
        SELECT *, status::text as status
        FROM ticket_checkout_sessions
        WHERE user_id = @userId
        ORDER BY created_at DESC
      ''';

    final parameters = <String, String>{
      'userId': userId,
      if (ticketTypeId != null) 'ticketTypeId': ticketTypeId,
    };

    final result = await _connection.execute(
      Sql.named(sql),
      parameters: parameters,
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

  /// チェックアウトセッション詳細を取得
  Future<TicketCheckoutSessions?> getCheckoutSession(String sessionId) async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT *, status::text as status
        FROM ticket_checkout_sessions
        WHERE id = @sessionId
      '''),
      parameters: {'sessionId': sessionId},
    );

    if (result.isEmpty) {
      return null;
    }

    return TicketCheckoutSessions.fromJson(
      result.first.toColumnMap(),
    );
  }
}
