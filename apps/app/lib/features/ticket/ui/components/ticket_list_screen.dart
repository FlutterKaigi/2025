import 'package:app/core/designsystem/components/error_view.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/ticket/data/provider/ticket_items_provider.dart';
import 'package:app/features/ticket/ui/components/ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TicketListScreen extends ConsumerWidget {
  const TicketListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final status = ref.watch(ticketItemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('お持ちのチケット'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: colorScheme.onPrimaryContainer,
                backgroundColor: colorScheme.primaryContainer,
              ),
              onPressed: () =>
                  const AvailableTicketListRoute().push<void>(context),
              icon: const Icon(Icons.add),
              label: const Text('購入'),
            ),
          ),
        ],
      ),
      body: status.when(
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stackTrace) => ErrorView(
          error: error,
          onRetry: () => ref.invalidate(ticketItemsProvider),
          isRetrying: ref.watch(ticketItemsProvider.select((v) => v.isLoading)),
        ),
        data: (tickets) {
          if (tickets.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'チケットが見つかりませんでした',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final ticket = tickets[index];
              return TicketCard(ticket: ticket);
            },
          );
        },
      ),
    );
  }
}
