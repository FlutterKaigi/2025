import 'package:app/features/session/data/model/session.dart';
import 'package:app/features/session/data/model/timeline_item.dart';
import 'package:app/features/session/data/provider/session_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_timeline_provider.g.dart';

@riverpod
Future<List<TimelineItem>> sessionTimeline(Ref ref) async {
  final sessions = await ref.watch(sessionsProvider.future);
  final venues = await ref.watch(sessionVenuesProvider.future);
  final events = ref.watch(sessionEventsProvider);

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
    SessionVenue? venue;
    if (event.venueId != null) {
      try {
        venue = venues.firstWhere((v) => v.id == event.venueId!);
      } on Exception catch (_) {
        // Venue not found, use null
      }
    }

    timelineItems.add(
      TimelineItemEvent(
        startsAt: event.startsAt,
        endsAt: event.endsAt ?? event.startsAt,
        title: event.title,
        venue: venue,
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
      return item.session.venue.id == venueId;
    } else if (item is TimelineItemEvent) {
      return item.venue?.id == venueId || item.venue == null;
    }
    return false;
  }).toList();
}

@riverpod
List<TimelineEvent> sessionEvents(Ref ref) {
  return <TimelineEvent>[
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 9),
      title: '開場',
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 10),
      endsAt: DateTime(2025, 11, 21, 10, 15),
      title: '挨拶',
      venueId: 'venue1',
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 10),
      endsAt: DateTime(2025, 11, 21, 10, 15),
      title: '挨拶（サテライト）',
      venueId: 'venue2',
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 10, 15),
      endsAt: DateTime(2025, 11, 21, 10, 30),
      title: 'キーノート',
      venueId: 'venue1',
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 10, 15),
      endsAt: DateTime(2025, 11, 21, 10, 30),
      title: 'キーノート（サテライト）',
      venueId: 'venue2',
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 12),
      endsAt: DateTime(2025, 11, 21, 13, 30),
      title: 'ランチ',
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 18, 30),
      title: '懇親会',
      venueId: 'venue1',
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 18, 30),
      title: '懇親会',
      venueId: 'venue2',
    ),
  ];
}
