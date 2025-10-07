// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'sponsor_with_sessions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SponsorWithSessions _$SponsorWithSessionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SponsorWithSessions', json, ($checkedConvert) {
      final val = _SponsorWithSessions(
        sponsor: $checkedConvert(
          'sponsor',
          (v) => CompanySponsorDetail.fromJson(v as Map<String, dynamic>),
        ),
        sessions: $checkedConvert(
          'sessions',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) => SponsorSessionDetail.fromJson(
                      e as Map<String, dynamic>,
                    ),
                  )
                  .toList() ??
              const [],
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

_SponsorSessionDetail _$SponsorSessionDetailFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_SponsorSessionDetail',
  json,
  ($checkedConvert) {
    final val = _SponsorSessionDetail(
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
      speakers: $checkedConvert(
        'speakers',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Speakers.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      venue: $checkedConvert(
        'venue',
        (v) => v == null
            ? null
            : SessionVenues.fromJson(v as Map<String, dynamic>),
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

Map<String, dynamic> _$SponsorSessionDetailToJson(
  _SponsorSessionDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'starts_at': const RequiredDateTimeConverter().toJson(instance.startsAt),
  'ends_at': const RequiredDateTimeConverter().toJson(instance.endsAt),
  'is_lightning_talk': instance.isLightningTalk,
  'is_beginners_lightning_talk': instance.isBeginnersLightningTalk,
  'is_hands_on': instance.isHandsOn,
  'video_url': instance.videoUrl,
  'speakers': instance.speakers,
  'venue': instance.venue,
};
