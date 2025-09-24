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

      return <String, dynamic>{
        'sessions': sessions.map((s) => <String, dynamic>{
          'id': s.id,
          'title': s.title,
          'description': s.description,
          'starts_at': s.startsAt.toIso8601String(),
          'ends_at': s.endsAt.toIso8601String(),
          'venue_id': s.venueId,
          'sponsor_id': s.sponsorId,
          'is_lightning_talk': s.isLightningTalk,
          'is_beginners_lightning_talk': s.isBeginnersLightningTalk,
          'is_hands_on': s.isHandsOn,
          'video_url': s.videoUrl,
          'created_at': s.createdAt.toIso8601String(),
        }).toList(),
      };
    },
  );

  /// 会場別セッション一覧を取得（スピーカー、スポンサー情報含む）
  @Route.get('/sessions/venues')
  Future<Response> _getSessionsByVenue(Request request) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);
      final venuesWithSessions = await database.session.getSessionsByVenue();

      return <String, dynamic>{
        'venues': venuesWithSessions.map((v) => <String, dynamic>{
          'id': v.id,
          'name': v.name,
          'sessions': v.sessions.map((s) => <String, dynamic>{
            'id': s.id,
            'title': s.title,
            'description': s.description,
            'starts_at': s.startsAt.toIso8601String(),
            'ends_at': s.endsAt.toIso8601String(),
            'is_lightning_talk': s.isLightningTalk,
            'is_beginners_lightning_talk': s.isBeginnersLightningTalk,
            'is_hands_on': s.isHandsOn,
            'video_url': s.videoUrl,
            'speakers': s.speakers.map((sp) => <String, dynamic>{
              'id': sp.id,
              'name': sp.name,
              'avatar_name': sp.avatarName,
              'x_id': sp.xId,
            }).toList(),
            'sponsor': s.sponsor != null ? <String, dynamic>{
              'id': s.sponsor!.id,
              'name': s.sponsor!.name,
              'logo_url': s.sponsor!.logoUrl,
              'slug': s.sponsor!.slug,
              'pr_text': s.sponsor!.prText,
              'website_url': s.sponsor!.websiteUrl,
              'sponsor_type': s.sponsor!.sponsorType.name,
              'display_order': s.sponsor!.displayOrder,
              'basic_plan_type': s.sponsor!.basicPlanType?.name,
              'option_plan_types': s.sponsor!.optionPlanTypes
                  .map((o) => o.name).toList(),
            } : null,
          }).toList(),
        }).toList(),
      };
    },
  );

  /// スポンサーセッション一覧を取得
  @Route.get('/sessions/sponsors')
  Future<Response> _getSponsorSessions(Request request) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);
      final sponsorSessions = await database.session.getSponsorSessions();

      return <String, dynamic>{
        'sponsors': sponsorSessions.map((s) => <String, dynamic>{
          'sponsor': <String, dynamic>{
            'id': s.sponsor.id,
            'name': s.sponsor.name,
            'logo_url': s.sponsor.logoUrl,
            'slug': s.sponsor.slug,
            'pr_text': s.sponsor.prText,
            'website_url': s.sponsor.websiteUrl,
            'sponsor_type': s.sponsor.sponsorType.name,
            'display_order': s.sponsor.displayOrder,
            'basic_plan_type': s.sponsor.basicPlanType?.name,
            'option_plan_types': s.sponsor.optionPlanTypes
                .map((o) => o.name).toList(),
          },
          'sessions': s.sessions.map((session) => <String, dynamic>{
            'id': session.id,
            'title': session.title,
            'description': session.description,
            'starts_at': session.startsAt.toIso8601String(),
            'ends_at': session.endsAt.toIso8601String(),
            'is_lightning_talk': session.isLightningTalk,
            'is_beginners_lightning_talk': session.isBeginnersLightningTalk,
            'is_hands_on': session.isHandsOn,
            'video_url': session.videoUrl,
            'venue': session.venue != null ? <String, dynamic>{
              'id': session.venue!.id,
              'name': session.venue!.name,
            } : null,
            'speakers': session.speakers.map((sp) => <String, dynamic>{
              'id': sp.id,
              'name': sp.name,
              'avatar_name': sp.avatarName,
              'x_id': sp.xId,
            }).toList(),
          }).toList(),
        }).toList(),
      };
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
        return <String, dynamic>{
          'error': 'Session not found',
          'session_id': id,
        };
      }

      return <String, dynamic>{
        'id': session.id,
        'title': session.title,
        'description': session.description,
        'starts_at': session.startsAt.toIso8601String(),
        'ends_at': session.endsAt.toIso8601String(),
        'is_lightning_talk': session.isLightningTalk,
        'is_beginners_lightning_talk': session.isBeginnersLightningTalk,
        'is_hands_on': session.isHandsOn,
        'video_url': session.videoUrl,
        'speakers': session.speakers.map((sp) => <String, dynamic>{
          'id': sp.id,
          'name': sp.name,
          'avatar_name': sp.avatarName,
          'x_id': sp.xId,
        }).toList(),
        'sponsor': session.sponsor != null ? <String, dynamic>{
          'id': session.sponsor!.id,
          'name': session.sponsor!.name,
          'logo_url': session.sponsor!.logoUrl,
          'slug': session.sponsor!.slug,
          'pr_text': session.sponsor!.prText,
          'website_url': session.sponsor!.websiteUrl,
          'sponsor_type': session.sponsor!.sponsorType.name,
          'display_order': session.sponsor!.displayOrder,
          'basic_plan_type': session.sponsor!.basicPlanType?.name,
          'option_plan_types': session.sponsor!.optionPlanTypes
              .map((o) => o.name).toList(),
        } : null,
      };
    },
  );

  /// タイムテーブル形式でセッション一覧を取得
  @Route.get('/sessions/schedule')
  Future<Response> _getSessionSchedule(Request request) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);
      final venuesWithSessions = await database.session.getSessionsByVenue();

      // タイムスロットごとにグループ化
      final schedule = <String, dynamic>{};
      for (final venue in venuesWithSessions) {
        for (final session in venue.sessions) {
          final timeSlot = '${session.startsAt.toIso8601String()}-'
              '${session.endsAt.toIso8601String()}';
          if (!schedule.containsKey(timeSlot)) {
            schedule[timeSlot] = <Map<String, dynamic>>[];
          }
          (schedule[timeSlot] as List).add({
            'venue': venue.name,
            'venue_id': venue.id,
            'id': session.id,
            'title': session.title,
            'description': session.description,
            'starts_at': session.startsAt.toIso8601String(),
            'ends_at': session.endsAt.toIso8601String(),
            'is_lightning_talk': session.isLightningTalk,
            'is_beginners_lightning_talk': session.isBeginnersLightningTalk,
            'is_hands_on': session.isHandsOn,
            'video_url': session.videoUrl,
            'speakers': session.speakers.map((sp) => <String, dynamic>{
              'id': sp.id,
              'name': sp.name,
              'avatar_name': sp.avatarName,
              'x_id': sp.xId,
            }).toList(),
            'sponsor': session.sponsor != null ? <String, dynamic>{
              'id': session.sponsor!.id,
              'name': session.sponsor!.name,
              'logo_url': session.sponsor!.logoUrl,
              'slug': session.sponsor!.slug,
              'pr_text': session.sponsor!.prText,
              'website_url': session.sponsor!.websiteUrl,
              'sponsor_type': session.sponsor!.sponsorType.name,
              'display_order': session.sponsor!.displayOrder,
              'basic_plan_type': session.sponsor!.basicPlanType?.name,
              'option_plan_types': session.sponsor!.optionPlanTypes
                  .map((o) => o.name).toList(),
            } : null,
          });
        }
      }

      return <String, dynamic>{
        'schedule': schedule,
      };
    },
  );

  /// 全スピーカー一覧を取得
  @Route.get('/speakers')
  Future<Response> _getAllSpeakers(Request request) async => jsonResponse(
    () async {
      final database = await container.read(dbClientProvider.future);
      final speakers = await database.speaker.getAllSpeakers();

      return <String, dynamic>{
        'speakers': speakers.map((s) => <String, dynamic>{
          'id': s.id,
          'name': s.name,
          'avatar_name': s.avatarName,
          'x_id': s.xId,
          'avatar_url': s.avatarName != null
              ? database.speaker.generateAvatarUrl(s.avatarName)
              : null,
        }).toList(),
      };
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
        return <String, dynamic>{
          'error': 'Speaker not found',
          'speaker_id': id,
        };
      }

      return <String, dynamic>{
        'id': speaker.id,
        'name': speaker.name,
        'avatar_name': speaker.avatarName,
        'x_id': speaker.xId,
        'avatar_url': speaker.avatarName != null
            ? database.speaker.generateAvatarUrl(speaker.avatarName)
            : null,
      };
    },
  );

  Router get router => _$SessionApiServiceRouter(this);
}
