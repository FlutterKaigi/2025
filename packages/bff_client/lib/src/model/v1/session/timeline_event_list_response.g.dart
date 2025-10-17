// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'timeline_event_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimelineEventListResponse _$TimelineEventListResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_TimelineEventListResponse', json, ($checkedConvert) {
  final val = _TimelineEventListResponse(
    events: $checkedConvert(
      'events',
      (v) => (v as List<dynamic>)
          .map((e) => TimelineEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$TimelineEventListResponseToJson(
  _TimelineEventListResponse instance,
) => <String, dynamic>{'events': instance.events};

_TimelineEvent _$TimelineEventFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_TimelineEvent',
      json,
      ($checkedConvert) {
        final val = _TimelineEvent(
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
          venue: $checkedConvert(
            'venue',
            (v) => v == null ? null : Venue.fromJson(v as Map<String, dynamic>),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'startsAt': 'starts_at', 'endsAt': 'ends_at'},
    );

Map<String, dynamic> _$TimelineEventToJson(_TimelineEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'starts_at': instance.startsAt.toIso8601String(),
      'ends_at': instance.endsAt?.toIso8601String(),
      'venue': instance.venue,
    };
