import 'package:bff_client/bff_client.dart' hide Session;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

/// アプリ用のセッションモデル
/// APIのScheduleSessionから変換される
@freezed
abstract class Session with _$Session {
  const factory Session({
    required String venue,
    required String venueId,
    required String id,
    required String title,
    required String description,
    required DateTime startsAt,
    required DateTime endsAt,
    required List<SessionType> types,
    required List<Speaker> speakers,
    String? videoUrl,
    String? url,
    Sponsor? sponsor,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

/// セッションのタイプ
enum SessionType {
  regularTalk,
  sponsorTalk,
  lightningTalk,
  beginnersLightningTalk,
  handsOn,
  keynote,
}

/// ScheduleSessionからSessionへの変換拡張メソッド
extension ScheduleSessionToSessionExtension on ScheduleSession {
  Session toSession() => Session(
    venue: venue,
    venueId: venueId,
    id: id,
    title: title.replaceAll('[Keynote]', ''),
    description: description,
    startsAt: startsAt,
    endsAt: endsAt,
    types: [
      if (isLightningTalk)
        SessionType.lightningTalk
      else if (isBeginnersLightningTalk)
        SessionType.beginnersLightningTalk
      else if (isHandsOn)
        SessionType.handsOn
      else if (sponsor != null)
        SessionType.sponsorTalk
      else if (title.startsWith('[Keynote]'))
        SessionType.keynote
      else
        SessionType.regularTalk,
    ],
    speakers: speakers,
    videoUrl: videoUrl,
    url: url,
    sponsor: sponsor,
  );
}
