import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// アンケートCard
///
/// 2025/11/13の15時よりも後に表示される
class SurveyCard extends StatelessWidget {
  const SurveyCard({super.key});

  static const _surveyUrl =
      'https://docs.google.com/forms/d/e/1FAIpQLSfURb3WL8mWP0K1SJDnjCsnMSjIkhCkG2ku9sj_MX4a3rOOmw/viewform';
  static final _displayDateTime = DateTime(2025, 11, 13, 15);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    if (now.isAfter(_displayDateTime)) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final t = Translations.of(context);

    return Card.outlined(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.assignment_outlined,
                  color: colorScheme.onSurface,
                ),
                const SizedBox(width: 8),
                Text(
                  t.event.survey.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              t.event.survey.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _launchSurveyUrl,
                child: Text(t.event.survey.button),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchSurveyUrl() async {
    final uri = Uri.parse(_surveyUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
