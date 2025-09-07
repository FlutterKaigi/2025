import 'package:app/features/ticket/data/notifier/ticket_notifier.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    required this.ticket,
    super.key,
  });

  final TicketItem ticket;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card.outlined(
      color: colorScheme.surfaceContainer,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            _TicketHeader(ticket: ticket),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  ticket.ticketType.name,
                  style: theme.textTheme.titleLarge,
                ),
                if (ticket.ticketType.description?.isNotEmpty ?? false)
                  Text(
                    ticket.ticketType.description!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
            if (ticket.options.isNotEmpty)
              _TicketOptions(options: ticket.options),
            _TicketDateInfo(ticket: ticket),
            if (ticket case final TicketCheckoutItem checkout)
              _TicketCheckoutButtons(ticket: checkout),
          ],
        ),
      ),
    );
  }
}

class _TicketHeader extends StatelessWidget {
  const _TicketHeader({
    required this.ticket,
  });

  final TicketItem ticket;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final color = switch (ticket) {
      TicketPurchaseItem() => colorScheme.primary,
      TicketCheckoutItem() => colorScheme.primaryContainer,
    };
    final icon = switch (ticket) {
      TicketPurchaseItem() => Icons.check_circle,
      TicketCheckoutItem() => Icons.hourglass_empty,
    };
    final onColor = switch (ticket) {
      TicketPurchaseItem() => colorScheme.onPrimary,
      TicketCheckoutItem() => colorScheme.onPrimaryContainer,
    };
    final label = switch (ticket) {
      TicketPurchaseItem() => '購入済み',
      TicketCheckoutItem() => '決済待ち',
    };

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16,
                color: onColor,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: onColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Text(
          '¥${NumberFormat.decimalPattern().format(ticket.ticketType.price)}',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

class _TicketOptions extends StatelessWidget {
  const _TicketOptions({
    required this.options,
  });

  final List<TicketOption> options;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          'オプション:',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        ...options.map(
          (option) => Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              spacing: 8,
              children: [
                Icon(
                  Icons.circle,
                  size: 4,
                  color: colorScheme.onSurfaceVariant,
                ),
                Expanded(
                  child: Text(
                    option.name,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TicketDateInfo extends StatelessWidget {
  const _TicketDateInfo({
    required this.ticket,
  });

  final TicketItem ticket;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final dateFormat = DateFormat('yyyy/MM/dd HH:mm');

    return switch (ticket) {
      TicketPurchaseItem(:final purchase) => Row(
        spacing: 4,
        children: [
          Icon(
            Icons.schedule,
            size: 16,
            color: colorScheme.onSurfaceVariant,
          ),
          Text(
            '購入日時: ${dateFormat.format(purchase.createdAt.toLocal())}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      TicketCheckoutItem(:final checkout) => Row(
        spacing: 4,
        children: [
          Icon(
            Icons.access_time,
            size: 16,
            color: colorScheme.error,
          ),
          Text(
            '期限: ${dateFormat.format(checkout.expiresAt.toLocal())}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.error,
            ),
          ),
        ],
      ),
    };
  }
}

class _TicketCheckoutButtons extends ConsumerWidget {
  const _TicketCheckoutButtons({
    required this.ticket,
  });

  final TicketCheckoutItem ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 8,
      children: [
        OutlinedButton.icon(
          onPressed: () => ref
              .read(ticketNotifierProvider.notifier)
              .cancelCheckout(ticket.checkout.id),
          label: const Text('キャンセル'),
          icon: const Icon(Icons.cancel),
        ),
        FilledButton.icon(
          onPressed: () {},
          label: const Text('決済へ進む'),
          icon: const Icon(Icons.payment),
        ),
      ],
    );
  }
}
