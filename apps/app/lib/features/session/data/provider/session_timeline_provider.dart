import 'package:app/features/session/data/model/timeline_item.dart';
import 'package:app/features/session/data/model/venue.dart';
import 'package:app/features/session/data/provider/session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_timeline_provider.g.dart';

@riverpod
Future<List<TimelineItem>> sessionTimeline(Ref ref) async {
  final sessions = await ref.watch(sessionsProvider.future);
  final events = await ref.watch(sessionEventsProvider.future);

  final timelineItems = <TimelineItem>[];

  // Add sessions as timeline items
  for (final session in sessions) {
    timelineItems.add(
      TimelineItemSession(
        startsAt: session.startsAt,
        endsAt: session.endsAt,
        session: session,
      ),
    );
  }

  // Add events as timeline items
  for (final event in events) {
    timelineItems.add(
      TimelineItemEvent(
        startsAt: event.startsAt,
        endsAt: event.endsAt ?? event.startsAt,
        title: event.title,
        venue: event.venue?.toVenue(),
      ),
    );
  }

  // Sort by start time
  timelineItems.sort((a, b) => a.startsAt.compareTo(b.startsAt));

  return timelineItems;
}

@riverpod
Future<List<TimelineItem>> sessionTimelineForVenue(
  Ref ref,
  String venueId,
) async {
  final allTimeline = await ref.watch(sessionTimelineProvider.future);

  return allTimeline.where((item) {
    if (item is TimelineItemSession) {
      return item.session.venueId == venueId;
    } else if (item is TimelineItemEvent) {
      return item.venue?.id == venueId || item.venue == null;
    }
    return false;
  }).toList();
}
