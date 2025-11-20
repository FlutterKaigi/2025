import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/ticket/data/notifier/ticket_notifier.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 入場可能なチケットを表示するカード
class EntryTicketCard extends ConsumerWidget {
  const EntryTicketCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketAsync = ref.watch(ticketProvider);

    // データが取得できない場合は何も表示しない
    return ticketAsync.when(
      data: (tickets) {
        // 入場可能なチケットのみフィルタリング
        final entryTickets = tickets
            .whereType<TicketPurchaseItem>()
            .where((ticket) => ticket.ticketType.isEntryAllowed)
            .toList();

        // 入場可能なチケットがない場合は何も表示しない
        if (entryTickets.isEmpty) {
          return const SizedBox.shrink();
        }

        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final t = Translations.of(context);

        return Card.outlined(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primaryContainer,
                  colorScheme.primaryContainer.withValues(alpha: 0.8),
                ],
              ),
            ),
            child: ListTile(
              leading: Icon(
                Icons.confirmation_number,
                color: colorScheme.onPrimaryContainer,
              ),
              title: Text(
                t.ticket.entryTicket.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                t.ticket.entryTicket.subtitle(
                  count: entryTickets.length,
                ),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onPrimaryContainer.withValues(
                    alpha: 0.9,
                  ),
                ),
              ),
              trailing: const Icon(Icons.arrow_right),
              onTap: () => const TicketRoute().go(context),
            ),
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
