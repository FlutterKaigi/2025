import 'package:flutter/material.dart';

/// プロフィール作成が必要であることを示すボトムシート
class ProfileRequiredSheet extends StatelessWidget {
  const ProfileRequiredSheet({
    required this.onCreateProfile,
    super.key,
  });

  final VoidCallback onCreateProfile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Icon(
              Icons.person_add,
              size: 64,
              color: theme.colorScheme.primary,
            ),
            Text(
              'プロフィールを作成しましょう',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'プロフィール交換を行うには、プロフィールの作成が必要です',
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                  onCreateProfile();
                },
                icon: const Icon(Icons.edit),
                label: const Text('プロフィールを作成'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('キャンセル'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// プロフィール作成が必要であることを示すボトムシートを表示
void showProfileRequiredSheet({
  required BuildContext context,
  required VoidCallback onCreateProfile,
}) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => ProfileRequiredSheet(
      onCreateProfile: onCreateProfile,
    ),
  );
}

