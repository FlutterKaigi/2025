import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TicketTypeCard extends StatelessWidget {
  const TicketTypeCard({
    required this.ticketTypeItem,
    this.onCheckoutButtonPressed,
    super.key,
  });

  final TicketTypeWithOptionsItem ticketTypeItem;
  final VoidCallback? onCheckoutButtonPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final ticketType = ticketTypeItem.ticketType;

    // アクティブでないチケットは表示しない
    if (!ticketType.isActive) {
      return const SizedBox.shrink();
    }

    final priceText =
        '¥${NumberFormat.decimalPattern().format(ticketType.price)}';

    return Card.outlined(
      color: colorScheme.surfaceContainer,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticketType.name,
                        style: theme.textTheme.titleLarge,
                      ),
                      if (ticketType.description?.isNotEmpty ?? false) ...[
                        const SizedBox(height: 8),
                        Text(
                          ticketType.description!,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  priceText,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            if (ticketType.maxQuantity != null)
              Text(
                '販売枚数: ${ticketType.maxQuantity}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            if (onCheckoutButtonPressed != null)
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('購入する'),
                  onPressed: onCheckoutButtonPressed,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
