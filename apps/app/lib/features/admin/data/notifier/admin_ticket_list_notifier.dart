import 'package:app/core/api/api_exception.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:app/features/admin/data/model/admin_ticket_list_search_params.dart';
import 'package:app/features/admin/data/model/admin_ticket_list_state.dart';
import 'package:bff_client/bff_client.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_ticket_list_notifier.g.dart';

/// チケット一覧を管理するNotifier（ページネーション対応）
@riverpod
class AdminTicketList extends _$AdminTicketList {
  static const _limit = 100;

  AdminTicketListSearchParams? _searchParams;

  @override
  Future<AdminTicketListState> build(
    AdminTicketListSearchParams searchParams,
  ) async {
    _searchParams = searchParams;
    final client = ref.watch(bffClientProvider);
    final response = await ApiException.transform(
      () => client.v1.tickets.getTicketList(
        limit: _limit,
        offset: 0,
        userId: searchParams.userId,
        ticketTypeId: searchParams.ticketTypeId,
        status: searchParams.status,
        hasEntryLog: searchParams.hasEntryLog?.toString(),
      ),
    );
    return AdminTicketListState(
      tickets: response.data.tickets,
      hasMore: response.data.tickets.length >= _limit,
    );
  }

  static final pagingMutation = Mutation<List<TicketItemWithUser>>();

  /// 次のページを読み込む
  Future<void> loadMore() async {
    final isLoading = ref.read(
      AdminTicketList.pagingMutation.select((v) => v.isPending),
    );
    if (isLoading) {
      return;
    }
    final currentTickets = state.requireValue.tickets;
    final searchParams = _searchParams;
    if (searchParams == null) {
      return;
    }

    state = await AsyncValue.guard(() async {
      final newTickets = await AdminTicketList.pagingMutation.run(
        ref,
        (tsx) async {
          final client = tsx.get(bffClientProvider);
          final response = await ApiException.transform(
            () => client.v1.tickets.getTicketList(
              limit: _limit,
              offset: currentTickets.length,
              userId: searchParams.userId,
              ticketTypeId: searchParams.ticketTypeId,
              status: searchParams.status,
              hasEntryLog: searchParams.hasEntryLog?.toString(),
            ),
          );
          return response.data.tickets;
        },
      );
      return AdminTicketListState(
        tickets: [...currentTickets, ...newTickets],
        hasMore: newTickets.length >= _limit,
      );
    });
  }
}
