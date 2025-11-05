-- Update session_venues_with_sessions view to include url field
DROP VIEW IF EXISTS session_venues_with_sessions;

CREATE OR REPLACE VIEW session_venues_with_sessions AS
SELECT
  sv.id,
  sv.name,
  coalesce(
    (
      SELECT
        json_agg(
          json_build_object(
            'id',
            s.id,
            'title',
            s.title,
            'description',
            s.description,
            'starts_at',
            s.starts_at,
            'ends_at',
            s.ends_at,
            'is_lightning_talk',
            s.is_lightning_talk,
            'is_beginners_lightning_talk',
            s.is_beginners_lightning_talk,
            'is_hands_on',
            s.is_hands_on,
            'video_url',
            s.video_url,
            'url',
            s.url,
            'speakers',
            coalesce(
              (
                SELECT
                  json_agg(json_build_object('id', sp.id, 'name', sp.name, 'avatar_url', sp.avatar_url, 'x_id', sp.x_id))
                FROM
                  session_speakers ss
                  JOIN speakers sp ON ss.speaker_id = sp.id
                WHERE
                  ss.session_id = s.id
              ),
              '[]'::json
            ),
            'sponsor',
            CASE
              WHEN s.sponsor_id IS NOT NULL THEN (
                SELECT
                  json_build_object(
                    'id',
                    c.id,
                    'name',
                    c.name,
                    'logo_url',
                    c.logo_name,
                    'slug',
                    cd.slug,
                    'pr_text',
                    cd.pr_text,
                    'website_url',
                    cd.website_url,
                    'sponsor_type',
                    sc.sponsor_type,
                    'display_order',
                    sc.display_order,
                    'basic_plan_type',
                    bsc.basic_plan_type,
                    'option_plan_types',
                    coalesce(
                      array_agg(sco.option_plan_type::text) FILTER (
                        WHERE
                          sco.option_plan_type IS NOT NULL
                      ),
                      ARRAY[]::TEXT[]
                    )
                  )
                FROM
                  companies c
                  INNER JOIN sponsor_companies sc ON c.id = sc.company_id
                  LEFT JOIN basic_sponsor_companies bsc ON sc.id = bsc.sponsor_company_id
                  LEFT JOIN company_drafts cd ON c.id = cd.company_id
                  LEFT JOIN company_draft_approvals cda ON cd.id = cda.company_draft_id
                  LEFT JOIN sponsor_company_options sco ON sc.id = sco.sponsor_company_id
                WHERE
                  sc.id = s.sponsor_id
                GROUP BY
                  c.id,
                  c.name,
                  c.logo_name,
                  cd.slug,
                  cd.pr_text,
                  cd.website_url,
                  sc.sponsor_type,
                  sc.display_order,
                  bsc.basic_plan_type
              )
              ELSE NULL
            END
          )
          ORDER BY
            s.starts_at
        )
      FROM
        sessions s
      WHERE
        s.venue_id = sv.id
    ),
    '[]'::json
  ) AS sessions
FROM
  session_venues sv
ORDER BY
  sv.name;

-- Update sponsor_with_sessions view to include url field
DROP VIEW IF EXISTS sponsor_with_sessions;

CREATE OR REPLACE VIEW sponsor_with_sessions AS
SELECT
  json_build_object(
    'id',
    c.id,
    'name',
    c.name,
    'logo_url',
    c.logo_name,
    'slug',
    cd.slug,
    'pr_text',
    cd.pr_text,
    'website_url',
    cd.website_url,
    'sponsor_type',
    sc.sponsor_type,
    'display_order',
    sc.display_order,
    'basic_plan_type',
    bsc.basic_plan_type,
    'option_plan_types',
    coalesce(
      array_agg(DISTINCT sco.option_plan_type::text) FILTER (
        WHERE
          sco.option_plan_type IS NOT NULL
      ),
      ARRAY[]::TEXT[]
    )
  ) AS sponsor,
  coalesce(
    (
      SELECT
        json_agg(
          json_build_object(
            'id',
            s.id,
            'title',
            s.title,
            'description',
            s.description,
            'starts_at',
            s.starts_at,
            'ends_at',
            s.ends_at,
            'is_lightning_talk',
            s.is_lightning_talk,
            'is_beginners_lightning_talk',
            s.is_beginners_lightning_talk,
            'is_hands_on',
            s.is_hands_on,
            'video_url',
            s.video_url,
            'url',
            s.url,
            'venue',
            json_build_object('id', sv.id, 'name', sv.name),
            'speakers',
            coalesce(
              (
                SELECT
                  json_agg(json_build_object('id', sp.id, 'name', sp.name, 'avatar_url', sp.avatar_url, 'x_id', sp.x_id))
                FROM
                  session_speakers ss
                  JOIN speakers sp ON ss.speaker_id = sp.id
                WHERE
                  ss.session_id = s.id
              ),
              '[]'::json
            )
          )
          ORDER BY
            s.starts_at
        )
      FROM
        sessions s
        JOIN session_venues sv ON s.venue_id = sv.id
      WHERE
        s.sponsor_id = sc.id
    ),
    '[]'::json
  ) AS sessions
FROM
  sponsor_companies sc
  INNER JOIN companies c ON sc.company_id = c.id
  LEFT JOIN basic_sponsor_companies bsc ON sc.id = bsc.sponsor_company_id
  LEFT JOIN company_drafts cd ON c.id = cd.company_id
  LEFT JOIN company_draft_approvals cda ON cd.id = cda.company_draft_id
  LEFT JOIN sponsor_company_options sco ON sc.id = sco.sponsor_company_id
WHERE
  cda.id IS NOT NULL
GROUP BY
  c.id,
  c.name,
  c.logo_name,
  cd.slug,
  cd.pr_text,
  cd.website_url,
  sc.sponsor_type,
  sc.display_order,
  bsc.basic_plan_type,
  sc.id
HAVING
  EXISTS (
    SELECT
      1
    FROM
      sessions s
    WHERE
      s.sponsor_id = sc.id
  )
ORDER BY
  sc.display_order;
