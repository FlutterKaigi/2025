import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// 管理者用チケットアイテム
class AdminTicketItem extends StatelessWidget {
  const AdminTicketItem({
    required this.ticket,
    required this.onTap,
    super.key,
  });

  final TicketItemWithUser ticket;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final dateFormat = DateFormat('yyyy/MM/dd HH:mm');

    return Card.outlined(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox.square(
                    dimension: 56,
                    child: AccountCircleImage(
                      imageUrl: ticket.user.authMetaData.avatarUrl ?? '',
                      imageSize: 56,
                      circleRadius: 28,
                      errorIconSize: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ticket.user.authMetaData.name ??
                              ticket.user.authMetaData.email ??
                              'Unknown',
                          style: textTheme.titleMedium,
                        ),
                        if (ticket.user.authMetaData.email != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            ticket.user.authMetaData.email!,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ticket.ticketType.name,
                          style: textTheme.titleSmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '¥${ticket.ticketType.price.toString()}',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _TicketStatusBadge(
                    ticket: ticket,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    dateFormat.format(
                      (switch (ticket) {
                        TicketPurchaseItemWithUser(:final purchase) =>
                          purchase.createdAt,
                        TicketCheckoutItemWithUser(:final checkout) =>
                          checkout.createdAt,
                      }).toLocal(),
                    ),
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              if (ticket is TicketPurchaseItemWithUser &&
                  (ticket as TicketPurchaseItemWithUser)
                      .purchase
                      .entryLog !=
                      null) ...[
                const SizedBox(height: 8),
                Chip(
                  label: const Text('入場済み'),
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TicketStatusBadge extends StatelessWidget {
  const _TicketStatusBadge({
    required this.ticket,
    required this.colorScheme,
    required this.textTheme,
  });

  final TicketItemWithUser ticket;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (ticket) {
      TicketPurchaseItemWithUser(:final purchase) => switch (purchase.status) {
          TicketPurchaseStatus.completed => ('購入済み', Colors.green),
          TicketPurchaseStatus.refunded => ('返金済み', Colors.red),
        },
      TicketCheckoutItemWithUser(:final checkout) => ('決済中', Colors.orange),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
