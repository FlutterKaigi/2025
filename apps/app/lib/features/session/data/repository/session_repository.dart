import 'package:app/features/session/data/mock/mock_sessions.dart';
import 'package:app/features/session/data/model/session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_repository.g.dart';

@riverpod
SessionRepository sessionRepository(Ref ref) {
  return SessionRepository();
}

class SessionRepository {
  Future<List<Session>> fetchSessions() async {
    return MockSessions.sessions;
  }

  Future<List<SessionVenue>> fetchVenues() async {
    return MockSessions.venues;
  }
}
