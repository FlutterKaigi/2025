create table "public"."session_speakers" (
    "session_id" uuid not null,
    "speaker_id" uuid not null
);


alter table "public"."session_speakers" enable row level security;

create table "public"."session_venues" (
    "id" uuid not null default uuid_generate_v4(),
    "name" text not null
);


alter table "public"."session_venues" enable row level security;

create table "public"."sessions" (
    "id" uuid not null default uuid_generate_v4(),
    "title" text not null,
    "description" text not null,
    "starts_at" timestamp with time zone not null,
    "ends_at" timestamp with time zone not null,
    "venue_id" uuid not null,
    "sponsor_id" smallint,
    "is_lightning_talk" boolean not null default false,
    "is_beginners_lightning_talk" boolean not null default false,
    "is_hands_on" boolean not null default false,
    "video_url" text,
    "created_at" timestamp with time zone not null default now()
);


alter table "public"."sessions" enable row level security;

create table "public"."speakers" (
    "id" uuid not null default uuid_generate_v4(),
    "name" text not null,
    "avatar_url" text,
    "x_id" text
);


alter table "public"."speakers" enable row level security;

CREATE UNIQUE INDEX session_speakers_pkey ON public.session_speakers USING btree (session_id, speaker_id);

CREATE UNIQUE INDEX session_venues_pkey ON public.session_venues USING btree (id);

CREATE UNIQUE INDEX sessions_pkey ON public.sessions USING btree (id);

CREATE UNIQUE INDEX speakers_pkey ON public.speakers USING btree (id);

alter table "public"."session_speakers" add constraint "session_speakers_pkey" PRIMARY KEY using index "session_speakers_pkey";

alter table "public"."session_venues" add constraint "session_venues_pkey" PRIMARY KEY using index "session_venues_pkey";

alter table "public"."sessions" add constraint "sessions_pkey" PRIMARY KEY using index "sessions_pkey";

alter table "public"."speakers" add constraint "speakers_pkey" PRIMARY KEY using index "speakers_pkey";

alter table "public"."session_speakers" add constraint "session_speakers_session_id_fkey" FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE CASCADE not valid;

alter table "public"."session_speakers" validate constraint "session_speakers_session_id_fkey";

alter table "public"."session_speakers" add constraint "session_speakers_speaker_id_fkey" FOREIGN KEY (speaker_id) REFERENCES speakers(id) ON DELETE CASCADE not valid;

alter table "public"."session_speakers" validate constraint "session_speakers_speaker_id_fkey";

alter table "public"."sessions" add constraint "sessions_sponsor_id_fkey" FOREIGN KEY (sponsor_id) REFERENCES sponsor_companies(id) not valid;

alter table "public"."sessions" validate constraint "sessions_sponsor_id_fkey";

alter table "public"."sessions" add constraint "sessions_venue_id_fkey" FOREIGN KEY (venue_id) REFERENCES session_venues(id) not valid;

alter table "public"."sessions" validate constraint "sessions_venue_id_fkey";

set check_function_bodies = off;

create or replace view "public"."session_venues_with_sessions" as  SELECT sv.id,
    sv.name,
    COALESCE(( SELECT json_agg(json_build_object('id', s.id, 'title', s.title, 'description', s.description, 'starts_at', s.starts_at, 'ends_at', s.ends_at, 'is_lightning_talk', s.is_lightning_talk, 'is_beginners_lightning_talk', s.is_beginners_lightning_talk, 'is_hands_on', s.is_hands_on, 'video_url', s.video_url, 'speakers', COALESCE(( SELECT json_agg(json_build_object('id', sp.id, 'name', sp.name, 'avatar_url', sp.avatar_url, 'x_id', sp.x_id)) AS json_agg
                   FROM (session_speakers ss
                     JOIN speakers sp ON ((ss.speaker_id = sp.id)))
                  WHERE (ss.session_id = s.id)), '[]'::json), 'sponsor',
                CASE
                    WHEN (s.sponsor_id IS NOT NULL) THEN ( SELECT json_build_object('id', c.id, 'name', c.name, 'logo_url', c.logo_name, 'slug', cd.slug, 'pr_text', cd.pr_text, 'website_url', cd.website_url, 'sponsor_type', sc.sponsor_type, 'display_order', sc.display_order, 'basic_plan_type', bsc.basic_plan_type, 'option_plan_types', COALESCE(array_agg((sco.option_plan_type)::text) FILTER (WHERE (sco.option_plan_type IS NOT NULL)), ARRAY[]::text[])) AS json_build_object
                       FROM (((((companies c
                         JOIN sponsor_companies sc ON ((c.id = sc.company_id)))
                         LEFT JOIN basic_sponsor_companies bsc ON ((sc.id = bsc.sponsor_company_id)))
                         LEFT JOIN company_drafts cd ON ((c.id = cd.company_id)))
                         LEFT JOIN company_draft_approvals cda ON ((cd.id = cda.company_draft_id)))
                         LEFT JOIN sponsor_company_options sco ON ((sc.id = sco.sponsor_company_id)))
                      WHERE (sc.id = s.sponsor_id)
                      GROUP BY c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url, sc.sponsor_type, sc.display_order, bsc.basic_plan_type)
                    ELSE NULL::json
                END) ORDER BY s.starts_at) AS json_agg
           FROM sessions s
          WHERE (s.venue_id = sv.id)), '[]'::json) AS sessions
   FROM session_venues sv
  ORDER BY sv.name;


