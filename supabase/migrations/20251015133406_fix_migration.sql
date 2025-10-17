CREATE TABLE "public"."session_speakers" ("session_id" uuid NOT NULL, "speaker_id" uuid NOT NULL);

ALTER TABLE "public"."session_speakers" enable ROW level security;

CREATE TABLE "public"."session_venues" ("id" uuid NOT NULL DEFAULT uuid_generate_v4 (), "name" text NOT NULL);

ALTER TABLE "public"."session_venues" enable ROW level security;

CREATE TABLE "public"."sessions" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4 (),
  "title" text NOT NULL,
  "description" text NOT NULL,
  "starts_at" TIMESTAMP WITH TIME ZONE NOT NULL,
  "ends_at" TIMESTAMP WITH TIME ZONE NOT NULL,
  "venue_id" uuid NOT NULL,
  "sponsor_id" smallint,
  "is_lightning_talk" boolean NOT NULL DEFAULT FALSE,
  "is_beginners_lightning_talk" boolean NOT NULL DEFAULT FALSE,
  "is_hands_on" boolean NOT NULL DEFAULT FALSE,
  "video_url" text,
  "created_at" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

ALTER TABLE "public"."sessions" enable ROW level security;

CREATE TABLE "public"."speakers" ("id" uuid NOT NULL DEFAULT uuid_generate_v4 (), "name" text NOT NULL, "avatar_url" text, "x_id" text);

ALTER TABLE "public"."speakers" enable ROW level security;

CREATE UNIQUE INDEX session_speakers_pkey ON public.session_speakers USING btree (session_id, speaker_id);

CREATE UNIQUE INDEX session_venues_pkey ON public.session_venues USING btree (id);

CREATE UNIQUE INDEX sessions_pkey ON public.sessions USING btree (id);

CREATE UNIQUE INDEX speakers_pkey ON public.speakers USING btree (id);

ALTER TABLE "public"."session_speakers"
ADD CONSTRAINT "session_speakers_pkey" PRIMARY KEY USING index "session_speakers_pkey";

ALTER TABLE "public"."session_venues"
ADD CONSTRAINT "session_venues_pkey" PRIMARY KEY USING index "session_venues_pkey";

ALTER TABLE "public"."sessions"
ADD CONSTRAINT "sessions_pkey" PRIMARY KEY USING index "sessions_pkey";

ALTER TABLE "public"."speakers"
ADD CONSTRAINT "speakers_pkey" PRIMARY KEY USING index "speakers_pkey";

ALTER TABLE "public"."session_speakers"
ADD CONSTRAINT "session_speakers_session_id_fkey" FOREIGN key (session_id) REFERENCES sessions (id) ON DELETE CASCADE NOT valid;

ALTER TABLE "public"."session_speakers" validate CONSTRAINT "session_speakers_session_id_fkey";

ALTER TABLE "public"."session_speakers"
ADD CONSTRAINT "session_speakers_speaker_id_fkey" FOREIGN key (speaker_id) REFERENCES speakers (id) ON DELETE CASCADE NOT valid;

ALTER TABLE "public"."session_speakers" validate CONSTRAINT "session_speakers_speaker_id_fkey";

ALTER TABLE "public"."sessions"
ADD CONSTRAINT "sessions_sponsor_id_fkey" FOREIGN key (sponsor_id) REFERENCES sponsor_companies (id) NOT valid;

ALTER TABLE "public"."sessions" validate CONSTRAINT "sessions_sponsor_id_fkey";

ALTER TABLE "public"."sessions"
ADD CONSTRAINT "sessions_venue_id_fkey" FOREIGN key (venue_id) REFERENCES session_venues (id) NOT valid;

ALTER TABLE "public"."sessions" validate CONSTRAINT "sessions_venue_id_fkey";

SET
  check_function_bodies = off;

CREATE OR REPLACE VIEW "public"."session_venues_with_sessions" AS
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
            'speakers',
            coalesce(
              (
                SELECT
                  json_agg(json_build_object('id', sp.id, 'name', sp.name, 'avatar_url', sp.avatar_url, 'x_id', sp.x_id)) AS json_agg
                FROM
                  (
                    session_speakers ss
                    JOIN speakers sp ON ((ss.speaker_id = sp.id))
                  )
                WHERE
                  (ss.session_id = s.id)
              ),
              '[]'::json
            ),
            'sponsor',
            CASE
              WHEN (s.sponsor_id IS NOT NULL) THEN (
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
                      array_agg((sco.option_plan_type)::text) FILTER (
                        WHERE
                          (sco.option_plan_type IS NOT NULL)
                      ),
                      ARRAY[]::TEXT[]
                    )
                  ) AS json_build_object
                FROM
                  (
                    (
                      (
                        (
                          (
                            companies c
                            JOIN sponsor_companies sc ON ((c.id = sc.company_id))
                          )
                          LEFT JOIN basic_sponsor_companies bsc ON ((sc.id = bsc.sponsor_company_id))
                        )
                        LEFT JOIN company_drafts cd ON ((c.id = cd.company_id))
                      )
                      LEFT JOIN company_draft_approvals cda ON ((cd.id = cda.company_draft_id))
                    )
                    LEFT JOIN sponsor_company_options sco ON ((sc.id = sco.sponsor_company_id))
                  )
                WHERE
                  (sc.id = s.sponsor_id)
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
              ELSE NULL::json
            END
          )
          ORDER BY
            s.starts_at
        ) AS json_agg
      FROM
        sessions s
      WHERE
        (s.venue_id = sv.id)
    ),
    '[]'::json
  ) AS sessions
