import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// 管理者用ユーザーアイテム
class AdminUserItem extends StatelessWidget {
  const AdminUserItem({
    required this.user,
    required this.onTap,
    super.key,
  });

  final UserAndUserRoles user;
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox.square(
                dimension: 56,
                child: AccountCircleImage(
                  imageUrl: user.authMetaData.avatarUrl ?? '',
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
                      user.authMetaData.name ??
                          user.authMetaData.email ??
                          'Unknown',
                      style: textTheme.titleMedium,
                    ),
                    if (user.authMetaData.email != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        user.authMetaData.email!,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    if (user.roles.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: user.roles.map((role) {
                          return Chip(
                            label: Text(
                              role.name,
                              style: textTheme.labelSmall,
                            ),
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          );
                        }).toList(),
                      ),
                    ],
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
                          dateFormat.format(user.user.createdAt.toLocal()),
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
