import 'package:bff_client/src/model/v1/session/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_with_venue_response.freezed.dart';
part 'session_with_venue_response.g.dart';

@freezed
abstract class SessionWithVenueResponse with _$SessionWithVenueResponse {
  const factory SessionWithVenueResponse({
    required List<VenueWithSessions> venues,
  }) = _SessionWithVenueResponse;

  factory SessionWithVenueResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionWithVenueResponseFromJson(json);
}

@freezed
abstract class VenueWithSessions with _$VenueWithSessions {
  const factory VenueWithSessions({
    required String id,
    required String name,
    required List<SessionWithSpeakers> sessions,
  }) = _VenueWithSessions;

  factory VenueWithSessions.fromJson(Map<String, dynamic> json) =>
      _$VenueWithSessionsFromJson(json);
}
