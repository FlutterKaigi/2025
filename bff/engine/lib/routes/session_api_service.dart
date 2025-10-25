import 'package:bff_client/bff_client.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'session_api_service.g.dart';

class SessionApiService {
  /// 全セッション一覧を取得
  @Route.get('/sessions')
  Future<Response> _getAllSessions(Request request) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);
      final sessions = await database.session.getAllSessions();

      return SessionListResponse(
        sessions: sessions.map((s) => s.toSession()).toList(),
      ).toJson();
    },
  );

  /// 会場別セッション一覧を取得（スピーカー、スポンサー情報含む）
  @Route.get('/sessions/venues')
  Future<Response> _getSessionsByVenue(Request request) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);
      final venuesWithSessions = await database.session.getSessionsByVenue();

      return SessionWithVenueResponse(
        venues: venuesWithSessions.map((v) => v.toVenueWithSessions()).toList(),
      ).toJson();
    },
  );

  /// スポンサーセッション一覧を取得
  @Route.get('/sessions/sponsors')
  Future<Response> _getSponsorSessions(Request request) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);
      final sponsorSessions = await database.session.getSponsorSessions();

      return SponsorSessionResponse(
        sponsors: sponsorSessions
            .map((s) => s.toSponsorWithSessions())
            .toList(),
      ).toJson();
    },
  );

  /// タイムテーブル形式でセッション一覧を取得
  @Route.get('/sessions/schedule')
  Future<Response> _getSessionSchedule(Request request) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);
      final venuesWithSessions = await database.session.getSessionsByVenue();

      // タイムスロットごとにグループ化
      final schedule = <String, List<ScheduleSession>>{};
      for (final venue in venuesWithSessions) {
        for (final session in venue.sessions) {
          final timeSlot =
              '${session.startsAt.toIso8601String()}-'
              '${session.endsAt.toIso8601String()}';
          if (!schedule.containsKey(timeSlot)) {
            schedule[timeSlot] = <ScheduleSession>[];
          }
          schedule[timeSlot]!.add(
            ScheduleSession(
              venue: venue.name,
              venueId: venue.id,
              id: session.id,
              title: session.title,
              description: session.description,
              startsAt: session.startsAt,
              endsAt: session.endsAt,
              isLightningTalk: session.isLightningTalk,
              isBeginnersLightningTalk: session.isBeginnersLightningTalk,
              isHandsOn: session.isHandsOn,
              speakers: session.speakers.map((sp) => sp.toSpeaker()).toList(),
              videoUrl: session.videoUrl,
              sponsor: session.sponsor?.toSponsor(),
            ),
          );
        }
      }

      return SessionScheduleResponse(
        schedule: schedule,
      ).toJson();
    },
  );

  /// 特定セッションの詳細を取得
  @Route.get('/sessions/<id>')
  Future<Response> _getSessionById(Request request, String id) async =>
      jsonResponse(
        () async {
          final database = await container.read(dbClientProvider.future);
          final session = await database.session.getSessionById(id);

          if (session == null) {
            throw ErrorResponse.errorCode(
              code: ErrorCode.notFound,
              detail: 'Session not found',
            );
          }

          return SessionDetailResponse(
            id: session.id,
            title: session.title,
            description: session.description,
            startsAt: session.startsAt,
            endsAt: session.endsAt,
            isLightningTalk: session.isLightningTalk,
            isBeginnersLightningTalk: session.isBeginnersLightningTalk,
            isHandsOn: session.isHandsOn,
            speakers: session.speakers.map((sp) => sp.toSpeaker()).toList(),
            videoUrl: session.videoUrl,
            sponsor: session.sponsor?.toSponsor(),
          ).toJson();
        },
      );

  /// 全スピーカー一覧を取得
  @Route.get('/speakers')
  Future<Response> _getAllSpeakers(Request request) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);
      final speakers = await database.speaker.getAllSpeakers();

      return SpeakerListResponse(
        speakers: speakers.map((s) => s.toSpeaker()).toList(),
      ).toJson();
    },
  );

  /// 特定スピーカーの詳細を取得
  @Route.get('/speakers/<id>')
  Future<Response> _getSpeakerById(Request request, String id) async =>
      jsonResponse(
        () async {
          final database = await container.read(dbClientProvider.future);
          final speaker = await database.speaker.getSpeakerById(id);

          if (speaker == null) {
            throw ErrorResponse.errorCode(
              code: ErrorCode.notFound,
              detail: 'Speaker not found',
            );
          }

          return speaker.toSpeaker().toJson();
        },
      );

  /// 全タイムラインイベント一覧を取得
  @Route.get('/timeline-events')
  Future<Response> _getAllTimelineEvents(Request request) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);
      final timelineEvents = await database.timelineEvent.getAllTimelineEvents();

      return TimelineEventListResponse(
        events: timelineEvents.map((e) => e.toTimelineEvent()).toList(),
      ).toJson();
    },
  );

  Router get router => _$SessionApiServiceRouter(this);
}
