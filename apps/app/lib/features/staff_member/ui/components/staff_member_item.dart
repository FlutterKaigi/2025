import 'package:app/features/account/ui/component/account_circle_image.dart';
import 'package:db_types/db_types.dart';
import 'package:flutter/material.dart';

/// スタッフメンバーアイテム
class StaffMemberItem extends StatelessWidget {
  const StaffMemberItem({
    required this.staffMember,
    required this.onTap,
    super.key,
  });

  final StaffMemberWithSnsLinks staffMember;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ListTile(
      leading: SizedBox.square(
        dimension: 48,
        child: AccountCircleImage(
          imageUrl: staffMember.iconUrl,
        ),
      ),
      title: Text(
        staffMember.name,
        style: textTheme.bodyLarge,
      ),
      subtitle: staffMember.greeting != null && staffMember.greeting!.isNotEmpty
          ? Text(
              staffMember.greeting!,
              style: textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          : null,
      trailing: Icon(
        Icons.arrow_right,
        color: theme.colorScheme.onSurfaceVariant,
      ),
      visualDensity: VisualDensity.comfortable,
      onTap: onTap,
    );
  }
}
