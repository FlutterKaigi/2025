import 'package:app/core/gen/l10n/l10n.dart';
import 'package:app/features/ticket/ui/components/student_refund_dialog.dart';
import 'package:flutter/material.dart';

class StudentRefundCard extends StatelessWidget {
  const StudentRefundCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.school,
                  color: colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    l10n.studentRefundTitle,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              l10n.studentRefundDescription,
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => StudentRefundDialog.show(context),
                icon: const Icon(Icons.info_outline),
                label: Text(l10n.studentRefundDetailsButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
