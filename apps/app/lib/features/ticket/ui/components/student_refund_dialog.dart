import 'package:app/core/gen/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// 学生向け返金・費用補助についてのダイアログ
class StudentRefundDialog extends StatelessWidget {
  const StudentRefundDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      fullscreenDialog: true,
      builder: (context) => const StudentRefundDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.studentRefundTitle),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SelectableText(
            l10n.studentRefundDialogContent,
            style: textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
          ),
        ),
      ),
    );
  }
}
