// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'session_venues_with_sessions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionVenuesWithSessions _$SessionVenuesWithSessionsFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_SessionVenuesWithSessions', json, ($checkedConvert) {
  final val = _SessionVenuesWithSessions(
    id: $checkedConvert('id', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
    sessions: $checkedConvert(
      'sessions',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => SessionWithDetails.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    ),
  );
  return val;
});

Map<String, dynamic> _$SessionVenuesWithSessionsToJson(
  _SessionVenuesWithSessions instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'sessions': instance.sessions,
};

_SessionWithDetails _$SessionWithDetailsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_SessionWithDetails',
      json,
      ($checkedConvert) {
        final val = _SessionWithDetails(
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
          url: $checkedConvert('url', (v) => v as String?),
          speakers: $checkedConvert(
            'speakers',
            (v) =>
                (v as List<dynamic>?)
                    ?.map((e) => Speakers.fromJson(e as Map<String, dynamic>))
                    .toList() ??
                const [],
          ),
          sponsor: $checkedConvert(
            'sponsor',
            (v) => v == null
                ? null
                : CompanySponsorDetail.fromJson(v as Map<String, dynamic>),
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

Map<String, dynamic> _$SessionWithDetailsToJson(_SessionWithDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'starts_at': const RequiredDateTimeConverter().toJson(instance.startsAt),
      'ends_at': const RequiredDateTimeConverter().toJson(instance.endsAt),
      'is_lightning_talk': instance.isLightningTalk,
      'is_beginners_lightning_talk': instance.isBeginnersLightningTalk,
      'is_hands_on': instance.isHandsOn,
      'video_url': instance.videoUrl,
      'url': instance.url,
      'speakers': instance.speakers,
      'sponsor': instance.sponsor,
    };
