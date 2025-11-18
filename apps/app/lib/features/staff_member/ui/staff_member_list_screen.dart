import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/staff_member/data/staff_member_provider.dart';
import 'package:app/features/staff_member/ui/components/staff_member_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// スタッフ一覧画面
///
/// 主な役割:
/// - スタッフメンバーの一覧を表示する
/// - スタッフのSNSアイコンをタップすると外部アプリを起動する
class StaffMemberListScreen extends StatelessWidget {
  const StaffMemberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.event.staffMembers.title),
      ),
      body: const _StaffMemberList(),
    );
  }
}

class _StaffMemberList extends ConsumerWidget {
  const _StaffMemberList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staffMembers = ref.watch(staffMembersProvider);
    return switch (staffMembers) {
      AsyncData(:final value) =>
        value.isEmpty
            ? Center(
                child: Text(
                  Translations.of(context).event.staffMembers.emptyMessage,
                ),
              )
            : ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final staffMember = value[index];
                  return StaffMemberItem(
                    staffMember: staffMember,
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
}
