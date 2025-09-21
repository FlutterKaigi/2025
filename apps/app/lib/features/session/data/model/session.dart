import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

@immutable
final class Session {
  const Session({
    required this.id,
    required this.title,
    required this.description,
    required this.startsAt,
    required this.endsAt,
    required this.venue,
    required this.speakers,
    required this.sponsorId,
    required this.isLightningTalk,
    this.videoUrl,
  });

  final String id;
  final String title;
  final String description;
  final DateTime startsAt;
  final DateTime endsAt;
  final SessionVenue venue;
  final List<Speaker> speakers;
  final int? sponsorId;
  final bool isLightningTalk;
  final Uri? videoUrl;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is Session &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        startsAt == other.startsAt &&
        endsAt == other.endsAt &&
        venue == other.venue &&
        const ListEquality<Speaker>().equals(speakers, other.speakers) &&
        sponsorId == other.sponsorId &&
        isLightningTalk == other.isLightningTalk &&
        videoUrl == other.videoUrl;
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    startsAt,
    endsAt,
    venue,
    const ListEquality<Speaker>().hash(speakers),
    sponsorId,
    isLightningTalk,
    videoUrl,
  );

  bool get isSponsorTalk => sponsorId != null;
}

@immutable
final class SessionVenue {
  const SessionVenue({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is SessionVenue && id == other.id && name == other.name;
  }

  @override
  int get hashCode => Object.hash(id, name);
}

@immutable
final class Speaker {
  const Speaker({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.xUrl,
    this.bio,
  });

  final String id;
  final String name;
  final Uri? avatarUrl;
  final Uri? xUrl;
  final String? bio;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is Speaker &&
        id == other.id &&
        name == other.name &&
        avatarUrl == other.avatarUrl &&
        xUrl == other.xUrl &&
        bio == other.bio;
  }

  @override
  int get hashCode => Object.hash(id, name, avatarUrl, xUrl, bio);
}

@immutable
final class TimelineEvent {
  const TimelineEvent({
    required this.startsAt,
    required this.title,
    this.endsAt,
    this.venueId,
  });

  final DateTime startsAt;
  final DateTime? endsAt;
  final String title;
  final String? venueId;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is TimelineEvent &&
        startsAt == other.startsAt &&
        endsAt == other.endsAt &&
        title == other.title &&
        venueId == other.venueId;
  }

  @override
  int get hashCode => Object.hash(startsAt, endsAt, title, venueId);
}
