// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'timeline_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimelineItemEvent _$TimelineItemEventFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'TimelineItemEvent',
  json,
  ($checkedConvert) {
    final val = TimelineItemEvent(
      startsAt: $checkedConvert(
        'starts_at',
        (v) => DateTime.parse(v as String),
      ),
      endsAt: $checkedConvert('ends_at', (v) => DateTime.parse(v as String)),
      title: $checkedConvert('title', (v) => v as String),
      venue: $checkedConvert(
        'venue',
        (v) =>
            v == null ? null : SessionVenue.fromJson(v as Map<String, dynamic>),
      ),
      $type: $checkedConvert('runtimeType', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'startsAt': 'starts_at',
    'endsAt': 'ends_at',
    r'$type': 'runtimeType',
  },
);

Map<String, dynamic> _$TimelineItemEventToJson(TimelineItemEvent instance) =>
    <String, dynamic>{
      'starts_at': instance.startsAt.toIso8601String(),
      'ends_at': instance.endsAt.toIso8601String(),
      'title': instance.title,
      'venue': instance.venue,
      'runtimeType': instance.$type,
    };

TimelineItemSession _$TimelineItemSessionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TimelineItemSession',
      json,
      ($checkedConvert) {
        final val = TimelineItemSession(
          startsAt: $checkedConvert(
            'starts_at',
            (v) => DateTime.parse(v as String),
          ),
          endsAt: $checkedConvert(
            'ends_at',
            (v) => DateTime.parse(v as String),
          ),
          session: $checkedConvert(
            'session',
            (v) => Session.fromJson(v as Map<String, dynamic>),
          ),
          $type: $checkedConvert('runtimeType', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'startsAt': 'starts_at',
        'endsAt': 'ends_at',
        r'$type': 'runtimeType',
      },
    );

Map<String, dynamic> _$TimelineItemSessionToJson(
  TimelineItemSession instance,
) => <String, dynamic>{
  'starts_at': instance.startsAt.toIso8601String(),
  'ends_at': instance.endsAt.toIso8601String(),
  'session': instance.session,
  'runtimeType': instance.$type,
};
