// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'timeline_event_with_venue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimelineEventWithVenue _$TimelineEventWithVenueFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_TimelineEventWithVenue',
  json,
  ($checkedConvert) {
    final val = _TimelineEventWithVenue(
      id: $checkedConvert('id', (v) => v as String),
      title: $checkedConvert('title', (v) => v as String),
      startsAt: $checkedConvert(
        'starts_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
      ),
      endsAt: $checkedConvert(
        'ends_at',
        (v) => const DateTimeConverter().fromJson(v),
      ),
      venueId: $checkedConvert('venue_id', (v) => v as String?),
      createdAt: $checkedConvert(
        'created_at',
        (v) => const RequiredDateTimeConverter().fromJson(v),
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
    'venueId': 'venue_id',
    'createdAt': 'created_at',
  },
);

Map<String, dynamic> _$TimelineEventWithVenueToJson(
  _TimelineEventWithVenue instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'starts_at': const RequiredDateTimeConverter().toJson(instance.startsAt),
  'ends_at': const DateTimeConverter().toJson(instance.endsAt),
  'venue_id': instance.venueId,
  'created_at': const RequiredDateTimeConverter().toJson(instance.createdAt),
  'venue': instance.venue,
};