FROM
  session_venues sv
ORDER BY
  sv.name;

CREATE OR REPLACE VIEW "public"."sponsor_with_sessions" AS
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
      array_agg(DISTINCT (sco.option_plan_type)::text) FILTER (
        WHERE
          (sco.option_plan_type IS NOT NULL)
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
            'venue',
            json_build_object('id', sv.id, 'name', sv.name),
            'speakers',
            coalesce(
              (
                SELECT
                  json_agg(json_build_object('id', sp.id, 'name', sp.name, 'avatar_url', sp.avatar_url, 'x_id', sp.x_id)) AS json_agg
                FROM
                  (
                    session_speakers ss
                    JOIN speakers sp ON ((ss.speaker_id = sp.id))
                  )
                WHERE
                  (ss.session_id = s.id)
              ),
              '[]'::json
            )
          )
          ORDER BY
            s.starts_at
        ) AS json_agg
      FROM
        (
          sessions s
          JOIN session_venues sv ON ((s.venue_id = sv.id))
        )
      WHERE
        (s.sponsor_id = sc.id)
    ),
    '[]'::json
  ) AS sessions
FROM
  (
    (
      (
        (
          (
            sponsor_companies sc
            JOIN companies c ON ((sc.company_id = c.id))
          )
          LEFT JOIN basic_sponsor_companies bsc ON ((sc.id = bsc.sponsor_company_id))
        )
        LEFT JOIN company_drafts cd ON ((c.id = cd.company_id))
      )
      LEFT JOIN company_draft_approvals cda ON ((cd.id = cda.company_draft_id))
    )
    LEFT JOIN sponsor_company_options sco ON ((sc.id = sco.sponsor_company_id))
  )
WHERE
  (cda.id IS NOT NULL)
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
  (
    EXISTS (
      SELECT
        1
      FROM
        sessions s
      WHERE
        (s.sponsor_id = sc.id)
    )
  )
ORDER BY
  sc.display_order;

CREATE OR REPLACE FUNCTION public.upsert_user_roles (p_user_id uuid, roles role[]) returns users language plpgsql AS $function$
DECLARE
  result public.users;
BEGIN
  DELETE FROM public.user_roles AS ur WHERE ur.user_id = p_user_id;
  INSERT INTO public.user_roles (user_id, role) VALUES
    (p_user_id, unnest(roles));

  SELECT
    u.*,
    json_agg(ur.role) AS roles
  FROM
    public.users AS u
    LEFT JOIN public.user_roles AS ur ON u.id = ur.user_id
  WHERE
    u.id = $1
  GROUP BY u.id
  INTO result;
  RETURN result;
END;
$function$;

GRANT delete ON TABLE "public"."session_speakers" TO "anon";

GRANT insert ON TABLE "public"."session_speakers" TO "anon";

GRANT REFERENCES ON TABLE "public"."session_speakers" TO "anon";

GRANT
SELECT
  ON TABLE "public"."session_speakers" TO "anon";

GRANT trigger ON TABLE "public"."session_speakers" TO "anon";

GRANT
TRUNCATE ON TABLE "public"."session_speakers" TO "anon";

GRANT
UPDATE ON TABLE "public"."session_speakers" TO "anon";

GRANT delete ON TABLE "public"."session_speakers" TO "authenticated";

GRANT insert ON TABLE "public"."session_speakers" TO "authenticated";

GRANT REFERENCES ON TABLE "public"."session_speakers" TO "authenticated";

GRANT
SELECT
  ON TABLE "public"."session_speakers" TO "authenticated";

GRANT trigger ON TABLE "public"."session_speakers" TO "authenticated";

GRANT
TRUNCATE ON TABLE "public"."session_speakers" TO "authenticated";

GRANT
UPDATE ON TABLE "public"."session_speakers" TO "authenticated";

GRANT delete ON TABLE "public"."session_speakers" TO "service_role";

GRANT insert ON TABLE "public"."session_speakers" TO "service_role";

GRANT REFERENCES ON TABLE "public"."session_speakers" TO "service_role";

GRANT
SELECT
  ON TABLE "public"."session_speakers" TO "service_role";

GRANT trigger ON TABLE "public"."session_speakers" TO "service_role";

GRANT
TRUNCATE ON TABLE "public"."session_speakers" TO "service_role";

GRANT
UPDATE ON TABLE "public"."session_speakers" TO "service_role";

