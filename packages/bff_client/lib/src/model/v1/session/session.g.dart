// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

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
      isLightningTalk: $checkedConvert('is_lightning_talk', (v) => v as bool),
      isBeginnersLightningTalk: $checkedConvert(
        'is_beginners_lightning_talk',
        (v) => v as bool,
      ),
      isHandsOn: $checkedConvert('is_hands_on', (v) => v as bool),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      videoUrl: $checkedConvert('video_url', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'startsAt': 'starts_at',
    'endsAt': 'ends_at',
    'isLightningTalk': 'is_lightning_talk',
    'isBeginnersLightningTalk': 'is_beginners_lightning_talk',
    'isHandsOn': 'is_hands_on',
    'createdAt': 'created_at',
    'videoUrl': 'video_url',
  },
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'starts_at': instance.startsAt.toIso8601String(),
  'ends_at': instance.endsAt.toIso8601String(),
  'is_lightning_talk': instance.isLightningTalk,
  'is_beginners_lightning_talk': instance.isBeginnersLightningTalk,
  'is_hands_on': instance.isHandsOn,
  'created_at': instance.createdAt.toIso8601String(),
  'video_url': instance.videoUrl,
};

_Speaker _$SpeakerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Speaker', json, ($checkedConvert) {
      final val = _Speaker(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        avatarUrl: $checkedConvert('avatar_url', (v) => v as String?),
        xId: $checkedConvert('x_id', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'avatarUrl': 'avatar_url', 'xId': 'x_id'});

Map<String, dynamic> _$SpeakerToJson(_Speaker instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatar_url': instance.avatarUrl,
  'x_id': instance.xId,
};

_Venue _$VenueFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_Venue', json, ($checkedConvert) {
      final val = _Venue(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$VenueToJson(_Venue instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

_Sponsor _$SponsorFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_Sponsor',
  json,
  ($checkedConvert) {
    final val = _Sponsor(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      name: $checkedConvert('name', (v) => v as String),
      logoUrl: $checkedConvert('logo_url', (v) => v as String),
      slug: $checkedConvert('slug', (v) => v as String),
      prText: $checkedConvert('pr_text', (v) => v as String),
      websiteUrl: $checkedConvert('website_url', (v) => v as String),
      sponsorType: $checkedConvert('sponsor_type', (v) => v as String),
      displayOrder: $checkedConvert('display_order', (v) => (v as num).toInt()),
      optionPlanTypes: $checkedConvert(
        'option_plan_types',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      basicPlanType: $checkedConvert('basic_plan_type', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'logoUrl': 'logo_url',
    'prText': 'pr_text',
    'websiteUrl': 'website_url',
    'sponsorType': 'sponsor_type',
    'displayOrder': 'display_order',
    'optionPlanTypes': 'option_plan_types',
    'basicPlanType': 'basic_plan_type',
  },
);

Map<String, dynamic> _$SponsorToJson(_Sponsor instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logo_url': instance.logoUrl,
  'slug': instance.slug,
  'pr_text': instance.prText,
  'website_url': instance.websiteUrl,
  'sponsor_type': instance.sponsorType,
  'display_order': instance.displayOrder,
  'option_plan_types': instance.optionPlanTypes,
  'basic_plan_type': instance.basicPlanType,
};

_SessionWithSpeakers _$SessionWithSpeakersFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_SessionWithSpeakers',
  json,
  ($checkedConvert) {
    final val = _SessionWithSpeakers(
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

Map<String, dynamic> _$SessionWithSpeakersToJson(
  _SessionWithSpeakers instance,
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