create or replace view "public"."sponsor_with_sessions" as  SELECT json_build_object('id', c.id, 'name', c.name, 'logo_url', c.logo_name, 'slug', cd.slug, 'pr_text', cd.pr_text, 'website_url', cd.website_url, 'sponsor_type', sc.sponsor_type, 'display_order', sc.display_order, 'basic_plan_type', bsc.basic_plan_type, 'option_plan_types', COALESCE(array_agg(DISTINCT (sco.option_plan_type)::text) FILTER (WHERE (sco.option_plan_type IS NOT NULL)), ARRAY[]::text[])) AS sponsor,
    COALESCE(( SELECT json_agg(json_build_object('id', s.id, 'title', s.title, 'description', s.description, 'starts_at', s.starts_at, 'ends_at', s.ends_at, 'is_lightning_talk', s.is_lightning_talk, 'is_beginners_lightning_talk', s.is_beginners_lightning_talk, 'is_hands_on', s.is_hands_on, 'video_url', s.video_url, 'venue', json_build_object('id', sv.id, 'name', sv.name), 'speakers', COALESCE(( SELECT json_agg(json_build_object('id', sp.id, 'name', sp.name, 'avatar_url', sp.avatar_url, 'x_id', sp.x_id)) AS json_agg
                   FROM (session_speakers ss
                     JOIN speakers sp ON ((ss.speaker_id = sp.id)))
                  WHERE (ss.session_id = s.id)), '[]'::json)) ORDER BY s.starts_at) AS json_agg
           FROM (sessions s
             JOIN session_venues sv ON ((s.venue_id = sv.id)))
          WHERE (s.sponsor_id = sc.id)), '[]'::json) AS sessions
   FROM (((((sponsor_companies sc
     JOIN companies c ON ((sc.company_id = c.id)))
     LEFT JOIN basic_sponsor_companies bsc ON ((sc.id = bsc.sponsor_company_id)))
     LEFT JOIN company_drafts cd ON ((c.id = cd.company_id)))
     LEFT JOIN company_draft_approvals cda ON ((cd.id = cda.company_draft_id)))
     LEFT JOIN sponsor_company_options sco ON ((sc.id = sco.sponsor_company_id)))
  WHERE (cda.id IS NOT NULL)
  GROUP BY c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url, sc.sponsor_type, sc.display_order, bsc.basic_plan_type, sc.id
 HAVING (EXISTS ( SELECT 1
           FROM sessions s
          WHERE (s.sponsor_id = sc.id)))
  ORDER BY sc.display_order;


CREATE OR REPLACE FUNCTION public.upsert_user_roles(p_user_id uuid, roles role[])
 RETURNS users
 LANGUAGE plpgsql
AS $function$
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
$function$
;

grant delete on table "public"."session_speakers" to "anon";

grant insert on table "public"."session_speakers" to "anon";

grant references on table "public"."session_speakers" to "anon";

grant select on table "public"."session_speakers" to "anon";

grant trigger on table "public"."session_speakers" to "anon";

grant truncate on table "public"."session_speakers" to "anon";

