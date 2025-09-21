import 'package:app/features/session/data/model/session.dart';
import 'package:flutter/foundation.dart';

@immutable
sealed class TimelineItem {
  const TimelineItem({
    required this.startsAt,
    required this.endsAt,
  });

  final DateTime startsAt;
  final DateTime endsAt;
}

@immutable
final class TimelineItemEvent extends TimelineItem {
  const TimelineItemEvent({
    required super.startsAt,
    required super.endsAt,
    required this.title,
    this.venue,
  });

  final String title;
  final SessionVenue? venue;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is TimelineItemEvent &&
        startsAt == other.startsAt &&
        endsAt == other.endsAt &&
        title == other.title &&
        venue == other.venue;
  }

  @override
  int get hashCode => Object.hash(startsAt, endsAt, title, venue);
}

@immutable
final class TimelineItemSession extends TimelineItem {
  const TimelineItemSession({
    required super.startsAt,
    required super.endsAt,
    required this.session,
  });

  final Session session;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is TimelineItemSession &&
        startsAt == other.startsAt &&
        endsAt == other.endsAt &&
        session == other.session;
  }

  @override
  int get hashCode => Object.hash(startsAt, endsAt, session);
}
