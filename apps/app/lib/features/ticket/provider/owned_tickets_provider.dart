import 'package:app/features/ticket/data/ticket_repository.dart';
import 'package:db_types/db_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'owned_tickets_provider.g.dart';

/// 保有チケットの状態管理
///
/// 機能:
/// - ユーザーの購入済みチケット情報を取得・表示
/// - チケット詳細情報の管理
/// - 認証が必要
@riverpod
Future<List<TicketPurchases>> ownedTickets(Ref ref) async {
  final ticketRepository = ref.watch(ticketRepositoryProvider);

  try {
    final userTickets = await ticketRepository.getUserTickets();

    // 購入完了（completed）のチケットのみを抽出
    return userTickets.tickets
        .where((ticket) => ticket.status == TicketPurchaseStatus.completed)
        .toList();
  } catch (error) {
    throw Exception('保有チケットの取得に失敗しました: $error');
  }
}
