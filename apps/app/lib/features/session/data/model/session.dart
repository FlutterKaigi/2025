import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
sealed class Session with _$Session {
  const factory Session({
    required String id,
    required String title,
    required String description,
    required DateTime startsAt,
    required DateTime endsAt,
    required SessionVenue venue,
    @Default([]) List<Speaker> speakers,
    @Default(null) int? sponsorId,
    @Default(false) bool isLightningTalk,
    @Default(false) bool isBeginnersLightningTalk,
    @Default(false) bool isHandsOn,
    Uri? videoUrl,
  }) = _Session;

  const Session._();

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  bool get isSponsorTalk => sponsorId != null;
}

@freezed
sealed class SessionVenue with _$SessionVenue {
  const factory SessionVenue({
    required String id,
    required String name,
  }) = _SessionVenue;

  factory SessionVenue.fromJson(Map<String, dynamic> json) =>
      _$SessionVenueFromJson(json);
}

@freezed
sealed class Speaker with _$Speaker {
  const factory Speaker({
    required String id,
    required String name,
    Uri? avatarUrl,
    Uri? xUrl,
    String? bio,
  }) = _Speaker;

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);
}

@freezed
sealed class TimelineEvent with _$TimelineEvent {
  const factory TimelineEvent({
    required DateTime startsAt,
    required String title,
    DateTime? endsAt,
    String? venueId,
  }) = _TimelineEvent;

  factory TimelineEvent.fromJson(Map<String, dynamic> json) =>
      _$TimelineEventFromJson(json);
}
