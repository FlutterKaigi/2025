// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'session_api_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$SessionApiServiceRouter(SessionApiService service) {
  final router = Router();
  router.add('GET', r'/sessions', service._getAllSessions);
  router.add('GET', r'/sessions/venues', service._getSessionsByVenue);
  router.add('GET', r'/sessions/sponsors', service._getSponsorSessions);
  router.add('GET', r'/sessions/schedule', service._getSessionSchedule);
  router.add('GET', r'/sessions/<id>', service._getSessionById);
  router.add('GET', r'/speakers', service._getAllSpeakers);
  router.add('GET', r'/speakers/<id>', service._getSpeakerById);
  router.add('GET', r'/timeline-events', service._getAllTimelineEvents);
  return router;
}
