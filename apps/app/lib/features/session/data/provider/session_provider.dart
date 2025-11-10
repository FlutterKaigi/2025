import 'package:app/core/provider/bff_client.dart';
import 'package:app/features/session/data/model/session.dart';
import 'package:bff_client/bff_client.dart' hide Session;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_provider.g.dart';

@riverpod
Future<SessionScheduleResponse> sessionSchedule(Ref ref) async {
  final bffClient = ref.watch(bffClientProvider);
  final response = await bffClient.v1.session.getSessionSchedule();
  return response.data;
}

@riverpod
Future<List<Session>> sessions(Ref ref) async {
  final schedule = await ref.watch(sessionScheduleProvider.future);

  final sessions = <Session>[];
  for (final entry in schedule.schedule.entries) {
    // UTC時刻をローカルタイムに変換してSessionに変換
    final localSessions = entry.value.map((session) {
      return session
          .copyWith(
            startsAt: session.startsAt.toLocal(),
            endsAt: session.endsAt.toLocal(),
          )
          .toSession();
    });
    sessions.addAll(localSessions);
  }

  return sessions;
}

@riverpod
Future<List<VenueWithSessions>> venuesWithSessions(Ref ref) async {
  final bffClient = ref.watch(bffClientProvider);
  final response = await bffClient.v1.session.getSessionsByVenue();

  // UTC時刻をローカルタイムに変換
  return response.data.venues.map((venue) {
    return venue.copyWith(
      sessions: venue.sessions.map((session) {
        return session.copyWith(
          startsAt: session.startsAt.toLocal(),
          endsAt: session.endsAt.toLocal(),
        );
      }).toList(),
    );
  }).toList();
}

@riverpod
Future<List<TimelineEvent>> sessionEvents(Ref ref) async {
  final bffClient = ref.watch(bffClientProvider);
  final response = await bffClient.v1.session.getTimelineEvents();

  // UTC時刻をローカルタイムに変換
  return response.data.events.map((event) {
    return event.copyWith(
      startsAt: event.startsAt.toLocal(),
      endsAt: event.endsAt?.toLocal(),
    );
  }).toList();
}
