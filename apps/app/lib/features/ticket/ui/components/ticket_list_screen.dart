import 'package:app/core/designsystem/components/error_view.dart';
import 'package:app/features/ticket/data/provider/ticket_items_provider.dart';
import 'package:app/features/ticket/data/provider/ticket_types_provider.dart';
import 'package:app/features/ticket/ui/components/ticket_card.dart';
import 'package:app/features/ticket/ui/components/ticket_type_card.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TicketListScreen extends ConsumerWidget {
  const TicketListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketItemsStatus = ref.watch(ticketItemsProvider);
    final ticketTypesStatus = ref.watch(ticketTypesProvider);

    const loading = Center(
      child: CircularProgressIndicator.adaptive(),
    );

    return ticketItemsStatus.when(
      loading: () => loading,
      error: (error, stackTrace) => ErrorView(
        error: error,
        onRetry: () => ref.invalidate(ticketItemsProvider),
        isRetrying: ref.watch(ticketItemsProvider.select((v) => v.isLoading)),
      ),
      data: (tickets) => ticketTypesStatus.when(
        loading: () => loading,
        error: (error, stackTrace) => ErrorView(
          error: error,
          onRetry: () => ref.invalidate(ticketTypesProvider),
          isRetrying: ref.watch(ticketTypesProvider.select((v) => v.isLoading)),
        ),
        data: (ticketTypes) => Scaffold(
          appBar: AppBar(
            title: const Text('チケット一覧'),
          ),
          body: _TicketsListView(
            tickets: tickets,
            ticketTypes: ticketTypes,
            onRefresh: () async {
              await (
                ref.refresh(ticketItemsProvider.future),
                ref.refresh(ticketTypesProvider.future),
              ).wait;
            },
          ),
        ),
      ),
    );
  }
}

class _TicketsListView extends HookWidget {
  const _TicketsListView({
    required this.tickets,
    required this.ticketTypes,
    required this.onRefresh,
  });

  final List<TicketItem> tickets;
  final List<TicketTypeWithOptionsItem> ticketTypes;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    // 未購入のチケット種別一覧
    final notPurchasedTicketTypes = useMemoized(
      () => ticketTypes
          .where(
            (ticketType) => !tickets.any(
              (ticket) => ticket.ticketType.id == ticketType.ticketType.id,
            ),
          )
          .toList(),
      [tickets, ticketTypes],
    );

    return RefreshIndicator.adaptive(
      onRefresh: onRefresh,
      child: CustomScrollView(
        slivers: [
          if (tickets.isNotEmpty)
            SliverList.builder(
              itemBuilder: (context, index) =>
                  TicketCard(ticket: tickets[index]),
              itemCount: tickets.length,
            ),
          if (notPurchasedTicketTypes.isNotEmpty)
            SliverList.builder(
              itemBuilder: (context, index) => TicketTypeCard(
                ticketTypeItem: notPurchasedTicketTypes[index],
              ),
              itemCount: notPurchasedTicketTypes.length,
            ),
        ],
      ),
    );
  }
}
