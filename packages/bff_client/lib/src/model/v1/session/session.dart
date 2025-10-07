import 'package:bff_client/src/model/v1/session/session_with_venue_response.dart';
import 'package:bff_client/src/model/v1/session/sponsor_session_response.dart';
import 'package:db_types/db_types.dart' as db_types;
import 'package:freezed_annotation/freezed_annotation.dart';

export 'session_detail_response.dart';
export 'session_list_response.dart';
export 'session_schedule_response.dart';
export 'session_with_venue_response.dart';
export 'speaker_list_response.dart';
export 'sponsor_session_response.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({
    required String id,
    required String title,
    required String description,
    required DateTime startsAt,
    required DateTime endsAt,
    required bool isLightningTalk,
    required bool isBeginnersLightningTalk,
    required bool isHandsOn,
    required DateTime createdAt,
    String? videoUrl,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

@freezed
abstract class Speaker with _$Speaker {
  const factory Speaker({
    required String id,
    required String name,
    String? avatarUrl,
    String? xId,
  }) = _Speaker;

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);
}

@freezed
abstract class Venue with _$Venue {
  const factory Venue({
    required String id,
    required String name,
  }) = _Venue;

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
}

@freezed
abstract class Sponsor with _$Sponsor {
  const factory Sponsor({
    required int id,
    required String name,
    required String logoUrl,
    required String slug,
    required String prText,
    required String websiteUrl,
    required String sponsorType,
    required String displayOrder,
    required List<String> optionPlanTypes,
    String? basicPlanType,
  }) = _Sponsor;

  factory Sponsor.fromJson(Map<String, dynamic> json) =>
      _$SponsorFromJson(json);
}

@freezed
abstract class SessionWithSpeakers with _$SessionWithSpeakers {
  const factory SessionWithSpeakers({
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
    Sponsor? sponsor,
  }) = _SessionWithSpeakers;

  factory SessionWithSpeakers.fromJson(Map<String, dynamic> json) =>
      _$SessionWithSpeakersFromJson(json);
}

extension SessionsExtension on db_types.Sessions {
  Session toSession() => Session(
    id: id,
    title: title,
    description: description,
    startsAt: startsAt,
    endsAt: endsAt,
    isLightningTalk: isLightningTalk,
    isBeginnersLightningTalk: isBeginnersLightningTalk,
    isHandsOn: isHandsOn,
    videoUrl: videoUrl,
    createdAt: createdAt,
  );
}

extension SpeakersExtension on db_types.Speakers {
  Speaker toSpeaker() => Speaker(
    id: id,
    name: name,
    avatarUrl: avatarUrl,
    xId: xId,
  );
}

extension SessionVenuesExtension on db_types.SessionVenues {
  Venue toVenue() => Venue(
    id: id,
    name: name,
  );
}

extension CompanySponsorDetailExtension on db_types.CompanySponsorDetail {
  Sponsor toSponsor() => Sponsor(
    id: id,
    name: name,
    logoUrl: logoUrl,
    slug: slug,
    prText: prText,
    websiteUrl: websiteUrl,
    sponsorType: sponsorType.name,
    displayOrder: displayOrder,
    optionPlanTypes: optionPlanTypes.map((o) => o.name).toList(),
    basicPlanType: basicPlanType?.name,
  );
}

extension SessionWithDetailsExtension on db_types.SessionWithDetails {
  SessionWithSpeakers toSessionWithSpeakers() => SessionWithSpeakers(
    id: id,
    title: title,
    description: description,
    startsAt: startsAt,
    endsAt: endsAt,
    isLightningTalk: isLightningTalk,
    isBeginnersLightningTalk: isBeginnersLightningTalk,
    isHandsOn: isHandsOn,
    speakers: speakers.map((s) => s.toSpeaker()).toList(),
    videoUrl: videoUrl,
    sponsor: sponsor?.toSponsor(),
  );
}

extension SessionVenuesWithSessionsExtension
    on db_types.SessionVenuesWithSessions {
  VenueWithSessions toVenueWithSessions() => VenueWithSessions(
    id: id,
    name: name,
    sessions: sessions.map((s) => s.toSessionWithSpeakers()).toList(),
  );
}

extension SponsorSessionDetailExtension on db_types.SponsorSessionDetail {
  SessionWithVenue toSessionWithVenue() => SessionWithVenue(
    id: id,
    title: title,
    description: description,
    startsAt: startsAt,
    endsAt: endsAt,
    isLightningTalk: isLightningTalk,
    isBeginnersLightningTalk: isBeginnersLightningTalk,
    isHandsOn: isHandsOn,
    speakers: speakers.map((s) => s.toSpeaker()).toList(),
    videoUrl: videoUrl,
    venue: venue?.toVenue(),
  );
}

extension SponsorWithSessionsExtension on db_types.SponsorWithSessions {
  SponsorWithSessions toSponsorWithSessions() => SponsorWithSessions(
    sponsor: sponsor.toSponsor(),
    sessions: sessions.map((s) => s.toSessionWithVenue()).toList(),
  );
}
