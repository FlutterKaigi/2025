import 'package:db_types/db_types.dart';
import 'package:postgres/postgres.dart';

class TicketOptionDbClient {
  TicketOptionDbClient({required Connection connection})
    : _connection = connection;

  final Connection _connection;

  /// 指定されたチケットタイプのオプション一覧を取得
  Future<List<TicketOptions>> getTicketOptions(String ticketTypeId) async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT *
        FROM ticket_options
        WHERE ticket_type_id = @ticketTypeId
        ORDER BY created_at ASC
      '''),
      parameters: {'ticketTypeId': ticketTypeId},
    );

    return result
        .map((row) => TicketOptions.fromJson(row.toColumnMap()))
        .toList();
  }
}
