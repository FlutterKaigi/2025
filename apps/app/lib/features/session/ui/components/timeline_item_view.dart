import 'package:app/features/session/data/model/timeline_item.dart';
import 'package:app/features/session/ui/components/timeline_event_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final _timeFormatter = DateFormat.Hm();

/// タイムラインアイテムビュー
class TimelineItemView extends StatelessWidget {
  const TimelineItemView({
    required this.item,
    required this.isDateVisible,
    required this.sessionCardBuilder,
    super.key,
  });

  final TimelineItem item;
  final bool isDateVisible;
  final Widget Function(TimelineItemSession session) sessionCardBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDateVisible) ...[
            const SizedBox(height: 8),
            Text(
              _timeFormatter.format(item.startsAt),
              style: theme.textTheme.labelLarge,
            ),
          ],
          Container(
            margin: const EdgeInsets.only(
              left: 16,
            ),
            padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: theme.colorScheme.onSurfaceVariant,
                  width: 2,
                ),
              ),
            ),
            child: item is TimelineItemEvent
                ? TimelineEventView(event: item as TimelineItemEvent)
                : sessionCardBuilder(item as TimelineItemSession),
          ),
        ],
      ),
    );
  }
}
