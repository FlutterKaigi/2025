import 'package:db_client/db_client.dart';
import 'package:db_types/db_types.dart';
import 'package:postgres/postgres.dart';

class EntryLogDbClient {
  EntryLogDbClient({required Executor executor}) : _executor = executor;

  final Executor _executor;

  /// 入場履歴を追加/更新
  Future<EntryLogs> upsertEntryLog(String ticketPurchaseId) async {
    final result = await _executor.runTx((tx) async {
      await tx.execute(
        Sql.named('''
          INSERT INTO entry_logs (ticket_purchase_id, created_at)
          VALUES (@ticketPurchaseId, now())
          ON CONFLICT (ticket_purchase_id)
          DO UPDATE SET created_at = now()
        '''),
        parameters: {
          'ticketPurchaseId': ticketPurchaseId,
        },
      );
      return tx.execute(
        Sql.named('''
          SELECT ticket_purchase_id, created_at
          FROM entry_logs
          WHERE ticket_purchase_id = @ticketPurchaseId
        '''),
        parameters: {
          'ticketPurchaseId': ticketPurchaseId,
        },
      );
    });
    if (result.isEmpty) {
      throw Exception('EntryLog not found: $ticketPurchaseId');
    }
    return EntryLogs.fromJson(result.first.toColumnMap());
  }

  /// 入場履歴を削除
  Future<void> deleteEntryLog(String ticketPurchaseId) async {
    await _executor.execute(
      '''
        DELETE FROM entry_logs
        WHERE ticket_purchase_id = @ticketPurchaseId
      ''',
      parameters: {
        'ticketPurchaseId': ticketPurchaseId,
      },
    );
  }

  /// チケット購入IDで入場履歴を取得
  Future<EntryLogs?> getEntryLogByTicketPurchaseId(
    String ticketPurchaseId,
  ) async {
    final result = await _executor.execute(
      '''
        SELECT ticket_purchase_id, created_at
        FROM entry_logs
        WHERE ticket_purchase_id = @ticketPurchaseId
        LIMIT 1
      ''',
      parameters: {
        'ticketPurchaseId': ticketPurchaseId,
      },
    );
    if (result.isEmpty) {
      return null;
    }
    return EntryLogs.fromJson(result.first.toColumnMap());
  }
}
