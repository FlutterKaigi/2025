import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_response.freezed.dart';
part 'session_response.g.dart';

@freezed
abstract class SessionResponse with _$SessionResponse {
  const factory SessionResponse({
    required String id,
    required String title,
    required String description,
    required String startsAt,
    required String endsAt,
    required String venueId,
    required String createdAt,
    int? sponsorId,
    @Default(false) bool isLightningTalk,
    @Default(false) bool isBeginnersLightningTalk,
    @Default(false) bool isHandsOn,
    String? videoUrl,
  }) = _SessionResponse;

  factory SessionResponse.fromJson(Map<String, Object?> json) =>
      _$SessionResponseFromJson(json);
}

@freezed
abstract class SessionsResponse with _$SessionsResponse {
  const factory SessionsResponse({
    @Default([]) List<SessionResponse> sessions,
  }) = _SessionsResponse;

  factory SessionsResponse.fromJson(Map<String, Object?> json) =>
      _$SessionsResponseFromJson(json);
}

@freezed
abstract class SpeakerResponse with _$SpeakerResponse {
  const factory SpeakerResponse({
    required String id,
    required String name,
    String? avatarUrl,
    String? xId,
  }) = _SpeakerResponse;

  factory SpeakerResponse.fromJson(Map<String, Object?> json) =>
      _$SpeakerResponseFromJson(json);
}

@freezed
abstract class SpeakersResponse with _$SpeakersResponse {
  const factory SpeakersResponse({
    @Default([]) List<SpeakerResponse> speakers,
  }) = _SpeakersResponse;

  factory SpeakersResponse.fromJson(Map<String, Object?> json) =>
      _$SpeakersResponseFromJson(json);
}

@freezed
abstract class SessionWithDetailsResponse with _$SessionWithDetailsResponse {
  const factory SessionWithDetailsResponse({
    required String id,
    required String title,
    required String description,
    required String startsAt,
    required String endsAt,
    @Default(false) bool isLightningTalk,
    @Default(false) bool isBeginnersLightningTalk,
    @Default(false) bool isHandsOn,
    String? videoUrl,
    @Default([]) List<SpeakerResponse> speakers,
    dynamic sponsor,
  }) = _SessionWithDetailsResponse;

  factory SessionWithDetailsResponse.fromJson(Map<String, Object?> json) =>
      _$SessionWithDetailsResponseFromJson(json);
}

@freezed
abstract class VenueWithSessionsResponse with _$VenueWithSessionsResponse {
  const factory VenueWithSessionsResponse({
    required String id,
    required String name,
    @Default([]) List<SessionWithDetailsResponse> sessions,
  }) = _VenueWithSessionsResponse;

  factory VenueWithSessionsResponse.fromJson(Map<String, Object?> json) =>
      _$VenueWithSessionsResponseFromJson(json);
}

@freezed
abstract class VenuesWithSessionsResponse with _$VenuesWithSessionsResponse {
  const factory VenuesWithSessionsResponse({
    @Default([]) List<VenueWithSessionsResponse> venues,
  }) = _VenuesWithSessionsResponse;

  factory VenuesWithSessionsResponse.fromJson(Map<String, Object?> json) =>
      _$VenuesWithSessionsResponseFromJson(json);
}

@freezed
abstract class SessionScheduleItemResponse with _$SessionScheduleItemResponse {
  const factory SessionScheduleItemResponse({
    required String venue,
    required String venueId,
    required String id,
    required String title,
    required String description,
    required String startsAt,
    required String endsAt,
    @Default(false) bool isLightningTalk,
    @Default(false) bool isBeginnersLightningTalk,
    @Default(false) bool isHandsOn,
    String? videoUrl,
    @Default([]) List<SpeakerResponse> speakers,
    dynamic sponsor,
  }) = _SessionScheduleItemResponse;

  factory SessionScheduleItemResponse.fromJson(Map<String, Object?> json) =>
      _$SessionScheduleItemResponseFromJson(json);
}

@freezed
abstract class SessionScheduleResponse with _$SessionScheduleResponse {
  const factory SessionScheduleResponse({
    @Default(<String, List<SessionScheduleItemResponse>>{})
    Map<String, List<SessionScheduleItemResponse>> schedule,
  }) = _SessionScheduleResponse;

  factory SessionScheduleResponse.fromJson(Map<String, Object?> json) {
    final schedule = <String, List<SessionScheduleItemResponse>>{};
    final jsonMap = json as Map<String, dynamic>;

    for (final entry in jsonMap.entries) {
      final timeSlot = entry.key;
      final sessions = entry.value as List<dynamic>;
      schedule[timeSlot] = sessions
          .map(
            (s) =>
                SessionScheduleItemResponse.fromJson(s as Map<String, dynamic>),
          )
          .toList();
    }

    return SessionScheduleResponse(schedule: schedule);
  }
}
