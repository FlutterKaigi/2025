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
    return AlertDialog(
      title: const Text('画像を選択'),
      content: const Text('画像を選択してください'),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(PickImageDialogResult.imagePicker),
          child: const Text('画像を選択'),
        ),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(PickImageDialogResult.googleAccount),
          child: const Text('Googleアカウントの写真を使用'),
        ),
      ],
    );
  }
}

enum PickImageDialogResult {
  imagePicker,
  googleAccount,
}
