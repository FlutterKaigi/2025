import 'package:bff_client/src/model/v1/session/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_event_list_response.freezed.dart';
part 'timeline_event_list_response.g.dart';

@freezed
abstract class TimelineEventListResponse with _$TimelineEventListResponse {
  const factory TimelineEventListResponse({
    required List<TimelineEvent> events,
  }) = _TimelineEventListResponse;

  factory TimelineEventListResponse.fromJson(Map<String, dynamic> json) =>
      _$TimelineEventListResponseFromJson(json);
}

@freezed
abstract class TimelineEvent with _$TimelineEvent {
  const factory TimelineEvent({
    required String id,
    required String title,
    required DateTime startsAt,
    DateTime? endsAt,
    Venue? venue,
  }) = _TimelineEvent;

  factory TimelineEvent.fromJson(Map<String, dynamic> json) =>
      _$TimelineEventFromJson(json);
}
