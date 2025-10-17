// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'timeline_events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimelineEvents _$TimelineEventsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_TimelineEvents',
      json,
      ($checkedConvert) {
        final val = _TimelineEvents(
          id: $checkedConvert('id', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          startsAt: $checkedConvert(
            'starts_at',
            (v) => DateTime.parse(v as String),
          ),
          endsAt: $checkedConvert(
            'ends_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          venueId: $checkedConvert('venue_id', (v) => v as String?),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'startsAt': 'starts_at',
        'endsAt': 'ends_at',
        'venueId': 'venue_id',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$TimelineEventsToJson(_TimelineEvents instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'starts_at': instance.startsAt.toIso8601String(),
      'ends_at': instance.endsAt?.toIso8601String(),
      'venue_id': instance.venueId,
      'created_at': instance.createdAt.toIso8601String(),
    };
