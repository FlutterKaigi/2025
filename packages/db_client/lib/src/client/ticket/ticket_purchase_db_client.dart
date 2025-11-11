import 'package:db_client/db_client.dart';
import 'package:db_types/db_types.dart';

class TicketPurchaseDbClient {
  TicketPurchaseDbClient({required Executor executor}) : _executor = executor;

  final Executor _executor;

  /// ユーザーの特定チケットタイプの購入情報をすべて取得
  /// 複数の購入記録がある場合はすべて返す（作成日時の降順）
  Future<List<TicketPurchases>> getUserTicketPurchase(
    String userId,
    String ticketTypeId,
  ) async {
    final result = await _executor.execute(
      '''
        SELECT *, status::text AS "status"
        FROM ticket_purchases
        WHERE user_id = @userId AND ticket_type_id = @ticketTypeId
        ORDER BY created_at DESC
      ''',
      parameters: {
        'userId': userId,
        'ticketTypeId': ticketTypeId,
      },
    );

    return result
        .map((row) => TicketPurchases.fromJson(row.toColumnMap()))
        .toList();
  }

  /// ユーザーのすべてのチケット購入情報を取得
  /// ステータスに関係なくすべて返す（作成日時の降順）
  Future<List<TicketPurchases>> getUserAllTickets(
    String userId,
  ) async {
    final result = await _executor.execute(
      '''
        SELECT *, status::text AS "status"
        FROM ticket_purchases
        WHERE user_id = @userId
        ORDER BY created_at DESC
      ''',
      parameters: {
        'userId': userId,
      },
    );

    return result
        .map((row) => TicketPurchases.fromJson(row.toColumnMap()))
        .toList();
  }

  /// チケット購入IDから単一のチケット購入情報を取得
  Future<TicketPurchases?> getTicketPurchase(
    String ticketPurchaseId,
  ) async {
    final result = await _executor.execute(
      '''
        SELECT *, status::text AS "status"
        FROM ticket_purchases
        WHERE id = @ticketPurchaseId
        LIMIT 1
      ''',
      parameters: {
        'ticketPurchaseId': ticketPurchaseId,
      },
    );

    if (result.isEmpty) {
      return null;
    }

    return TicketPurchases.fromJson(result.first.toColumnMap());
  }

  /// チケット購入IDから詳細情報を含むチケット購入情報を取得
  Future<TicketPurchaseWithDetailsAndUser?>
  getTicketPurchaseWithDetailsByPurchaseId(
    String ticketPurchaseId,
  ) async {
    final result = await _executor.execute(
      '''
        SELECT
          json_build_object(
            'id', tp.id,
            'user_id', tp.user_id,
            'ticket_type_id', tp.ticket_type_id,
            'status', tp.status::text,
            'nameplate_id', tp.nameplate_id,
            'stripe_payment_intent_id', tp.stripe_payment_intent_id,
            'created_at', tp.created_at,
            'updated_at', tp.updated_at
          ) AS purchase,
          NULL::json AS "checkout_session",
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
          CASE
            WHEN el.ticket_purchase_id IS NOT NULL THEN
              json_build_object(
                'ticket_purchase_id', el.ticket_purchase_id,
                'created_at', el.created_at
              )
            ELSE NULL
          END AS entry_log,
          json_build_object(
            'id', u.id,
            'avatar_url', COALESCE(au.raw_user_meta_data->>'avatar_url', ''),
            'role', COALESCE(
              (SELECT json_agg(ur2.role::text)
               FROM user_roles ur2
               WHERE ur2.user_id = u.id),
              '[]'::json
            )
          ) AS "user"
        FROM ticket_purchases tp
        INNER JOIN ticket_types tt ON tp.ticket_type_id = tt.id
        LEFT JOIN ticket_purchase_options tpo ON tp.id = tpo.ticket_purchase_id
        LEFT JOIN ticket_options topt ON tpo.ticket_option_id = topt.id
        LEFT JOIN entry_logs el ON tp.id = el.ticket_purchase_id
        INNER JOIN public.users u ON tp.user_id = u.id
        LEFT JOIN auth.users au ON u.id = au.id
        WHERE tp.id = @ticketPurchaseId
          AND u.deleted_at IS NULL
        GROUP BY
          tp.id, tt.id, el.ticket_purchase_id, el.created_at, u.id, au.raw_user_meta_data
        LIMIT 1
      ''',
      parameters: {
        'ticketPurchaseId': ticketPurchaseId,
      },
    );

    if (result.isEmpty) {
      return null;
    }

    return TicketPurchaseWithDetailsAndUser.fromJson(
      result.first.toColumnMap(),
    );
  }
}
