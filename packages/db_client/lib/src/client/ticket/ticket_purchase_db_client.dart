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

  /// チケット購入情報をIDで取得
  Future<TicketPurchases?> getTicketPurchaseById(
    String ticketPurchaseId,
  ) async {
    final result = await _executor.execute(
      '''
        SELECT *, status::text AS "status"
        FROM ticket_purchases
        WHERE id = @ticketPurchaseId
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

  /// チケット購入のステータスをrefundedに更新
  Future<TicketPurchases> updateTicketPurchaseStatusToRefunded(
    String ticketPurchaseId,
  ) async {
    final result = await _executor.execute(
      '''
        UPDATE ticket_purchases
        SET status = 'refunded'::ticket_purchase_status, updated_at = NOW()
        WHERE id = @ticketPurchaseId
        RETURNING *, status::text AS "status"
      ''',
      parameters: {
        'ticketPurchaseId': ticketPurchaseId,
      },
    );

    if (result.isEmpty) {
      throw Exception('Ticket purchase not found: $ticketPurchaseId');
    }

    return TicketPurchases.fromJson(result.first.toColumnMap());
  }
}
