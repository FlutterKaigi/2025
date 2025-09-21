import 'package:app/core/gen/i18n/i18n.g.dart';
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
    final t = Translations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.ticket.studentRefund.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SelectableText(
            t.ticket.studentRefund.dialogContent,
            style: textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
          ),
        ),
      ),
    );
  }
}
