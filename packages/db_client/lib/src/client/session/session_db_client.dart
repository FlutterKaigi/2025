import 'package:db_client/src/client/db_client.dart';
import 'package:db_client/src/extensions/postgres_extensions.dart';
import 'package:db_types/db_types.dart';

class SessionDbClient {
  const SessionDbClient({
    required Executor executor,
  }) : _executor = executor;

  final Executor _executor;

  /// 全セッション一覧を取得
  Future<List<Sessions>> getAllSessions() async {
    final result = await _executor.execute(
      '''
        SELECT
          id,
          title,
          description,
          starts_at,
          ends_at,
          venue_id,
          sponsor_id,
          is_lightning_talk,
          is_beginners_lightning_talk,
          is_hands_on,
          video_url,
          created_at
        FROM sessions
        ORDER BY starts_at, venue_id
      ''',
    );

    return result.map((e) {
      return Sessions.fromJson(e.toColumnMapSafe());
    }).toList();
  }

  /// 会場別セッション一覧を取得（スピーカー、スポンサー情報含む）
  Future<List<SessionVenuesWithSessions>> getSessionsByVenue() async {
    final result = await _executor.execute(
      '''
        SELECT
          sv.id,
          sv.name,
          COALESCE(
            json_agg(
              json_build_object(
                'id', s.id,
                'title', s.title,
                'description', s.description,
                'starts_at', s.starts_at,
                'ends_at', s.ends_at,
                'is_lightning_talk', s.is_lightning_talk,
                'is_beginners_lightning_talk', s.is_beginners_lightning_talk,
                'is_hands_on', s.is_hands_on,
                'video_url', s.video_url,
                'speakers', COALESCE(
                  (SELECT json_agg(
                    json_build_object(
                      'id', sp.id,
                      'name', sp.name,
                      'avatar_url', sp.avatar_url,
                      'x_id', sp.x_id
                    )
                  )
                  FROM session_speakers ss
                  JOIN speakers sp ON ss.speaker_id = sp.id
                  WHERE ss.session_id = s.id),
                  '[]'::json
                ),
                'sponsor', CASE
                  WHEN s.sponsor_id IS NOT NULL THEN
                    (SELECT json_build_object(
                      'id', c.id,
                      'name', c.name,
                      'logo_url', c.logo_name,
                      'slug', cd.slug,
                      'pr_text', cd.pr_text,
                      'website_url', cd.website_url,
                      'sponsor_type', sc.sponsor_type,
                      'display_order', sc.display_order,
                      'basic_plan_type', bsc.basic_plan_type,
                      'option_plan_types', COALESCE(
                        array_agg(sco.option_plan_type::text) FILTER (WHERE sco.option_plan_type IS NOT NULL),
                        ARRAY[]::text[]
                      )
                    )
                    FROM companies c
                    INNER JOIN sponsor_companies sc ON c.id = sc.company_id
                    LEFT JOIN basic_sponsor_companies bsc ON sc.id = bsc.sponsor_company_id
                    LEFT JOIN company_drafts cd ON c.id = cd.company_id
                    LEFT JOIN company_draft_approvals cda ON cd.id = cda.company_draft_id
                    LEFT JOIN sponsor_company_options sco ON sc.id = sco.sponsor_company_id
                    WHERE sc.id = s.sponsor_id
                    GROUP BY c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url,
                             sc.sponsor_type, sc.display_order, bsc.basic_plan_type
                    )
                  ELSE NULL
                END
              ) ORDER BY s.starts_at
            ) FILTER (WHERE s.id IS NOT NULL),
            '[]'::json
          ) as sessions
        FROM session_venues sv
        LEFT JOIN sessions s ON sv.id = s.venue_id
        GROUP BY sv.id, sv.name
        ORDER BY sv.name
      ''',
    );

    return result.map((e) {
      return SessionVenuesWithSessions.fromJson(e.toColumnMapSafe());
    }).toList();
  }

