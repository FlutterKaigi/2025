import 'package:bff_client/src/model/v1/session/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sponsor_session_response.freezed.dart';
part 'sponsor_session_response.g.dart';

@freezed
abstract class SponsorSessionResponse with _$SponsorSessionResponse {
  const factory SponsorSessionResponse({
    required List<SponsorWithSessions> sponsors,
  }) = _SponsorSessionResponse;

  factory SponsorSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$SponsorSessionResponseFromJson(json);
}

@freezed
abstract class SponsorWithSessions with _$SponsorWithSessions {
  const factory SponsorWithSessions({
    required Sponsor sponsor,
    required List<SessionWithVenue> sessions,
  }) = _SponsorWithSessions;

  factory SponsorWithSessions.fromJson(Map<String, dynamic> json) =>
      _$SponsorWithSessionsFromJson(json);
}

@freezed
abstract class SessionWithVenue with _$SessionWithVenue {
  const factory SessionWithVenue({
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
    Venue? venue,
  }) = _SessionWithVenue;

  factory SessionWithVenue.fromJson(Map<String, dynamic> json) =>
      _$SessionWithVenueFromJson(json);
}
