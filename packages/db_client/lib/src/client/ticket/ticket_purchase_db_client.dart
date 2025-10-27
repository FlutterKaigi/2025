import 'package:db_client/db_client.dart';
import 'package:db_types/db_types.dart';

class TicketPurchaseDbClient {
  TicketPurchaseDbClient({required Executor executor}) : _executor = executor;

  final Executor _executor;

  /// チケット購入情報を取得
  Future<TicketPurchases?> getTicketPurchaseById(String ticketPurchaseId) async {
    final result = await _executor.execute(
      '''
        SELECT *, status::text AS "status"
        FROM ticket_purchases
        WHERE id = @ticket_purchase_id
        LIMIT 1
      ''',
      parameters: {
        'ticket_purchase_id': ticketPurchaseId,
      },
    );

    final row = result.firstOrNull;
    if (row == null) {
      return null;
    }

    return TicketPurchases.fromJson(row.toColumnMap());
  }

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
}
