import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:app/features/admin/data/notifier/admin_user_state_notifier.dart';
import 'package:bff_client/bff_client.dart' as bff;
import 'package:bff_client/bff_client.dart';
import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

/// 管理者用ユーザー詳細画面
final class AdminUserDetailScreen extends ConsumerWidget {
  const AdminUserDetailScreen({
    required this.userId,
    super.key,
  });

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final userAsync = ref.watch(adminUserProvider(userId));
    final dateFormat = DateFormat('yyyy/MM/dd HH:mm:ss');

    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー詳細'),
      ),
      body: switch (userAsync) {
        AsyncData(:final value) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _UserInfoCard(
                user: value.user,
                dateFormat: dateFormat,
              ),
              const SizedBox(height: 24),
              Text(
                'チケット一覧',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              if (value.tickets.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Text(
                      'チケットがありません',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                )
              else
                ...value.tickets.map(
                  (ticket) {
                    final ticketId = switch (ticket) {
                      TicketPurchaseItem(:final purchase) => purchase.id,
                      TicketCheckoutItem(:final checkout) => checkout.id,
                    };
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _TicketCard(
                        ticket: ticket,
                        dateFormat: dateFormat,
                        onTap: () =>
                            AdminTicketDetailRoute(ticketId: ticketId)
                                .go(context),
                      ),
                    );
                  },
                ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        AsyncLoading() => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        AsyncError(:final error) => ErrorScreen(
          error: error,
          onRetry: () => ref.invalidate(adminUserProvider(userId)),
        ),
      },
    );
  }
}

final class _UserInfoCard extends StatelessWidget {
  const _UserInfoCard({
    required this.user,
    required this.dateFormat,
  });

  final UserAndUserRoles user;
  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                AccountCircleImage(
                  imageUrl: user.authMetaData.avatarUrl ?? '',
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.authMetaData.name ??
                            user.authMetaData.email ??
                            'Unknown',
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (user.authMetaData.email != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          user.authMetaData.email!,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 32),
            _InfoRow(
              label: 'ユーザーID',
              value: user.user.id,
              isSelectable: true,
            ),
            const SizedBox(height: 12),
            _InfoRow(
              label: '作成日時',
              value: dateFormat.format(user.user.createdAt.toLocal()),
            ),
            if (user.user.deletedAt != null) ...[
              const SizedBox(height: 12),
              _InfoRow(
                label: '削除日時',
                value: dateFormat.format(user.user.deletedAt!.toLocal()),
                isError: true,
              ),
            ],
            if (user.roles.isNotEmpty) ...[
              const Divider(height: 32),
              _RolesSection(roles: user.roles),
            ],
          ],
        ),
      ),
    );
  }
}

final class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.isSelectable = false,
    this.isError = false,
  });

  final String label;
  final String value;
  final bool isSelectable;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: isError ? colorScheme.error : colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: isSelectable
              ? SelectableText(
                  value,
                  style: textTheme.bodyMedium?.copyWith(
                    color: isError ? colorScheme.error : null,
                  ),
                )
              : Text(
                  value,
                  style: textTheme.bodyMedium?.copyWith(
                    color: isError ? colorScheme.error : null,
                  ),
                ),
        ),
      ],
    );
  }
}

final class _RolesSection extends StatelessWidget {
  const _RolesSection({
    required this.roles,
  });

  final List<Role> roles;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ロール',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: roles.map((role) {
            return Chip(
              label: Text(role.name),
              visualDensity: VisualDensity.comfortable,
            );
          }).toList(),
        ),
      ],
    );
  }
}

final class _TicketCard extends StatelessWidget {
  const _TicketCard({
    required this.ticket,
    required this.dateFormat,
    required this.onTap,
  });