grant update on table "public"."session_speakers" to "anon";

grant delete on table "public"."session_speakers" to "authenticated";

grant insert on table "public"."session_speakers" to "authenticated";

grant references on table "public"."session_speakers" to "authenticated";

grant select on table "public"."session_speakers" to "authenticated";

grant trigger on table "public"."session_speakers" to "authenticated";

grant truncate on table "public"."session_speakers" to "authenticated";

grant update on table "public"."session_speakers" to "authenticated";

grant delete on table "public"."session_speakers" to "service_role";

grant insert on table "public"."session_speakers" to "service_role";

grant references on table "public"."session_speakers" to "service_role";

grant select on table "public"."session_speakers" to "service_role";

grant trigger on table "public"."session_speakers" to "service_role";

grant truncate on table "public"."session_speakers" to "service_role";

grant update on table "public"."session_speakers" to "service_role";

grant delete on table "public"."session_venues" to "anon";

grant insert on table "public"."session_venues" to "anon";

grant references on table "public"."session_venues" to "anon";

grant select on table "public"."session_venues" to "anon";

grant trigger on table "public"."session_venues" to "anon";

grant truncate on table "public"."session_venues" to "anon";

grant update on table "public"."session_venues" to "anon";

grant delete on table "public"."session_venues" to "authenticated";

grant insert on table "public"."session_venues" to "authenticated";

grant references on table "public"."session_venues" to "authenticated";

grant select on table "public"."session_venues" to "authenticated";

grant trigger on table "public"."session_venues" to "authenticated";

grant truncate on table "public"."session_venues" to "authenticated";

grant update on table "public"."session_venues" to "authenticated";

grant delete on table "public"."session_venues" to "service_role";

grant insert on table "public"."session_venues" to "service_role";

grant references on table "public"."session_venues" to "service_role";

grant select on table "public"."session_venues" to "service_role";

grant trigger on table "public"."session_venues" to "service_role";

grant truncate on table "public"."session_venues" to "service_role";

grant update on table "public"."session_venues" to "service_role";

grant delete on table "public"."sessions" to "anon";

grant insert on table "public"."sessions" to "anon";

grant references on table "public"."sessions" to "anon";

grant select on table "public"."sessions" to "anon";

grant trigger on table "public"."sessions" to "anon";

grant truncate on table "public"."sessions" to "anon";

grant update on table "public"."sessions" to "anon";

grant delete on table "public"."sessions" to "authenticated";

grant insert on table "public"."sessions" to "authenticated";

grant references on table "public"."sessions" to "authenticated";

grant select on table "public"."sessions" to "authenticated";

grant trigger on table "public"."sessions" to "authenticated";

grant truncate on table "public"."sessions" to "authenticated";

grant update on table "public"."sessions" to "authenticated";

grant delete on table "public"."sessions" to "service_role";

grant insert on table "public"."sessions" to "service_role";

grant references on table "public"."sessions" to "service_role";

grant select on table "public"."sessions" to "service_role";

grant trigger on table "public"."sessions" to "service_role";

grant truncate on table "public"."sessions" to "service_role";

grant update on table "public"."sessions" to "service_role";

grant delete on table "public"."speakers" to "anon";

grant insert on table "public"."speakers" to "anon";

grant references on table "public"."speakers" to "anon";

grant select on table "public"."speakers" to "anon";

grant trigger on table "public"."speakers" to "anon";

grant truncate on table "public"."speakers" to "anon";

grant update on table "public"."speakers" to "anon";

grant delete on table "public"."speakers" to "authenticated";

grant insert on table "public"."speakers" to "authenticated";

grant references on table "public"."speakers" to "authenticated";

grant select on table "public"."speakers" to "authenticated";

grant trigger on table "public"."speakers" to "authenticated";

grant truncate on table "public"."speakers" to "authenticated";

grant update on table "public"."speakers" to "authenticated";

grant delete on table "public"."speakers" to "service_role";

grant insert on table "public"."speakers" to "service_role";

grant references on table "public"."speakers" to "service_role";

grant select on table "public"."speakers" to "service_role";

grant trigger on table "public"."speakers" to "service_role";

grant truncate on table "public"."speakers" to "service_role";

grant update on table "public"."speakers" to "service_role";


