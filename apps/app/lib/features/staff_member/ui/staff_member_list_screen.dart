import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/staff_member/data/staff_member_provider.dart';
import 'package:app/features/staff_member/ui/components/staff_member_item.dart';
import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// スタッフ一覧画面
///
/// 主な役割:
/// - スタッフメンバーの一覧を表示する
/// - スタッフをタップするとXアカウントがあればXアプリを起動する
class StaffMemberListScreen extends StatelessWidget {
  const StaffMemberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.account.staffMembers.title),
      ),
      body: const SafeArea(
        child: _StaffMemberList(),
      ),
    );
  }
}

class _StaffMemberList extends ConsumerWidget {
  const _StaffMemberList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staffMembers = ref.watch(staffMembersProvider);
    return switch (staffMembers) {
      AsyncData(:final value) => value.isEmpty
          ? Center(
              child: Text(
                Translations.of(context).account.staffMembers.emptyMessage,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: value.length,
              itemBuilder: (context, index) {
                final staffMember = value[index];
                return StaffMemberItem(
                  staffMember: staffMember,
                  onTap: () => _onStaffMemberTap(context, staffMember),
                );
              },
            ),
      AsyncLoading() => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      AsyncError(:final error) => ErrorScreen(
          error: error,
          onRetry: () => ref.invalidate(staffMembersProvider),
        ),
    };
  }

  Future<void> _onStaffMemberTap(
    BuildContext context,
    StaffMemberWithSnsLinks staffMember,
  ) async {
    // Xアカウントを探す
    final xLink = staffMember.snsLinks.firstWhere(
      (link) => link.type == SnsType.x,
      orElse: () => const SnsLink(type: SnsType.other, value: ''),
    );

    if (xLink.type == SnsType.x && xLink.value.isNotEmpty) {
      // Xアカウントがある場合、Xアプリを起動
      final xUrl = _getXUrl(xLink.value);
      final uri = Uri.parse(xUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  String _getXUrl(String value) {
    // valueがURL形式の場合はそのまま使用、そうでない場合はユーザー名として扱う
    if (value.startsWith('http://') || value.startsWith('https://')) {
      return value;
    }
    // ユーザー名から@を除去
    final username = value.replaceAll('@', '');
    return 'https://x.com/$username';
  }
}
