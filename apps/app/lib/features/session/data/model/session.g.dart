// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Session _$SessionFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Session',
  json,
  ($checkedConvert) {
    final val = _Session(
      id: $checkedConvert('id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      startsAt: $checkedConvert(
        'starts_at',
        (v) => DateTime.parse(v as String),
      ),
      endsAt: $checkedConvert('ends_at', (v) => DateTime.parse(v as String)),
      venue: $checkedConvert(
        'venue',
        (v) => SessionVenue.fromJson(v as Map<String, dynamic>),
      ),
      speakers: $checkedConvert(
        'speakers',
        (v) => (v as List<dynamic>)
            .map((e) => Speaker.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      sponsorId: $checkedConvert('sponsor_id', (v) => (v as num?)?.toInt()),
      isLightningTalk: $checkedConvert('is_lightning_talk', (v) => v as bool),
      videoUrl: $checkedConvert(
        'video_url',
        (v) => v == null ? null : Uri.parse(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'startsAt': 'starts_at',
    'endsAt': 'ends_at',
    'sponsorId': 'sponsor_id',
    'isLightningTalk': 'is_lightning_talk',
    'videoUrl': 'video_url',
  },
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'starts_at': instance.startsAt.toIso8601String(),
  'ends_at': instance.endsAt.toIso8601String(),
  'venue': instance.venue,
  'speakers': instance.speakers,
  'sponsor_id': instance.sponsorId,
  'is_lightning_talk': instance.isLightningTalk,
  'video_url': instance.videoUrl?.toString(),
};

_SessionVenue _$SessionVenueFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SessionVenue', json, ($checkedConvert) {
      final val = _SessionVenue(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$SessionVenueToJson(_SessionVenue instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_Speaker _$SpeakerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Speaker', json, ($checkedConvert) {
      final val = _Speaker(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        avatarUrl: $checkedConvert(
          'avatar_url',
          (v) => v == null ? null : Uri.parse(v as String),
        ),
        xUrl: $checkedConvert(
          'x_url',
          (v) => v == null ? null : Uri.parse(v as String),
        ),
        bio: $checkedConvert('bio', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'avatarUrl': 'avatar_url', 'xUrl': 'x_url'});

Map<String, dynamic> _$SpeakerToJson(_Speaker instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatar_url': instance.avatarUrl?.toString(),
  'x_url': instance.xUrl?.toString(),
  'bio': instance.bio,
};

_TimelineEvent _$TimelineEventFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_TimelineEvent',
      json,
      ($checkedConvert) {
        final val = _TimelineEvent(
          startsAt: $checkedConvert(
            'starts_at',
            (v) => DateTime.parse(v as String),
          ),
          title: $checkedConvert('title', (v) => v as String),
          endsAt: $checkedConvert(
            'ends_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          venueId: $checkedConvert('venue_id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'startsAt': 'starts_at',
        'endsAt': 'ends_at',
        'venueId': 'venue_id',
      },
    );

Map<String, dynamic> _$TimelineEventToJson(_TimelineEvent instance) =>
    <String, dynamic>{
      'starts_at': instance.startsAt.toIso8601String(),
      'title': instance.title,
      'ends_at': instance.endsAt?.toIso8601String(),
      'venue_id': instance.venueId,
    };
