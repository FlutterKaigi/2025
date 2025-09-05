import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
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

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, ticket, theme, colorScheme),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ticket.ticketType.name,
                  style: theme.textTheme.titleLarge,
                ),
                if (ticket.ticketType.description?.isNotEmpty ?? false) ...[
                  const SizedBox(height: 4),
                  Text(
                    ticket.ticketType.description!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
            if (ticket.options.isNotEmpty) ...[
              const SizedBox(height: 12),
              _buildOptions(context, ticket.options, theme, colorScheme),
            ],
            const SizedBox(height: 12),
            _buildDateInfo(context, ticket, theme, colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    TicketItem ticket,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
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
          '¥${ticket.ticketType.price.toStringAsFixed(0)}',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildOptions(
    BuildContext context,
    List<TicketOption> options,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'オプション:',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        ...options.map(
          (option) => Padding(
            padding: const EdgeInsets.only(left: 16, top: 4),
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 4,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
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

  Widget _buildDateInfo(
    BuildContext context,
    TicketItem ticket,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final dateFormat = DateFormat('yyyy/MM/dd HH:mm');

    return switch (ticket) {
      TicketPurchaseItem(:final purchase) => Row(
        children: [
          Icon(
            Icons.schedule,
            size: 16,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            '購入日時: ${dateFormat.format(purchase.createdAt.toLocal())}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      TicketCheckoutItem(:final checkout) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.access_time,
                size: 16,
                color: colorScheme.error,
              ),
              const SizedBox(width: 4),
              Text(
                '期限: ${dateFormat.format(checkout.expiresAt.toLocal())}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.error,
                ),
              ),
            ],
          ),
        ],
      ),
    };
  }
}
