import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/features/user/data/notifier/user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PickImageDialog extends ConsumerWidget {
  const PickImageDialog._({super.key});

  static Future<PickImageDialogResult?> show(BuildContext context) =>
      showDialog<PickImageDialogResult>(
        context: context,
        builder: (context) => const PickImageDialog._(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    final hasGoogleAvatarUrl = ref.watch(
      userNotifierProvider.select(
        (v) => v.whenData((d) => d.authMetaData.avatarUrl != null),
      ),
    );
    return AlertDialog(
      title: Text(t.account.profile.image.selectTitle),
      content: Text(t.account.profile.image.selectMessage),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(PickImageDialogResult.imagePicker),
          child: Text(t.account.profile.image.selectButton),
        ),
        switch (hasGoogleAvatarUrl) {
          AsyncLoading() => const CircularProgressIndicator.adaptive(),
          AsyncData(:final value) when value => TextButton(
            onPressed: () => Navigator.of(
              context,
            ).pop(PickImageDialogResult.googleAccount),
            child: Text(t.account.profile.image.useGooglePhoto),
          ),
          _ => const SizedBox.shrink(),
        },
      ],
    );
  }
}

enum PickImageDialogResult {
  imagePicker,
  googleAccount,
}
