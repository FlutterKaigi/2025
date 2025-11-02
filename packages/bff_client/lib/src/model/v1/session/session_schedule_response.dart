import 'package:bff_client/src/model/v1/session/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_schedule_response.freezed.dart';
part 'session_schedule_response.g.dart';

@freezed
abstract class SessionScheduleResponse with _$SessionScheduleResponse {
  const factory SessionScheduleResponse({
    required Map<String, List<ScheduleSession>> schedule,
  }) = _SessionScheduleResponse;

  factory SessionScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionScheduleResponseFromJson(json);
}

@freezed
abstract class ScheduleSession with _$ScheduleSession {
  const factory ScheduleSession({
    required String venue,
    required String venueId,
    required String id,
    required String title,
    required String description,
    required DateTime startsAt,
    required DateTime endsAt,
    required bool isLightningTalk,
    required bool isBeginnersLightningTalk,
    required bool isHandsOn,
    required List<Speaker> speakers,
    String? videoUrl,
    String? url,
    Sponsor? sponsor,
  }) = _ScheduleSession;

  factory ScheduleSession.fromJson(Map<String, dynamic> json) =>
      _$ScheduleSessionFromJson(json);
}
