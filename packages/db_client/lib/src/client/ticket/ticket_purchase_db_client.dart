import 'package:db_types/db_types.dart';
import 'package:postgres/postgres.dart';

class TicketPurchaseDbClient {
  TicketPurchaseDbClient({required Connection connection})
    : _connection = connection;

  final Connection _connection;

  /// ユーザーの特定チケットタイプの購入情報をすべて取得
  /// 複数の購入記録がある場合はすべて返す（作成日時の降順）
  Future<List<TicketPurchases>> getUserTicketPurchase(
    String userId,
    String ticketTypeId,
  ) async {
    final result = await _connection.execute(
      Sql.named('''
        SELECT *, status::text AS "status"
        FROM ticket_purchases
        WHERE user_id = @userId AND ticket_type_id = @ticketTypeId
        ORDER BY created_at DESC
      '''),
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
    final result = await _connection.execute(
      Sql.named('''
        SELECT *, status::text AS "status"
        FROM ticket_purchases
        WHERE user_id = @userId
        ORDER BY created_at DESC
      '''),
      parameters: {
        'userId': userId,
      },
    );

    return result
        .map((row) => TicketPurchases.fromJson(row.toColumnMap()))
        .toList();
  }
}
