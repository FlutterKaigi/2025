import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:app/features/admin/data/model/admin_ticket_list_search_params.dart';
import 'package:app/features/admin/data/notifier/admin_ticket_list_notifier.dart';
import 'package:app/features/admin/data/notifier/entry_log_notifier.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

/// 管理者用チケット詳細画面
final class AdminTicketDetailScreen extends HookConsumerWidget {
  const AdminTicketDetailScreen({
    required this.ticketId,
    super.key,
  });

  final String ticketId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketsListAsync = ref.watch(
      adminTicketListProvider(const AdminTicketListSearchParams()),
    );

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('チケット詳細'),
      ),
      body: ticketsListAsync.when(
        data: (state) {
          final ticket = state.tickets.cast<TicketItemWithUser?>().firstWhere(
            (t) => _getTicketId(t) == ticketId,
            orElse: () => null,
          );

          if (ticket == null) {
            return const Center(
              child: Text('チケットが見つかりませんでした'),
            );
          }

          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _UserInfoSection(ticket: ticket),
                  _TicketInfoSection(ticket: ticket),
                  _EntryLogSection(
                    ticket: ticket,
                    textTheme: textTheme,
                    colorScheme: colorScheme,
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, _) => Center(
          child: Text('エラーが発生しました: $error'),
        ),
      ),
    );
  }

  String? _getTicketId(TicketItemWithUser? ticket) {
    return switch (ticket) {
      TicketPurchaseItemWithUser(:final purchase) => purchase.id,
      TicketCheckoutItemWithUser(:final checkout) => checkout.id,
      _ => null,
    };
  }
}

/// ユーザー情報セクション
class _UserInfoSection extends StatelessWidget {
  const _UserInfoSection({required this.ticket});

  final TicketItemWithUser ticket;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ユーザー情報',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox.square(
                  dimension: 72,
                  child: AccountCircleImage(
                    imageUrl: ticket.user.authMetaData.avatarUrl ?? '',
                    imageSize: 72,
                    circleRadius: 36,
                    errorIconSize: 36,
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
                      ),
                      if (ticket.user.authMetaData.email != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          ticket.user.authMetaData.email!,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                      const SizedBox(height: 8),
                      Text(
                        'User ID: ${ticket.user.user.id}',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// チケット情報セクション
class _TicketInfoSection extends StatelessWidget {
  const _TicketInfoSection({required this.ticket});

  final TicketItemWithUser ticket;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final dateFormat = DateFormat('yyyy/MM/dd HH:mm');

    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'チケット情報',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _InfoRow(
              label: 'チケット種別',
              value: ticket.ticketType.name,
              textTheme: textTheme,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              label: '価格',
              value: '¥${ticket.ticketType.price}',
              textTheme: textTheme,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              label: 'ステータス',
              value: _getStatusLabel(ticket),
              textTheme: textTheme,
              valueWidget: _TicketStatusBadge(
                ticket: ticket,
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
            ),
            const SizedBox(height: 12),
            _InfoRow(
              label: '購入日時',
              value: dateFormat.format(
                (switch (ticket) {
                  TicketPurchaseItemWithUser(:final purchase) =>
                    purchase.createdAt,
                  TicketCheckoutItemWithUser(:final checkout) =>
                    checkout.createdAt,
                }).toLocal(),
              ),
              textTheme: textTheme,
            ),
            if (ticket is TicketPurchaseItemWithUser) ...[
              const SizedBox(height: 12),
              _InfoRow(
                label: 'チケットID',
                value: (ticket as TicketPurchaseItemWithUser).purchase.id,
                textTheme: textTheme,
                valueStyle: textTheme.bodyMedium?.copyWith(
                  fontFamily: 'monospace',
                  fontSize: 12,
                ),
              ),
            ],
            if (ticket.options.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'オプション',
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...ticket.options.map(
                (option) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
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
          ],
        ),
      ),
    );
  }

  String _getStatusLabel(TicketItemWithUser ticket) {
    return switch (ticket) {
      TicketPurchaseItemWithUser(:final purchase) => switch (purchase.status) {
        TicketPurchaseStatus.completed => '購入済み',
        TicketPurchaseStatus.refunded => '返金済み',
      },
      TicketCheckoutItemWithUser() => '決済中',
    };
  }
}

/// 入場履歴セクション
class _EntryLogSection extends StatelessWidget {
  const _EntryLogSection({
    required this.ticket,
    required this.textTheme,
    required this.colorScheme,
  });

