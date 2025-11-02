import 'package:bff_client/bff_client.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';

/// イベントの基準時刻（タイムラインの開始時刻）
/// 固定値: 2025-11-13 09:00 (JST)
/// すべてのイベント（タイムラインイベント、セッション）が
/// この基準時刻からの相対時間で計算される
DateTime get eventBaseTime => DateTime(2025, 11, 13, 9);

/// BFF APIから取得したセッション情報をTimelineEntry形式に変換
List<TimelineEntry> convertSessionsToTimelineEntries(
  List<VenueWithSessions> venues,
) {
  final entries = <TimelineEntry>[];

  for (final venue in venues) {
    for (final session in venue.sessions) {
      // UTC to local時刻に変換
      final localStartsAt = session.startsAt.toLocal();
      final localEndsAt = session.endsAt.toLocal();

      // DateTimeからDurationに変換（固定基準時刻から）
      final start = localStartsAt.difference(eventBaseTime);
      final duration = localEndsAt.difference(localStartsAt);

      entries.add(
        (
          title: (ja: session.title, en: null),
          url: null, // セッション詳細ページのURLは後で追加可能
          venueId: venue.id,
          venueName: venue.name,
          satellite: false,
          start: start,
          time: duration,
        ),
      );
    }
  }

  return entries;
}

/// TimelineEventをTimelineEntry形式に変換
List<TimelineEntry> convertTimelineEventsToEntries(
  List<TimelineEvent> events,
) {
  final entries = <TimelineEntry>[];

  for (final event in events) {
    final localStartsAt = event.startsAt.toLocal();
    final localEndsAt = event.endsAt?.toLocal();

    // DateTimeからDurationに変換（固定基準時刻から）
    final start = localStartsAt.difference(eventBaseTime);
    final duration = localEndsAt != null
        ? localEndsAt.difference(localStartsAt)
        : const Duration(minutes: 30);

    // venueがない場合はスキップ
    if (event.venue == null) {
      continue;
    }

    entries.add(
      (
        title: (ja: event.title, en: null),
        url: null,
        venueId: event.venue!.id,
        venueName: event.venue!.name,
        satellite: false,
        start: start,
        time: duration,
      ),
    );
  }

  return entries;
}
