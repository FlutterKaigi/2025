import 'package:app/features/session/data/model/session.dart';
import 'package:app/features/session/data/repository/session_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_provider.g.dart';

@riverpod
Future<List<Session>> sessions(Ref ref) async {
  final repository = ref.read(sessionRepositoryProvider);
  return repository.fetchSessions();
}

@riverpod
Future<List<SessionVenue>> sessionVenues(Ref ref) async {
  final repository = ref.read(sessionRepositoryProvider);
  return repository.fetchVenues();
}
