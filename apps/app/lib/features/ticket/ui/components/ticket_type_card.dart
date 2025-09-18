import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/ticket/ui/components/ticket_card_description.dart';
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
    final t = Translations.of(context);
    final priceText =
        '¥${NumberFormat.decimalPattern().format(ticketType.price)}';

    return Card.outlined(
      color: colorScheme.surfaceContainer,
      margin: const EdgeInsets.only(bottom: 16),
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
                        TicketCardDescription(
                          description: ticketType.description!,
                          color: colorScheme.onSurface,
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
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton.icon(
                  icon: switch (ticketType.status) {
                    TicketStatusNotSelling() || TicketStatusSoldOut() => null,
                    TicketStatusSelling() => const Icon(Icons.shopping_cart),
                  },
                  label: switch (ticketType.status) {
                    TicketStatusNotSelling() => Text(
                      t.ticket.purchase.notSelling,
                    ),
                    TicketStatusSoldOut() => Text(t.ticket.purchase.soldOut),
                    TicketStatusSelling() => Text(t.ticket.purchase.proceed),
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