  final TicketItem ticket;
  final DateFormat dateFormat;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _getStatusColor(context),
              border: Border(
                bottom: BorderSide(
                  color: colorScheme.outlineVariant,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        switch (ticket) {
                          TicketPurchaseItem(:final ticketType) =>
                            ticketType.name,
                          TicketCheckoutItem(:final ticketType) =>
                            ticketType.name,
                        },
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '¥${_formatPrice(_getPrice())}',
                        style: textTheme.titleSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                _StatusBadge(ticket: ticket),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoRow(
                  label: 'チケットID',
                  value: switch (ticket) {
                    TicketPurchaseItem(:final purchase) => purchase.id,
                    TicketCheckoutItem(:final checkout) => checkout.id,
                  },
                  isSelectable: true,
                ),
                const SizedBox(height: 12),
                _InfoRow(
                  label: '作成日時',
                  value: dateFormat.format(
                    switch (ticket) {
                      TicketPurchaseItem(:final purchase) =>
                        purchase.createdAt.toLocal(),
                      TicketCheckoutItem(:final checkout) =>
                        checkout.createdAt.toLocal(),
                    },
                  ),
                ),
                if (ticket case TicketPurchaseItem(:final purchase))
                  if (purchase.entryLog != null) ...[
                    const SizedBox(height: 12),
                    _InfoRow(
                      label: '入場日時',
                      value: dateFormat.format(
                        purchase.entryLog!.createdAt.toLocal(),
                      ),
                    ),
                  ],
                if (ticket case TicketCheckoutItem(:final checkout))
                  if (checkout.status == bff.TicketCheckoutStatus.pending) ...[
                    const SizedBox(height: 12),
                    _InfoRow(
                      label: '有効期限',
                      value: dateFormat.format(checkout.expiresAt.toLocal()),
                    ),
                  ],
                if (ticket.options.isNotEmpty) ...[
                  const Divider(height: 32),
                  _OptionsSection(options: ticket.options),
                ],
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }

  Color _getStatusColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return switch (ticket) {
      TicketPurchaseItem(:final purchase) => switch (purchase.status) {
        bff.TicketPurchaseStatus.completed => colorScheme.primaryContainer,
        bff.TicketPurchaseStatus.refunded => colorScheme.errorContainer,
      },
      TicketCheckoutItem(:final checkout) => switch (checkout.status) {
        bff.TicketCheckoutStatus.pending => colorScheme.secondaryContainer,
        bff.TicketCheckoutStatus.completed => colorScheme.primaryContainer,
        bff.TicketCheckoutStatus.expired => colorScheme.surfaceContainerHighest,
      },
    };
  }

  int _getPrice() {
    return switch (ticket) {
      TicketPurchaseItem(:final ticketType) => ticketType.price,
      TicketCheckoutItem(:final ticketType) => ticketType.price,
    };
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
  }
}

final class _StatusBadge extends StatelessWidget {
  const _StatusBadge({
    required this.ticket,
  });

  final TicketItem ticket;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final (label, icon, color) = switch (ticket) {
      TicketPurchaseItem(:final purchase) => switch (purchase.status) {
        bff.TicketPurchaseStatus.completed => (
          '購入済み',
          Icons.check_circle,
          colorScheme.primary,
        ),
        bff.TicketPurchaseStatus.refunded => (
          '返金済み',
          Icons.cancel,
          colorScheme.error,
        ),
      },
      TicketCheckoutItem(:final checkout) => switch (checkout.status) {
        bff.TicketCheckoutStatus.pending => (
          '決済中',
          Icons.pending,
          colorScheme.secondary,
        ),
        bff.TicketCheckoutStatus.completed => (
          '完了',
          Icons.check_circle,
          colorScheme.primary,
        ),
        bff.TicketCheckoutStatus.expired => (
          '期限切れ',
          Icons.timer_off,
          colorScheme.onSurfaceVariant,
        ),
      },
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: color,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: textTheme.labelMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

final class _OptionsSection extends StatelessWidget {
  const _OptionsSection({
    required this.options,
  });

  final List<TicketOption> options;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'オプション',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        ...options.map((option) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                Icon(
                  Icons.add_circle_outline,
                  size: 16,
                  color: colorScheme.onSurfaceVariant,
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
          );
        }),
      ],
    );
  }
}
