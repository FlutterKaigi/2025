import 'package:dashboard/features/ticket/data/ticket_repository.dart';
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

/// 保有チケットの監視と操作
@riverpod
class OwnedTicketsNotifier extends _$OwnedTicketsNotifier {
  @override
  Future<List<TicketPurchases>> build() async {
    return ref.watch(ownedTicketsProvider.future);
  }

  /// 保有チケット数を取得
  int getTicketCount() {
    return state.when(
      data: (tickets) => tickets.length,
      loading: () => 0,
      error: (_, __) => 0,
    );
  }

  /// 特定の種別のチケットを保有しているかチェック
  bool hasTicketType(String ticketTypeId) {
    return state.when(
      data: (tickets) =>
          tickets.any((ticket) => ticket.ticketTypeId == ticketTypeId),
      loading: () => false,
      error: (_, __) => false,
    );
  }

  /// 特定の種別のチケット数を取得
  int getTicketCountByType(String ticketTypeId) {
    return state.when(
      data: (tickets) =>
          tickets.where((ticket) => ticket.ticketTypeId == ticketTypeId).length,
      loading: () => 0,
      error: (_, __) => 0,
    );
  }

  /// 最新の購入チケットを取得
  TicketPurchases? getLatestTicket() {
    return state.when(
      data: (tickets) {
        if (tickets.isEmpty) {
          return null;
        }

        // 作成日時でソートして最新のものを取得
        final sortedTickets = List<TicketPurchases>.from(tickets)
          ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

        return sortedTickets.first;
      },
      loading: () => null,
      error: (_, __) => null,
    );
  }

  /// 保有チケット情報を手動で再取得
  Future<void> refresh() async {
    ref.invalidate(ownedTicketsProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(ownedTicketsProvider.future));
  }

  /// チケット購入日時でグループ化
  Map<DateTime, List<TicketPurchases>> groupByPurchaseDate() {
    return state.when(
      data: (tickets) {
        final grouped = <DateTime, List<TicketPurchases>>{};

        for (final ticket in tickets) {
          // 日付のみを取得（時間は無視）
          final date = DateTime(
            ticket.createdAt.year,
            ticket.createdAt.month,
            ticket.createdAt.day,
          );

          if (grouped.containsKey(date)) {
            grouped[date]!.add(ticket);
          } else {
            grouped[date] = [ticket];
          }
        }

        return grouped;
      },
      loading: () => {},
      error: (_, __) => {},
    );
  }
}
