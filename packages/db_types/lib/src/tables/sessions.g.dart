// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'sessions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sessions _$SessionsFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Sessions',
  json,
  ($checkedConvert) {
    final val = _Sessions(
      id: $checkedConvert('id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      startsAt: $checkedConvert(
        'starts_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
      endsAt: $checkedConvert(
        'ends_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
      venueId: $checkedConvert('venue_id', (v) => v as String),
      sponsorId: $checkedConvert('sponsor_id', (v) => (v as num?)?.toInt()),
      isLightningTalk: $checkedConvert(
        'is_lightning_talk',
        (v) => v as bool? ?? false,
      ),
      isBeginnersLightningTalk: $checkedConvert(
        'is_beginners_lightning_talk',
        (v) => v as bool? ?? false,
      ),
      isHandsOn: $checkedConvert('is_hands_on', (v) => v as bool? ?? false),
      videoUrl: $checkedConvert('video_url', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'startsAt': 'starts_at',
    'endsAt': 'ends_at',
    'venueId': 'venue_id',
    'sponsorId': 'sponsor_id',
    'isLightningTalk': 'is_lightning_talk',
    'isBeginnersLightningTalk': 'is_beginners_lightning_talk',
    'isHandsOn': 'is_hands_on',
    'videoUrl': 'video_url',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$SessionsToJson(_Sessions instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'starts_at': const RequiredDateTimeConverter().toJson(instance.startsAt),
  'ends_at': const RequiredDateTimeConverter().toJson(instance.endsAt),
  'venue_id': instance.venueId,
  'sponsor_id': instance.sponsorId,
  'is_lightning_talk': instance.isLightningTalk,
  'is_beginners_lightning_talk': instance.isBeginnersLightningTalk,
  'is_hands_on': instance.isHandsOn,
  'video_url': instance.videoUrl,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
};