  /// スポンサーセッション一覧を取得
  Future<List<SponsorWithSessions>> getSponsorSessions() async {
    final result = await _executor.execute(
      '''
        SELECT
          json_build_object(
            'id', c.id,
            'name', c.name,
            'logo_url', c.logo_name,
            'slug', cd.slug,
            'pr_text', cd.pr_text,
            'website_url', cd.website_url,
            'sponsor_type', sc.sponsor_type,
            'display_order', sc.display_order,
            'basic_plan_type', bsc.basic_plan_type,
            'option_plan_types', COALESCE(
              array_agg(DISTINCT sco.option_plan_type::text) FILTER (WHERE sco.option_plan_type IS NOT NULL),
              ARRAY[]::text[]
            )
          ) as sponsor,
          COALESCE(
            json_agg(
              json_build_object(
                'id', s.id,
                'title', s.title,
                'description', s.description,
                'starts_at', s.starts_at,
                'ends_at', s.ends_at,
                'is_lightning_talk', s.is_lightning_talk,
                'is_beginners_lightning_talk', s.is_beginners_lightning_talk,
                'is_hands_on', s.is_hands_on,
                'video_url', s.video_url,
                'venue', json_build_object(
                  'id', sv.id,
                  'name', sv.name
                ),
                'speakers', COALESCE(
                  (SELECT json_agg(
                    json_build_object(
                      'id', sp.id,
                      'name', sp.name,
                      'avatar_url', sp.avatar_url,
                      'x_id', sp.x_id
                    )
                  )
                  FROM session_speakers ss
                  JOIN speakers sp ON ss.speaker_id = sp.id
                  WHERE ss.session_id = s.id),
                  '[]'::json
                )
              ) ORDER BY s.starts_at
            ) FILTER (WHERE s.id IS NOT NULL),
            '[]'::json
          ) as sessions
        FROM sponsor_companies sc
        INNER JOIN companies c ON sc.company_id = c.id
        LEFT JOIN basic_sponsor_companies bsc ON sc.id = bsc.sponsor_company_id
        LEFT JOIN company_drafts cd ON c.id = cd.company_id
        LEFT JOIN company_draft_approvals cda ON cd.id = cda.company_draft_id
        LEFT JOIN sponsor_company_options sco ON sc.id = sco.sponsor_company_id
        LEFT JOIN sessions s ON sc.id = s.sponsor_id
        LEFT JOIN session_venues sv ON s.venue_id = sv.id
        WHERE cda.id IS NOT NULL AND s.id IS NOT NULL
        GROUP BY c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url,
                 sc.sponsor_type, sc.display_order, bsc.basic_plan_type
        ORDER BY sc.display_order
      ''',
    );

    return result.map((e) {
      return SponsorWithSessions.fromJson(e.toColumnMapSafe());
    }).toList();
  }

  /// 特定セッションの詳細を取得
  Future<SessionWithDetails?> getSessionById(String sessionId) async {
    final result = await _executor.execute(
      '''
        SELECT
          s.id,
          s.title,
          s.description,
          s.starts_at,
          s.ends_at,
          s.is_lightning_talk,
          s.is_beginners_lightning_talk,
          s.is_hands_on,
          s.video_url,
          COALESCE(
            (SELECT json_agg(
              json_build_object(
                'id', sp.id,
                'name', sp.name,
                'avatar_url', sp.avatar_url,
                'x_id', sp.x_id
              )
            )
            FROM session_speakers ss
            JOIN speakers sp ON ss.speaker_id = sp.id
            WHERE ss.session_id = s.id),
            '[]'::json
          ) as speakers,
          CASE
            WHEN s.sponsor_id IS NOT NULL THEN
              (SELECT json_build_object(
                'id', c.id,
                'name', c.name,
                'logo_url', c.logo_name,
                'slug', cd.slug,
                'pr_text', cd.pr_text,
                'website_url', cd.website_url,
                'sponsor_type', sc.sponsor_type,
                'display_order', sc.display_order,
                'basic_plan_type', bsc.basic_plan_type,
                'option_plan_types', COALESCE(
                  array_agg(sco.option_plan_type::text) FILTER (WHERE sco.option_plan_type IS NOT NULL),
                  ARRAY[]::text[]
                )
              )
              FROM companies c
              INNER JOIN sponsor_companies sc ON c.id = sc.company_id
              LEFT JOIN basic_sponsor_companies bsc ON sc.id = bsc.sponsor_company_id
              LEFT JOIN company_drafts cd ON c.id = cd.company_id
              LEFT JOIN company_draft_approvals cda ON cd.id = cda.company_draft_id
              LEFT JOIN sponsor_company_options sco ON sc.id = sco.sponsor_company_id
              WHERE sc.id = s.sponsor_id
              GROUP BY c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url,
                       sc.sponsor_type, sc.display_order, bsc.basic_plan_type
              )
            ELSE NULL
          END as sponsor
        FROM sessions s
        WHERE s.id = @sessionId
      ''',
      parameters: {'sessionId': sessionId},
    );

    if (result.isEmpty) {
      return null;
    }

    return SessionWithDetails.fromJson(result.first.toColumnMapSafe());
  }

  /// 時間帯別セッション取得
  Future<List<Sessions>> getSessionsByTimeRange({
    required DateTime startTime,
    required DateTime endTime,
  }) async {
    final result = await _executor.execute(
      '''
        SELECT
          id,
          title,
          description,
          starts_at,
          ends_at,
          venue_id,
          sponsor_id,
          is_lightning_talk,
          is_beginners_lightning_talk,
          is_hands_on,
          video_url,
          created_at
        FROM sessions
        WHERE starts_at >= @startTime AND ends_at <= @endTime
        ORDER BY starts_at, venue_id
      ''',
      parameters: {
        'startTime': startTime.toIso8601String(),
        'endTime': endTime.toIso8601String(),
      },
    );

    return result.map((e) {
      return Sessions.fromJson(e.toColumnMapSafe());
    }).toList();
  }
}
