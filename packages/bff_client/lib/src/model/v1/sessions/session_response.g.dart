// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_SessionResponse',
      json,
      ($checkedConvert) {
        final val = _SessionResponse(
          id: $checkedConvert('id', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          startsAt: $checkedConvert('starts_at', (v) => v as String),
          endsAt: $checkedConvert('ends_at', (v) => v as String),
          venueId: $checkedConvert('venue_id', (v) => v as String),
          createdAt: $checkedConvert('created_at', (v) => v as String),
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
        );
        return val;
      },
      fieldKeyMap: const {
        'startsAt': 'starts_at',
        'endsAt': 'ends_at',
        'venueId': 'venue_id',
        'createdAt': 'created_at',
        'sponsorId': 'sponsor_id',
        'isLightningTalk': 'is_lightning_talk',
        'isBeginnersLightningTalk': 'is_beginners_lightning_talk',
        'isHandsOn': 'is_hands_on',
        'videoUrl': 'video_url',
      },
    );

Map<String, dynamic> _$SessionResponseToJson(_SessionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'starts_at': instance.startsAt,
      'ends_at': instance.endsAt,
      'venue_id': instance.venueId,
      'created_at': instance.createdAt,
      'sponsor_id': instance.sponsorId,
      'is_lightning_talk': instance.isLightningTalk,
      'is_beginners_lightning_talk': instance.isBeginnersLightningTalk,
      'is_hands_on': instance.isHandsOn,
      'video_url': instance.videoUrl,
    };

_SessionsResponse _$SessionsResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SessionsResponse', json, ($checkedConvert) {
      final val = _SessionsResponse(
        sessions: $checkedConvert(
          'sessions',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) => SessionResponse.fromJson(e as Map<String, dynamic>),
                  )
                  .toList() ??
              const [],
        ),
      );
      return val;
    });

Map<String, dynamic> _$SessionsResponseToJson(_SessionsResponse instance) =>
    <String, dynamic>{'sessions': instance.sessions};

_SpeakerResponse _$SpeakerResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_SpeakerResponse',
      json,
      ($checkedConvert) {
        final val = _SpeakerResponse(
          id: $checkedConvert('id', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          avatarUrl: $checkedConvert('avatar_url', (v) => v as String?),
          xId: $checkedConvert('x_id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'avatarUrl': 'avatar_url', 'xId': 'x_id'},
    );

Map<String, dynamic> _$SpeakerResponseToJson(_SpeakerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'x_id': instance.xId,
    };

_SpeakersResponse _$SpeakersResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SpeakersResponse', json, ($checkedConvert) {
      final val = _SpeakersResponse(
        speakers: $checkedConvert(
          'speakers',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) => SpeakerResponse.fromJson(e as Map<String, dynamic>),
                  )
                  .toList() ??
              const [],
        ),
      );
      return val;
    });

Map<String, dynamic> _$SpeakersResponseToJson(_SpeakersResponse instance) =>
    <String, dynamic>{'speakers': instance.speakers};

_SessionWithDetailsResponse _$SessionWithDetailsResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_SessionWithDetailsResponse',
  json,
  ($checkedConvert) {
    final val = _SessionWithDetailsResponse(
      id: $checkedConvert('id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      startsAt: $checkedConvert('starts_at', (v) => v as String),
      endsAt: $checkedConvert('ends_at', (v) => v as String),
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
                ?.map(
                  (e) => SpeakerResponse.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            const [],
      ),
      sponsor: $checkedConvert('sponsor', (v) => v),
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

Map<String, dynamic> _$SessionWithDetailsResponseToJson(
  _SessionWithDetailsResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'starts_at': instance.startsAt,
  'ends_at': instance.endsAt,
  'is_lightning_talk': instance.isLightningTalk,
  'is_beginners_lightning_talk': instance.isBeginnersLightningTalk,
  'is_hands_on': instance.isHandsOn,
  'video_url': instance.videoUrl,
  'speakers': instance.speakers,
  'sponsor': instance.sponsor,
};

_VenueWithSessionsResponse _$VenueWithSessionsResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_VenueWithSessionsResponse', json, ($checkedConvert) {
  final val = _VenueWithSessionsResponse(
    id: $checkedConvert('id', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
    sessions: $checkedConvert(
      'sessions',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => SessionWithDetailsResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const [],
    ),
  );
  return val;
});

Map<String, dynamic> _$VenueWithSessionsResponseToJson(
  _VenueWithSessionsResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'sessions': instance.sessions,
};

_VenuesWithSessionsResponse _$VenuesWithSessionsResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_VenuesWithSessionsResponse', json, ($checkedConvert) {
  final val = _VenuesWithSessionsResponse(
    venues: $checkedConvert(
      'venues',
      (v) =>
          (v as List<dynamic>?)
              ?.map(
                (e) => VenueWithSessionsResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const [],
    ),
  );
  return val;
});

Map<String, dynamic> _$VenuesWithSessionsResponseToJson(
  _VenuesWithSessionsResponse instance,
) => <String, dynamic>{'venues': instance.venues};

_SessionScheduleItemResponse _$SessionScheduleItemResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_SessionScheduleItemResponse',
  json,
  ($checkedConvert) {
    final val = _SessionScheduleItemResponse(
      venue: $checkedConvert('venue', (v) => v as String),
      venueId: $checkedConvert('venue_id', (v) => v as String),
      id: $checkedConvert('id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      description: $checkedConvert('description', (v) => v as String),
      startsAt: $checkedConvert('starts_at', (v) => v as String),
      endsAt: $checkedConvert('ends_at', (v) => v as String),
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
                ?.map(
                  (e) => SpeakerResponse.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            const [],
      ),
      sponsor: $checkedConvert('sponsor', (v) => v),
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

Map<String, dynamic> _$SessionScheduleItemResponseToJson(
  _SessionScheduleItemResponse instance,
) => <String, dynamic>{
  'venue': instance.venue,
  'venue_id': instance.venueId,
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'starts_at': instance.startsAt,
  'ends_at': instance.endsAt,
  'is_lightning_talk': instance.isLightningTalk,
  'is_beginners_lightning_talk': instance.isBeginnersLightningTalk,
  'is_hands_on': instance.isHandsOn,
  'video_url': instance.videoUrl,
  'speakers': instance.speakers,
  'sponsor': instance.sponsor,
};
