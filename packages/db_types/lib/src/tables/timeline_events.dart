import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_events.freezed.dart';
part 'timeline_events.g.dart';

@freezed
abstract class TimelineEvents with _$TimelineEvents {
  const factory TimelineEvents({
    required String id,
    required String title,
    required DateTime startsAt,
    DateTime? endsAt,
    String? venueId,
    String? url,
    required DateTime createdAt,
  }) = _TimelineEvents;

  factory TimelineEvents.fromJson(Map<String, dynamic> json) =>
      _$TimelineEventsFromJson(json);
}
