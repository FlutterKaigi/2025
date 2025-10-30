import 'package:bff_client/bff_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_item.freezed.dart';

@freezed
sealed class TimelineItem with _$TimelineItem {
  const factory TimelineItem.event({
    required DateTime startsAt,
    required DateTime endsAt,
    required String title,
    Venue? venue,
  }) = TimelineItemEvent;

  const factory TimelineItem.session({
    required DateTime startsAt,
    required DateTime endsAt,
    required ScheduleSession session,
  }) = TimelineItemSession;
}
