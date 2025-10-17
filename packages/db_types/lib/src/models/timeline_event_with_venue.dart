import 'package:db_types/src/converters/date_time_converter.dart';
import 'package:db_types/src/tables/session_venues.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_event_with_venue.freezed.dart';
part 'timeline_event_with_venue.g.dart';

@freezed
abstract class TimelineEventWithVenue with _$TimelineEventWithVenue {
  const factory TimelineEventWithVenue({
    required String id,
    required String title,
    @RequiredDateTimeConverter() required DateTime startsAt,
    @DateTimeConverter() DateTime? endsAt,
    String? venueId,
    @RequiredDateTimeConverter() required DateTime createdAt,
    SessionVenues? venue,
  }) = _TimelineEventWithVenue;

  factory TimelineEventWithVenue.fromJson(Map<String, dynamic> json) =>
      _$TimelineEventWithVenueFromJson(json);
}
