import 'dart:io';

import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/provider/environment.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/link.dart';

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
            const SizedBox(height: 12),
            // ステータスバッジ
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _StatusBadge(
                  icon: switch (item.purchase.status) {
                    TicketPurchaseStatus.completed => Icons.check_circle,
                    TicketPurchaseStatus.refunded => Icons.cancel,
                  },
                  label: switch (item.purchase.status) {
                    TicketPurchaseStatus.completed => i18n.ticket.status.purchased,
                    TicketPurchaseStatus.refunded => i18n.ticket.status.refunded,
                  },
                  color: switch (item.purchase.status) {
                    TicketPurchaseStatus.completed => colorScheme.primary,
                    TicketPurchaseStatus.refunded => colorScheme.error,
                  },
                  onColor: switch (item.purchase.status) {
                    TicketPurchaseStatus.completed => colorScheme.onPrimary,
                    TicketPurchaseStatus.refunded => colorScheme.onError,
                  },
                  theme: theme,
                ),
                if (item.purchase.entryLog != null)
                  _StatusBadge(
                    icon: Icons.meeting_room,
                    label: i18n.ticket.status.entered,
                    color: colorScheme.tertiary,
                    onColor: colorScheme.onTertiary,
                    theme: theme,
                  ),
              ],
            ),
            // ネームプレートIDがあれば表示
            if (item.purchase.nameplateId != null) ...[
              const SizedBox(height: 12),
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
            _AddToWallet(ticketId: item.purchase.id),
            const SizedBox(height: 16),
            qr,
          ],
        ),
      ),
    );
  }
}

class _AddToWallet extends ConsumerWidget {
  const _AddToWallet({required this.ticketId, super.key});

  final String ticketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final environment = ref.watch(environmentProvider);
    final url =
        '${environment.ticketApiBaseUrl}/wallet/pass.pkpass?id=$ticketId';
    final Widget child;

    if (!kIsWeb && Platform.isAndroid) {
      child = Assets.res.assets.addToGoogleWallet.svg(
        width: 210,
      );
    } else {
      child = Assets.res.assets.addToAppleWallet.image(
        width: 210,
        fit: BoxFit.contain,
      );
    }

    return Center(
      child: Link(
        uri: Uri.parse(url),
        builder: (context, open) => GestureDetector(
          onTap: open,
          child: child,
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.icon,
    required this.label,
    required this.color,
    required this.onColor,
    required this.theme,
  });

  final IconData icon;
  final String label;
  final Color color;
  final Color onColor;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
