import 'dart:async';

import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:app/features/admin/data/model/admin_ticket_list_search_params.dart';
import 'package:app/features/admin/data/notifier/admin_ticket_list_notifier.dart';
import 'package:app/features/admin/data/notifier/entry_log_notifier.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

/// チケットスキャン後に表示するSheet
class AdminTicketScanSheet extends ConsumerWidget {
  const AdminTicketScanSheet({
    required this.ticket,
    super.key,
  });

  final TicketItemWithUser ticket;

  static Future<void> show(
    BuildContext context,
    TicketItemWithUser ticket,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AdminTicketScanSheet(ticket: ticket),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    TicketPurchaseItemWithUser? purchaseTicket;
    if (ticket is TicketPurchaseItemWithUser) {
      purchaseTicket = ticket as TicketPurchaseItemWithUser;
    }

    final hasEntryLog =
        purchaseTicket != null && purchaseTicket.purchase.entryLog != null;
    final canManageEntry =
        purchaseTicket != null &&
        purchaseTicket.purchase.status == TicketPurchaseStatus.completed;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ハンドル
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ユーザー情報
            Row(
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
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        ticket.ticketType.name,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 入場ステータス
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: hasEntryLog
                    ? Colors.green.withValues(alpha: 0.1)
                    : colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: hasEntryLog
                      ? Colors.green.withValues(alpha: 0.3)
                      : colorScheme.outline.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    hasEntryLog ? Icons.check_circle : Icons.cancel,
                    size: 48,
                    color: hasEntryLog ? Colors.green : colorScheme.outline,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    hasEntryLog ? '入場済み' : '未入場',
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: hasEntryLog ? Colors.green : colorScheme.outline,
                    ),
                  ),
                  if (hasEntryLog) ...[
                    const SizedBox(height: 8),
                    Builder(
                      builder: (context) {
                        final entryLog = purchaseTicket!.purchase.entryLog!;
                        final dateFormat = DateFormat('yyyy/MM/dd HH:mm:ss');
                        return Text(
                          dateFormat.format(entryLog.createdAt.toLocal()),
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),

            // アクションボタン
            if (!canManageEntry)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        '購入完了済みのチケットのみ入場管理できます',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else if (hasEntryLog)
              _DeleteEntryLogButton(
                ticket: ticket,
                onSuccess: () => Navigator.of(context).pop(),
              )
            else
              _AddEntryLogButton(
                ticket: ticket,
                onSuccess: () => Navigator.of(context).pop(),
              ),
          ],
        ),
      ),
    );
  }
}

/// 入場履歴追加ボタン
class _AddEntryLogButton extends ConsumerWidget {
  const _AddEntryLogButton({
    required this.ticket,
    required this.onSuccess,
  });

  final TicketItemWithUser ticket;
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryLogManager = ref.watch(entryLogManagerProvider);
    final isLoading = entryLogManager.isLoading;

    return FilledButton.icon(
      onPressed: isLoading
          ? null
          : () async {
              await HapticFeedback.lightImpact();
              final ticketId =
                  (ticket as TicketPurchaseItemWithUser).purchase.id;
              await ref
                  .read(entryLogManagerProvider.notifier)
                  .putEntryLog(ticketId);

              if (context.mounted) {
                final error = ref.read(entryLogManagerProvider).error;
                if (error != null) {
                  unawaited(HapticFeedback.heavyImpact());
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('エラーが発生しました: $error'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  unawaited(HapticFeedback.mediumImpact());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('入場済みにしました'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  ref.invalidate(
                    adminTicketListProvider(
                      const AdminTicketListSearchParams(),
                    ),
                  );
                  onSuccess();
                }
              }
            },
      icon: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 2,
              ),
            )
          : const Icon(Icons.check_circle),
      label: const Text('入場済みにする'),
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
    );
  }
}

/// 入場履歴削除ボタン
class _DeleteEntryLogButton extends ConsumerWidget {
  const _DeleteEntryLogButton({
    required this.ticket,
    required this.onSuccess,
  });

  final TicketItemWithUser ticket;
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryLogManager = ref.watch(entryLogManagerProvider);
    final isLoading = entryLogManager.isLoading;

    return FilledButton.tonalIcon(
      onPressed: isLoading
          ? null
          : () async {
              await HapticFeedback.lightImpact();
              final ticketId =
                  (ticket as TicketPurchaseItemWithUser).purchase.id;
              await ref
                  .read(entryLogManagerProvider.notifier)
                  .deleteEntryLog(ticketId);

              if (context.mounted) {
                final error = ref.read(entryLogManagerProvider).error;
                if (error != null) {
                  unawaited(HapticFeedback.heavyImpact());
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('エラーが発生しました: $error'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  unawaited(HapticFeedback.mediumImpact());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('入場履歴を削除しました'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  ref.invalidate(
                    adminTicketListProvider(
                      const AdminTicketListSearchParams(),
                    ),
                  );
                  onSuccess();
                }
              }
            },
      icon: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 2,
              ),
            )
          : const Icon(Icons.delete_outline),
      label: const Text('入場履歴を削除'),
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        foregroundColor: Colors.red,
      ),
    );
  }
}