GRANT delete ON TABLE "public"."session_venues" TO "anon";

GRANT insert ON TABLE "public"."session_venues" TO "anon";

GRANT REFERENCES ON TABLE "public"."session_venues" TO "anon";

GRANT
SELECT
  ON TABLE "public"."session_venues" TO "anon";

GRANT trigger ON TABLE "public"."session_venues" TO "anon";

GRANT
TRUNCATE ON TABLE "public"."session_venues" TO "anon";

GRANT
UPDATE ON TABLE "public"."session_venues" TO "anon";

GRANT delete ON TABLE "public"."session_venues" TO "authenticated";

GRANT insert ON TABLE "public"."session_venues" TO "authenticated";

GRANT REFERENCES ON TABLE "public"."session_venues" TO "authenticated";

GRANT
SELECT
  ON TABLE "public"."session_venues" TO "authenticated";

GRANT trigger ON TABLE "public"."session_venues" TO "authenticated";

GRANT
TRUNCATE ON TABLE "public"."session_venues" TO "authenticated";

GRANT
UPDATE ON TABLE "public"."session_venues" TO "authenticated";

GRANT delete ON TABLE "public"."session_venues" TO "service_role";

GRANT insert ON TABLE "public"."session_venues" TO "service_role";

GRANT REFERENCES ON TABLE "public"."session_venues" TO "service_role";

GRANT
SELECT
  ON TABLE "public"."session_venues" TO "service_role";

GRANT trigger ON TABLE "public"."session_venues" TO "service_role";

GRANT
TRUNCATE ON TABLE "public"."session_venues" TO "service_role";

GRANT
UPDATE ON TABLE "public"."session_venues" TO "service_role";

GRANT delete ON TABLE "public"."sessions" TO "anon";

GRANT insert ON TABLE "public"."sessions" TO "anon";

GRANT REFERENCES ON TABLE "public"."sessions" TO "anon";

GRANT
SELECT
  ON TABLE "public"."sessions" TO "anon";

GRANT trigger ON TABLE "public"."sessions" TO "anon";

GRANT
TRUNCATE ON TABLE "public"."sessions" TO "anon";

GRANT
UPDATE ON TABLE "public"."sessions" TO "anon";

GRANT delete ON TABLE "public"."sessions" TO "authenticated";

GRANT insert ON TABLE "public"."sessions" TO "authenticated";

GRANT REFERENCES ON TABLE "public"."sessions" TO "authenticated";

GRANT
SELECT
  ON TABLE "public"."sessions" TO "authenticated";

GRANT trigger ON TABLE "public"."sessions" TO "authenticated";

GRANT
TRUNCATE ON TABLE "public"."sessions" TO "authenticated";

GRANT
UPDATE ON TABLE "public"."sessions" TO "authenticated";

GRANT delete ON TABLE "public"."sessions" TO "service_role";

GRANT insert ON TABLE "public"."sessions" TO "service_role";

GRANT REFERENCES ON TABLE "public"."sessions" TO "service_role";

GRANT
SELECT
  ON TABLE "public"."sessions" TO "service_role";

GRANT trigger ON TABLE "public"."sessions" TO "service_role";

GRANT
TRUNCATE ON TABLE "public"."sessions" TO "service_role";

GRANT
UPDATE ON TABLE "public"."sessions" TO "service_role";

GRANT delete ON TABLE "public"."speakers" TO "anon";

GRANT insert ON TABLE "public"."speakers" TO "anon";

GRANT REFERENCES ON TABLE "public"."speakers" TO "anon";

GRANT
SELECT
  ON TABLE "public"."speakers" TO "anon";

GRANT trigger ON TABLE "public"."speakers" TO "anon";

GRANT
TRUNCATE ON TABLE "public"."speakers" TO "anon";

GRANT
UPDATE ON TABLE "public"."speakers" TO "anon";

GRANT delete ON TABLE "public"."speakers" TO "authenticated";

GRANT insert ON TABLE "public"."speakers" TO "authenticated";

GRANT REFERENCES ON TABLE "public"."speakers" TO "authenticated";

GRANT
SELECT
  ON TABLE "public"."speakers" TO "authenticated";

GRANT trigger ON TABLE "public"."speakers" TO "authenticated";

GRANT
TRUNCATE ON TABLE "public"."speakers" TO "authenticated";

GRANT
UPDATE ON TABLE "public"."speakers" TO "authenticated";

GRANT delete ON TABLE "public"."speakers" TO "service_role";

GRANT insert ON TABLE "public"."speakers" TO "service_role";

GRANT REFERENCES ON TABLE "public"."speakers" TO "service_role";

GRANT
SELECT
  ON TABLE "public"."speakers" TO "service_role";

GRANT trigger ON TABLE "public"."speakers" TO "service_role";

GRANT
TRUNCATE ON TABLE "public"."speakers" TO "service_role";

GRANT
UPDATE ON TABLE "public"."speakers" TO "service_role";
