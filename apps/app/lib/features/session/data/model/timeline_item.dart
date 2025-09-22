import 'package:app/features/session/data/model/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_item.freezed.dart';
part 'timeline_item.g.dart';

@freezed
sealed class TimelineItem with _$TimelineItem {
  const factory TimelineItem.event({
    required DateTime startsAt,
    required DateTime endsAt,
    required String title,
    SessionVenue? venue,
  }) = TimelineItemEvent;

  const factory TimelineItem.session({
    required DateTime startsAt,
    required DateTime endsAt,
    required Session session,
  }) = TimelineItemSession;

  factory TimelineItem.fromJson(Map<String, dynamic> json) =>
      _$TimelineItemFromJson(json);
}