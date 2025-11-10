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
      venue: $checkedConvert('venue', (v) => v as String),
      venueId: $checkedConvert('venue_id', (v) => v as String),
      id: $checkedConvert('id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      startsAt: $checkedConvert(
        'starts_at',
        (v) => DateTime.parse(v as String),
      ),
      endsAt: $checkedConvert('ends_at', (v) => DateTime.parse(v as String)),
      types: $checkedConvert(
        'types',
        (v) => (v as List<dynamic>)
            .map((e) => $enumDecode(_$SessionTypeEnumMap, e))
            .toList(),
      ),
      speakers: $checkedConvert(
        'speakers',
        (v) => (v as List<dynamic>)
            .map((e) => Speaker.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      videoUrl: $checkedConvert('video_url', (v) => v as String?),
      url: $checkedConvert('url', (v) => v as String?),
      sponsor: $checkedConvert(
        'sponsor',
        (v) => v == null ? null : Sponsor.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'venueId': 'venue_id',
    'startsAt': 'starts_at',
    'endsAt': 'ends_at',
    'videoUrl': 'video_url',
  },
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'venue': instance.venue,
  'venue_id': instance.venueId,
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'starts_at': instance.startsAt.toIso8601String(),
  'ends_at': instance.endsAt.toIso8601String(),
  'types': instance.types.map((e) => _$SessionTypeEnumMap[e]!).toList(),
  'speakers': instance.speakers,
  'video_url': instance.videoUrl,
  'url': instance.url,
  'sponsor': instance.sponsor,
};

const _$SessionTypeEnumMap = {
  SessionType.regularTalk: 'regularTalk',
  SessionType.sponsorTalk: 'sponsorTalk',
  SessionType.lightningTalk: 'lightningTalk',
  SessionType.beginnersLightningTalk: 'beginnersLightningTalk',
  SessionType.handsOn: 'handsOn',
  SessionType.keynote: 'keynote',
};
