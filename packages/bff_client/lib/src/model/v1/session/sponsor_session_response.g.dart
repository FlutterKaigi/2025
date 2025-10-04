// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'sponsor_session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SponsorSessionResponse _$SponsorSessionResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SponsorSessionResponse', json, ($checkedConvert) {
  final val = _SponsorSessionResponse(
    sponsors: $checkedConvert(
      'sponsors',
      (v) => (v as List<dynamic>)
          .map((e) => SponsorWithSessions.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$SponsorSessionResponseToJson(
  _SponsorSessionResponse instance,
) => <String, dynamic>{'sponsors': instance.sponsors};

_SponsorWithSessions _$SponsorWithSessionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SponsorWithSessions', json, ($checkedConvert) {
      final val = _SponsorWithSessions(
        sponsor: $checkedConvert(
          'sponsor',
          (v) => Sponsor.fromJson(v as Map<String, dynamic>),
        ),
        sessions: $checkedConvert(
          'sessions',
          (v) => (v as List<dynamic>)
              .map((e) => SessionWithVenue.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SponsorWithSessionsToJson(
  _SponsorWithSessions instance,
) => <String, dynamic>{
  'sponsor': instance.sponsor,
  'sessions': instance.sessions,
};

_SessionWithVenue _$SessionWithVenueFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_SessionWithVenue',
  json,
  ($checkedConvert) {
    final val = _SessionWithVenue(
      id: $checkedConvert('id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      startsAt: $checkedConvert(
        'starts_at',
        (v) => DateTime.parse(v as String),
      ),
      endsAt: $checkedConvert('ends_at', (v) => DateTime.parse(v as String)),
      isLightningTalk: $checkedConvert('is_lightning_talk', (v) => v as bool),
      isBeginnersLightningTalk: $checkedConvert(
        'is_beginners_lightning_talk',
        (v) => v as bool,
      ),
      isHandsOn: $checkedConvert('is_hands_on', (v) => v as bool),
      speakers: $checkedConvert(
        'speakers',
        (v) => (v as List<dynamic>)
            .map((e) => Speaker.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      videoUrl: $checkedConvert('video_url', (v) => v as String?),
      venue: $checkedConvert(
        'venue',
        (v) => v == null ? null : Venue.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'startsAt': 'starts_at',
    'endsAt': 'ends_at',
    'isLightningTalk': 'is_lightning_talk',
    'isBeginnersLightningTalk': 'is_beginners_lightning_talk',
    'isHandsOn': 'is_hands_on',
    'videoUrl': 'video_url',
  },
);

Map<String, dynamic> _$SessionWithVenueToJson(_SessionWithVenue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'starts_at': instance.startsAt.toIso8601String(),
      'ends_at': instance.endsAt.toIso8601String(),
      'is_lightning_talk': instance.isLightningTalk,
      'is_beginners_lightning_talk': instance.isBeginnersLightningTalk,
      'is_hands_on': instance.isHandsOn,
      'speakers': instance.speakers,
      'video_url': instance.videoUrl,
      'venue': instance.venue,
    };
