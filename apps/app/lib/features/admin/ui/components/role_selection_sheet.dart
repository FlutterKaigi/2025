import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// ロール選択用ボトムシート
class RoleSelectionSheet extends HookWidget {
  const RoleSelectionSheet({
    required this.currentRoles,
    super.key,
  });

  final List<Role> currentRoles;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedRoles = useState<Set<Role>>(currentRoles.toSet());

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ロールを選択',
                  style: theme.textTheme.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: Role.values.map((role) {
                final isSelected = selectedRoles.value.contains(role);
                return CheckboxListTile(
                  title: Text(_getRoleDisplayName(role)),
                  subtitle: Text(_getRoleDescription(role)),
                  value: isSelected,
                  onChanged: (value) {
                    if (value == true) {
                      selectedRoles.value = {...selectedRoles.value, role};
                    } else {
                      selectedRoles.value = {...selectedRoles.value}
                        ..remove(role);
                    }
                  },
                );
              }).toList(),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('キャンセル'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop(selectedRoles.value.toList());
                    },
                    child: const Text('保存'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getRoleDisplayName(Role role) {
    return switch (role) {
      Role.admin => '管理者',
      Role.staff => 'スタッフ',
      Role.sponsor => 'スポンサー',
      Role.speaker => 'スピーカー',
      Role.viewer => '閲覧者',
      Role.attendee => '参加者',
    };
  }

  String _getRoleDescription(Role role) {
    return switch (role) {
      Role.admin => 'システム全体の管理権限',
      Role.staff => 'イベント運営権限',
      Role.sponsor => 'スポンサー権限',
      Role.speaker => '登壇者権限',
      Role.viewer => '閲覧のみ可能',
      Role.attendee => 'イベント参加者',
    };
  }
}
