import 'dart:async';

import 'package:app/core/router/router.dart';
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

  final TicketPurchaseItemWithUser ticket;

  static Future<void> show({
    required BuildContext context,
    required TicketPurchaseItemWithUser ticket,
  }) => showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => AdminTicketScanSheet(ticket: ticket),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final hasEntryLog = ticket.purchase.entryLog != null;
    final nameplateId = ticket.purchase.nameplateId?.trim();
    final displayNameplateId = nameplateId == null || nameplateId.isEmpty
        ? 'N/A'
        : nameplateId;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          spacing: 8,
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

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    'ネームプレートID',
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                  Text(
                    displayNameplateId,
                    style: textTheme.bodyLarge?.copyWith(
                      fontFamily: 'monospace',
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            // チケットオプション情報
            if (ticket.options.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorScheme.outline.withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'チケットオプション',
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    ...ticket.options.map(
                      (option) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: 16,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                option.name,
                                style: textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            Container(
              padding: const EdgeInsets.all(12),
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
                      fontVariations: [
                        const FontVariation('wght', 700),
                      ],
                      color: hasEntryLog ? Colors.green : colorScheme.outline,
                    ),
                  ),
                  if (hasEntryLog)
                    Builder(
                      builder: (context) {
                        final entryLog = ticket.purchase.entryLog!;
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
              ),
            ),
            // 詳細を見るボタン
            OutlinedButton.icon(
              onPressed: () async {
                Navigator.of(context).pop();
                await AdminTicketDetailRoute(
                  ticketId: ticket.purchase.id,
                ).push<void>(context);
              },
              icon: const Icon(Icons.info_outline),
              label: const Text('詳細を見る'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
            ),
            if (hasEntryLog)
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

  final TicketPurchaseItemWithUser ticket;
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
              final ticketId = ticket.purchase.id;
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

  final TicketPurchaseItemWithUser ticket;
  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryLogManager = ref.watch(entryLogManagerProvider);
    final isLoading = entryLogManager.isLoading;

    return FilledButton.tonalIcon(
      onPressed: isLoading
          ? null
          : () async {
              unawaited(HapticFeedback.lightImpact());
              final shouldContinue = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('入場履歴を削除'),
                  content: const Text('入場履歴を削除してもよろしいですか？'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('キャンセル'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text(
                        '削除',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
              if (shouldContinue != true || !context.mounted) {
                return;
              }
              final ticketId = ticket.purchase.id;
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
