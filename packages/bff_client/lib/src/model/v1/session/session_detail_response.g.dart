// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'session_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionDetailResponse _$SessionDetailResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_SessionDetailResponse',
  json,
  ($checkedConvert) {
    final val = _SessionDetailResponse(
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
      sponsor: $checkedConvert(
        'sponsor',
        (v) => v == null ? null : Sponsor.fromJson(v as Map<String, dynamic>),
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

Map<String, dynamic> _$SessionDetailResponseToJson(
  _SessionDetailResponse instance,
) => <String, dynamic>{
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
  'sponsor': instance.sponsor,
};
