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
              spacing: 16,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        ticketType.name,
                        style: theme.textTheme.titleLarge,
                      ),
                      if (ticketType.description?.isNotEmpty ?? false)
                        Text(
                          ticketType.description!,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
                Text(
                  priceText,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            if (onCheckoutButtonPressed != null)
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  icon: const Icon(Icons.add),
                  label: switch (ticketType.status) {
                    TicketStatusNotSelling() => const Text('販売終了'),
                    TicketStatusSoldOut() => const Text('完売'),
                    TicketStatusSelling() => const Text('購入する'),
                  },
                  onPressed: switch ((
                    ticketType.status,
                    onCheckoutButtonPressed,
                  )) {
                    (_, null) => null,
                    (TicketStatusNotSelling(), _) ||
                    (TicketStatusSoldOut(), _) => null,
                    (TicketStatusSelling(), _) => onCheckoutButtonPressed,
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