  final TicketItemWithUser ticket;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy/MM/dd HH:mm:ss');
    TicketPurchaseItemWithUser? purchaseTicket;
    if (ticket is TicketPurchaseItemWithUser) {
      purchaseTicket = ticket as TicketPurchaseItemWithUser;
    }
    final hasEntryLog =
        purchaseTicket != null && purchaseTicket.purchase.entryLog != null;
    final canManageEntry =
        purchaseTicket != null &&
        purchaseTicket.purchase.status == TicketPurchaseStatus.completed;

    return Card.outlined(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '入場履歴',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (!canManageEntry) ...[
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
                        '購入完了済みのチケットのみ入場履歴を管理できます',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              Container(
                padding: const EdgeInsets.all(24),
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
                      size: 64,
                      color: hasEntryLog ? Colors.green : colorScheme.outline,
                    ),
                    const SizedBox(height: 16),
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
                          return Text(
                            '入場日時: '
                            // ignore: lines_longer_than_80_chars
                            '${dateFormat.format(entryLog.createdAt.toLocal())}',
                          );
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 24),
              if (hasEntryLog)
                _DeleteEntryLogButton(
                  ticket: ticket,
                )
              else
                _AddEntryLogButton(
                  ticket: ticket,
                ),
            ],
          ],
        ),
      ),
    );
  }
}

/// 情報行ウィジェット
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    required this.textTheme,
    this.valueWidget,
    this.valueStyle,
  });

  final String label;
  final String value;
  final TextTheme textTheme;
  final Widget? valueWidget;
  final TextStyle? valueStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child:
              valueWidget ??
              Text(
                value,
                style: valueStyle ?? textTheme.bodyMedium,
              ),
        ),
      ],
    );
  }
}

/// チケットステータスバッジ
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
      TicketCheckoutItemWithUser() => ('決済中', Colors.orange),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: textTheme.labelMedium?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// 入場履歴追加ボタン
class _AddEntryLogButton extends ConsumerWidget {
  const _AddEntryLogButton({required this.ticket});

  final TicketItemWithUser ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryLogManager = ref.watch(entryLogManagerProvider);
    final isLoading = entryLogManager.isLoading;

    return FilledButton.icon(
      onPressed: isLoading
          ? null
          : () async {
              final ticketId =
                  (ticket as TicketPurchaseItemWithUser).purchase.id;
              await ref
                  .read(entryLogManagerProvider.notifier)
                  .putEntryLog(ticketId);

              if (context.mounted) {
                final error = ref.read(entryLogManagerProvider).error;
                if (error != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('エラーが発生しました: $error'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('入場履歴を追加しました'),
                    ),
                  );
                  ref.invalidate(
                    adminTicketListProvider(
                      const AdminTicketListSearchParams(),
                    ),
                  );
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
      ),
    );
  }
}

/// 入場履歴削除ボタン
class _DeleteEntryLogButton extends ConsumerWidget {
  const _DeleteEntryLogButton({required this.ticket});

  final TicketItemWithUser ticket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryLogManager = ref.watch(entryLogManagerProvider);
    final isLoading = entryLogManager.isLoading;

    return FilledButton.tonalIcon(
      onPressed: isLoading
          ? null
          : () async {
              final confirmed = await showDialog<bool>(
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
                      child: const Text('削除'),
                    ),
                  ],
                ),
              );

              if (confirmed != true || !context.mounted) {
                return;
              }

              final ticketId =
                  (ticket as TicketPurchaseItemWithUser).purchase.id;
              await ref
                  .read(entryLogManagerProvider.notifier)
                  .deleteEntryLog(ticketId);

              if (context.mounted) {
                final error = ref.read(entryLogManagerProvider).error;
                if (error != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('エラーが発生しました: $error'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('入場履歴を削除しました'),
                    ),
                  );
                  ref.invalidate(
                    adminTicketListProvider(
                      const AdminTicketListSearchParams(),
                    ),
                  );
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
