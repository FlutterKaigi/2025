import 'package:app/core/provider/bff_client.dart';
import 'package:bff_client/bff_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_provider.g.dart';

@riverpod
Future<SessionScheduleResponse> sessionSchedule(Ref ref) async {
  final bffClient = ref.watch(bffClientProvider);
  final response = await bffClient.v1.session.getSessionSchedule();
  return response.data;
}

@riverpod
Future<List<ScheduleSession>> sessions(Ref ref) async {
  final schedule = await ref.watch(sessionScheduleProvider.future);

  final sessions = <ScheduleSession>[];
  for (final entry in schedule.schedule.entries) {
    // UTC時刻をローカルタイムに変換
    final localSessions = entry.value.map((session) {
      return session.copyWith(
        startsAt: session.startsAt.toLocal(),
        endsAt: session.endsAt.toLocal(),
      );
    });
    sessions.addAll(localSessions);
  }

  return sessions;
}

@riverpod
Future<List<Venue>> sessionVenues(Ref ref) async {
  final schedule = await ref.watch(sessionScheduleProvider.future);

  final venueMap = <String, Venue>{};
  for (final entry in schedule.schedule.entries) {
    for (final session in entry.value) {
      if (!venueMap.containsKey(session.venueId)) {
        venueMap[session.venueId] = Venue(
          id: session.venueId,
          name: session.venue,
        );
      }
    }
  }

  return venueMap.values.toList();
}

@riverpod
List<TimelineEvent> sessionEvents(Ref ref) {
  // Room A: e1a11efe-b1eb-43e1-ae60-9d2233e5dfe7
  // Room B: 0505c447-b699-4803-aab9-9cbdf9452c1b
  // Room C: 6426cd21-f1fe-4d84-b74b-ff459cc0d3e2
  // Room D: 98807fe6-b381-40a7-8c33-30a024b9ca4f
  //
  // 注意: すべてのDateTimeは日本時間（JST: UTC+9）として扱われます。
  // ScheduleSessionのstartsAt/endsAtもJSTに変換されているため、統一されています。
  return <TimelineEvent>[
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 9),
      title: '開場',
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 10),
      endsAt: DateTime(2025, 11, 21, 10, 15),
      title: '挨拶',
      venueId: 'e1a11efe-b1eb-43e1-ae60-9d2233e5dfe7', // Room A
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 10),
      endsAt: DateTime(2025, 11, 21, 10, 15),
      title: '挨拶（サテライト）',
      venueId: '0505c447-b699-4803-aab9-9cbdf9452c1b', // Room B
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 10, 15),
      endsAt: DateTime(2025, 11, 21, 10, 30),
      title: 'キーノート',
      venueId: 'e1a11efe-b1eb-43e1-ae60-9d2233e5dfe7', // Room A
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 10, 15),
      endsAt: DateTime(2025, 11, 21, 10, 30),
      title: 'キーノート（サテライト）',
      venueId: '0505c447-b699-4803-aab9-9cbdf9452c1b', // Room B
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 12),
      endsAt: DateTime(2025, 11, 21, 13, 30),
      title: 'ランチ',
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 18, 30),
      title: '懇親会',
      venueId: 'e1a11efe-b1eb-43e1-ae60-9d2233e5dfe7', // Room A
    ),
    TimelineEvent(
      startsAt: DateTime(2025, 11, 21, 18, 30),
      title: '懇親会',
      venueId: '0505c447-b699-4803-aab9-9cbdf9452c1b', // Room B
    ),
  ];
}

/// TimelineEvent model for app-specific events (not sessions)
class TimelineEvent {
  const TimelineEvent({
    required this.startsAt,
    required this.title,
    this.endsAt,
    this.venueId,
  });

  final DateTime startsAt;
  final String title;
  final DateTime? endsAt;
  final String? venueId;
}
