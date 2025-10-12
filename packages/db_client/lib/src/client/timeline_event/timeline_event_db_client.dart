import 'package:db_client/src/client/db_client.dart';
import 'package:db_client/src/extensions/postgres_extensions.dart';
import 'package:db_types/db_types.dart';

class TimelineEventDbClient {
  const TimelineEventDbClient({
    required Executor executor,
  }) : _executor = executor;

  final Executor _executor;

  /// 全タイムラインイベント一覧を取得（会場情報含む）
  Future<List<TimelineEventWithVenue>> getAllTimelineEvents() async {
    final result = await _executor.execute(
      '''
        SELECT
          te.id,
          te.title,
          te.starts_at,
          te.ends_at,
          te.venue_id,
          te.created_at,
          CASE
            WHEN te.venue_id IS NOT NULL THEN
              json_build_object(
                'id', sv.id,
                'name', sv.name
              )
            ELSE NULL
          END as venue
        FROM timeline_events te
        LEFT JOIN session_venues sv ON te.venue_id = sv.id
        ORDER BY te.starts_at
      ''',
    );

    return result.map((e) {
      return TimelineEventWithVenue.fromJson(e.toColumnMapSafe());
    }).toList();
  }
}
