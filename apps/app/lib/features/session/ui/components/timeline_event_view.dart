import 'package:app/features/session/data/model/timeline_item.dart';
import 'package:flutter/material.dart';

/// タイムラインイベントビュー
class TimelineEventView extends StatelessWidget {
  const TimelineEventView({
    required this.event,
    super.key,
  });

  final TimelineItemEvent event;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: theme.colorScheme.outline,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            event.title,
            style: theme.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
