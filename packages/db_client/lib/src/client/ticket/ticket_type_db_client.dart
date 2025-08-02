import 'package:db_types/db_types.dart';
import 'package:postgres/postgres.dart';

class TicketTypeDbClient {
  TicketTypeDbClient({required Connection connection})
    : _connection = connection;

  final Connection _connection;

  /// アクティブなチケットタイプ一覧を取得
  Future<List<TicketTypes>> getActiveTicketTypes() async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT *
        FROM ticket_types
        WHERE is_active = true
        ORDER BY created_at ASC
      '''),
    );

    return result
        .map((row) => TicketTypes.fromJson(row.toColumnMap()))
        .toList();
  }

  /// 指定されたIDのチケットタイプを取得
  Future<TicketTypes?> getTicketType(String ticketTypeId) async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT *
        FROM ticket_types
        WHERE id = @ticketTypeId
      '''),
      parameters: {'ticketTypeId': ticketTypeId},
    );

    if (result.isEmpty) {
      return null;
    }

    return TicketTypes.fromJson(result.first.toColumnMap());
  }

  /// アクティブなチケットタイプとオプションを一括取得
  Future<List<TicketTypeWithOptions>> getActiveTicketTypesWithOptions() async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT
          to_json(tt.*) AS ticket_type,
          COALESCE(json_agg(to_json(topt.*) ORDER BY topt.created_at) FILTER (WHERE topt.id IS NOT NULL), '[]'::json) AS options
        FROM
          ticket_types AS tt
          LEFT JOIN ticket_options AS topt ON tt.id = topt.ticket_type_id
        WHERE
          tt.is_active = true
        GROUP BY tt.id, tt.created_at
        ORDER BY tt.created_at ASC
      '''),
    );

    return result
        .map((row) => TicketTypeWithOptions.fromJson(row.toColumnMap()))
        .toList();
  }

  /// アクティブなチケットタイプとオプションを在庫数とともに一括取得
  Future<List<TicketTypeWithOptionsAndCounts>>
  getActiveTicketTypesWithOptionsAndCounts() async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT
          to_json(tt.*) AS ticket_type,
          vtc.sold_count,
          vtc.reserved_count,
          COALESCE(
            json_agg(
              json_build_object(
                'ticket_option', to_json(topt.*),
                'sold_count', vtoc.sold_count,
                'reserved_count', vtoc.reserved_count
              ) ORDER BY topt.created_at
            ) FILTER (WHERE topt.id IS NOT NULL),
            '[]'::json
          ) AS options
        FROM
          ticket_types AS tt
          JOIN v_ticket_counts vtc ON tt.id = vtc.ticket_type_id
          LEFT JOIN ticket_options AS topt ON tt.id = topt.ticket_type_id
          LEFT JOIN v_ticket_option_counts vtoc ON topt.id = vtoc.ticket_option_id
        WHERE
          tt.is_active = true
        GROUP BY tt.id, tt.created_at, vtc.sold_count, vtc.reserved_count
        ORDER BY tt.created_at ASC
      '''),
    );

    return result
        .map(
          (row) => TicketTypeWithOptionsAndCounts.fromJson(row.toColumnMap()),
        )
        .toList();
  }
}
