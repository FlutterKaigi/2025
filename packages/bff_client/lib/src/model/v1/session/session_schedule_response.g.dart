// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'session_schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionScheduleResponse _$SessionScheduleResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SessionScheduleResponse', json, ($checkedConvert) {
  final val = _SessionScheduleResponse(
    schedule: $checkedConvert(
      'schedule',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => ScheduleSession.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    ),
  );
  return val;
});

Map<String, dynamic> _$SessionScheduleResponseToJson(
  _SessionScheduleResponse instance,
) => <String, dynamic>{'schedule': instance.schedule};

_ScheduleSession _$ScheduleSessionFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_ScheduleSession',
  json,
  ($checkedConvert) {
    final val = _ScheduleSession(
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
    'isLightningTalk': 'is_lightning_talk',
    'isBeginnersLightningTalk': 'is_beginners_lightning_talk',
    'isHandsOn': 'is_hands_on',
    'videoUrl': 'video_url',
  },
);

Map<String, dynamic> _$ScheduleSessionToJson(_ScheduleSession instance) =>
    <String, dynamic>{
      'venue': instance.venue,
      'venue_id': instance.venueId,
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
      'url': instance.url,
      'sponsor': instance.sponsor,
    };
