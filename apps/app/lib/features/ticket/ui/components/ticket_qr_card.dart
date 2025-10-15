import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketQrCard extends HookConsumerWidget {
  const TicketQrCard({required this.item, super.key});

  final TicketPurchaseItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!item.ticketType.isEntryAllowed) {
      return const Center(
        child: Text('You cannot enter with this ticket.'),
      );
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final qr = Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: QrImageView(
                  data: item.purchase.id,
                  size: 250,
                  backgroundColor: Colors.white,
                  embeddedImage: Assets.res.assets.dashumaruMagao.provider(),
                ),
              ),
              Text(
                item.purchase.id,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    final i18n = Translations.of(context);

    return Card.outlined(
      color: colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // チケット種別
            Text(
              '${i18n.ticket.qr.ticketType}: ${item.ticketType.name}',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            // ネームプレートIDがあれば表示
            if (item.purchase.nameplateId != null) ...[
              const SizedBox(height: 4),
              Text(
                '${i18n.ticket.qr.nameplateId}: ${item.purchase.nameplateId}',
                style: theme.textTheme.bodyMedium,
              ),
            ],
            const SizedBox(height: 16),
            // 入場時の案内
            Text(
              i18n.ticket.qr.scanAtEntry,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            qr,
          ],
        ),
      ),
    );
  }
}
