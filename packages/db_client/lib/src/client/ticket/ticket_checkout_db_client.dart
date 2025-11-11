import 'package:db_client/src/client/db_client.dart';
import 'package:db_types/db_types.dart';
import 'package:postgres/postgres.dart';

class TicketCheckoutDbClient {
  TicketCheckoutDbClient({required Executor executor}) : _executor = executor;

  final Executor _executor;

  Future<TicketCheckoutSessions?> getTicketCheckout(String checkoutId) async {
    final result = await _executor.execute(
      '''
        SELECT *, status::text AS "status"
        FROM ticket_checkout_sessions WHERE id = @checkoutId
        LIMIT 1
      ''',
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
    final result = await _executor.runTx((tx) async {
      await tx.execute(
        Sql.named('''
          UPDATE ticket_checkout_sessions
          SET status = 'expired', updated_at = now(), expires_at = now()
          WHERE id = @checkoutId AND status = 'pending';
        '''),
        parameters: {
          'checkoutId': checkoutId,
        },
      );
      return tx.execute(
        Sql.named('''
          SELECT *, status::text AS "status"
          FROM ticket_checkout_sessions WHERE id = @checkoutId;
        '''),
        parameters: {
          'checkoutId': checkoutId,
        },
      );
    });
    if (result.isEmpty) {
      throw Exception('TicketCheckout not found: $checkoutId');
    }
    return TicketCheckoutSessions.fromJson(result.first.toColumnMap());
  }

  /// ユーザのすべてのチケット情報を取得する
  /// 完了済みのチケット購入とアクティブなチェックアウトセッションの両方を含む
  Future<List<TicketPurchaseWithDetails>> getUserAllTicketsWithDetails({
    required String userId,
  }) async {
    final result = await _executor.execute(
      '''
        -- 完了済みのチケット購入情報
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
          tp.created_at as sort_date
        FROM ticket_purchases tp
        INNER JOIN ticket_types tt ON tp.ticket_type_id = tt.id
        LEFT JOIN ticket_purchase_options tpo ON tp.id = tpo.ticket_purchase_id
        LEFT JOIN ticket_options topt ON tpo.ticket_option_id = topt.id
        LEFT JOIN entry_logs el ON tp.id = el.ticket_purchase_id
        WHERE tp.user_id = @userId
        GROUP BY
          tp.id, tt.id, el.ticket_purchase_id, el.created_at
        UNION ALL

        -- アクティブなチェックアウトセッション情報
        SELECT
          NULL::json AS purchase,
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
          NULL::json AS entry_log,
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
      ''',
      parameters: {
        'userId': userId,
      },
    );

    return result.map((row) {
      return TicketPurchaseWithDetails.fromJson(row.toColumnMap());
    }).toList();
  }

  /// チケット一覧を検索する（管理者用）
  /// User情報もJOINで一度に取得してN+1問題を回避
  Future<List<TicketPurchaseWithDetailsAndUser>> getTicketList({
    required int limit,
    required int offset,
    String? userId,
    String? ticketTypeId,
    String? status,
    bool? hasEntryLog,
    String? ticketOptionId,
  }) async {
    final queryBuffer = StringBuffer();
    final parameters = <String, dynamic>{
      'limit': limit,
      'offset': offset,
    };
    final purchaseConditions = <String>[];
    final checkoutConditions = <String>[];

    queryBuffer.write('''
        WITH purchase_tickets AS (
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
              'user', to_json(u.*),
              'roles', COALESCE(json_agg(ur.role) FILTER (WHERE ur.role IS NOT NULL), '[]'::json),
              'auth_meta_data', COALESCE(au.raw_user_meta_data, '{}'::jsonb)
            ) AS user,
            tp.created_at as sort_date
          FROM ticket_purchases tp
          INNER JOIN ticket_types tt ON tp.ticket_type_id = tt.id
          LEFT JOIN ticket_purchase_options tpo ON tp.id = tpo.ticket_purchase_id
          LEFT JOIN ticket_options topt ON tpo.ticket_option_id = topt.id
          LEFT JOIN entry_logs el ON tp.id = el.ticket_purchase_id
          INNER JOIN public.users u ON tp.user_id = u.id
          LEFT JOIN public.user_roles ur ON u.id = ur.user_id
          LEFT JOIN auth.users au ON u.id = au.id
    ''');

    if (userId != null) {
      purchaseConditions.add('tp.user_id = @userId');
      parameters['userId'] = userId;
    }
    if (ticketTypeId != null) {
      purchaseConditions.add('tp.ticket_type_id = @ticketTypeId');
      parameters['ticketTypeId'] = ticketTypeId;
    }
    if (status != null) {
      // statusが'completed'または'refunded'の場合のみpurchaseに条件を追加
      if (status == 'completed' || status == 'refunded') {
        purchaseConditions.add('tp.status::text = @status');
        parameters['status'] = status;
      }
    }
    if (hasEntryLog != null) {
      if (hasEntryLog) {
        purchaseConditions.add('el.ticket_purchase_id IS NOT NULL');
      } else {
        purchaseConditions.add('el.ticket_purchase_id IS NULL');
      }
    }
    if (ticketOptionId != null) {
      purchaseConditions.add('topt.id = @ticketOptionId');
      parameters['ticketOptionId'] = ticketOptionId;
    }
    purchaseConditions.add('u.deleted_at IS NULL');

    if (purchaseConditions.isNotEmpty) {
      queryBuffer.write('\nWHERE ${purchaseConditions.join(' AND ')}');
    }

    queryBuffer.write('''
          GROUP BY
            tp.id, tt.id, el.ticket_purchase_id, el.created_at, u.id, au.raw_user_meta_data
        ),
        checkout_tickets AS (
          SELECT
            NULL::json AS purchase,
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
            NULL::json AS entry_log,
            json_build_object(
              'user', to_json(u.*),
              'roles', COALESCE(json_agg(ur.role) FILTER (WHERE ur.role IS NOT NULL), '[]'::json),
              'auth_meta_data', COALESCE(au.raw_user_meta_data, '{}'::jsonb)
            ) AS user,
            tcs.created_at as sort_date
          FROM ticket_checkout_sessions tcs
          INNER JOIN ticket_types tt ON tcs.ticket_type_id = tt.id
          LEFT JOIN ticket_checkout_options tco ON tcs.id = tco.checkout_session_id
          LEFT JOIN ticket_options topt ON tco.ticket_option_id = topt.id
          INNER JOIN public.users u ON tcs.user_id = u.id
          LEFT JOIN public.user_roles ur ON u.id = ur.user_id
          LEFT JOIN auth.users au ON u.id = au.id
    ''');

    if (userId != null) {
      checkoutConditions.add('tcs.user_id = @userId');
    }
    if (ticketTypeId != null) {
      checkoutConditions.add('tcs.ticket_type_id = @ticketTypeId');
    }
    if (status != null) {
      // statusが'pending', 'completed', 'expired'の場合のみcheckoutに条件を追加
      if (status == 'pending' || status == 'completed' || status == 'expired') {
        checkoutConditions.add('tcs.status::text = @status');
        if (!parameters.containsKey('status')) {
          parameters['status'] = status;
        }
      }
    }
    if (ticketOptionId != null) {
      checkoutConditions.add('topt.id = @ticketOptionId');
    }
    checkoutConditions.add('u.deleted_at IS NULL');

    if (checkoutConditions.isNotEmpty) {
      queryBuffer.write('\nWHERE ${checkoutConditions.join(' AND ')}');
    }

    queryBuffer.write('''
          GROUP BY
            tcs.id, tt.id, u.id, au.raw_user_meta_data
        )
        SELECT * FROM (
          SELECT * FROM purchase_tickets
          UNION ALL
          SELECT * FROM checkout_tickets
        ) AS all_tickets
        ORDER BY sort_date DESC
        LIMIT @limit OFFSET @offset
    ''');

    final result = await _executor.execute(
      queryBuffer.toString(),
      parameters: parameters,
    );

    return result.map((row) {
      return TicketPurchaseWithDetailsAndUser.fromJson(row.toColumnMap());
    }).toList();
  }
}
