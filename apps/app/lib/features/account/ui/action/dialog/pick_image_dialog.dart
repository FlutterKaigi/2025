import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:flutter/material.dart';

class PickImageDialog extends StatelessWidget {
  const PickImageDialog._({super.key});

  static Future<PickImageDialogResult?> show(BuildContext context) =>
      showDialog<PickImageDialogResult>(
        context: context,
        builder: (context) => const PickImageDialog._(),
      );

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return AlertDialog(
      title: Text(t.account.profile.image.selectTitle),
      content: Text(t.account.profile.image.selectMessage),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(PickImageDialogResult.imagePicker),
          child: Text(t.account.profile.image.selectButton),
        ),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(PickImageDialogResult.googleAccount),
          child: Text(t.account.profile.image.useGooglePhoto),
        ),
      ],
    );
  }
}

enum PickImageDialogResult {
  imagePicker,
  googleAccount,
}
