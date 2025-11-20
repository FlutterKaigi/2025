import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:flutter/material.dart';

/// プロフィール作成が必要であることを示すボトムシート
class ProfileRequiredSheet extends StatelessWidget {
  const ProfileRequiredSheet({
    super.key,
  });
  static Future<bool?> show({
    required BuildContext context,
    required VoidCallback onCreateProfile,
  }) => showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const ProfileRequiredSheet(),
    useRootNavigator: true,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = Translations.of(context);

    return Container(
      padding: const EdgeInsets.all(8),
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
                color: theme.colorScheme.onSurfaceVariant.withValues(
                  alpha: 0.4,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Icon(
              Icons.person_add,
              size: 64,
              color: theme.colorScheme.primary,
            ),
            Text(
              t.account.profile.requiredSheet.title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontVariations: [const FontVariation('wght', 700)],
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              t.account.profile.requiredSheet.description,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pop(true),
                icon: const Icon(Icons.edit),
                label: Text(
                  t.account.profile.requiredSheet.createButton,
                ),
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
                onPressed: () => Navigator.of(context).pop(false),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(t.common.action.cancel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
