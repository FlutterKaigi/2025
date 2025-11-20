import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 管理者ページ画面
final class AdminScreen extends ConsumerWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.account.admin.title),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            _AdminSectionListItem(
              title: t.account.admin.userList,
              onTap: () => const AdminUserListRoute().go(context),
            ),
            _AdminSectionListItem(
              title: 'チケット検索',
              onTap: () => const AdminTicketListRoute().go(context),
            ),
            _AdminSectionListItem(
              title: 'チケット読み取り',
              onTap: () => const AdminTicketQrScanRoute().go(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdminSectionListItem extends StatelessWidget {
  const _AdminSectionListItem({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(
        title,
        style: textTheme.bodyLarge,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: colorScheme.onSurfaceVariant,
      ),
      visualDensity: VisualDensity.comfortable,
      onTap: onTap,
    );
  }
}
