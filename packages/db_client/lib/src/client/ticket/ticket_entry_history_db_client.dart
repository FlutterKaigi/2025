import 'package:db_client/db_client.dart';
import 'package:db_types/db_types.dart';

class TicketEntryHistoryDbClient {
  TicketEntryHistoryDbClient({required Executor executor}) : _executor = executor;

  final Executor _executor;

  /// チケット購入IDから入場履歴を取得
  Future<TicketEntryHistories?> getEntryHistoryByTicketPurchaseId(
    String ticketPurchaseId,
  ) async {
    final result = await _executor.execute(
      '''
        SELECT *
        FROM ticket_entry_histories
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

    return TicketEntryHistories.fromJson(row.toColumnMap());
  }

  /// 入場履歴を作成
  Future<TicketEntryHistories> createEntryHistory(
    String ticketPurchaseId,
    DateTime enteredAt,
  ) async {
    final result = await _executor.execute(
      '''
        INSERT INTO ticket_entry_histories (id, entered_at)
        VALUES (@ticket_purchase_id, @entered_at)
        RETURNING *
      ''',
      parameters: {
        'ticket_purchase_id': ticketPurchaseId,
        'entered_at': enteredAt,
      },
    );

    final row = result.first;
    return TicketEntryHistories.fromJson(row.toColumnMap());
  }
}
