-- Create session_venues table
create table "public"."session_venues" (
    "id" uuid not null default uuid_generate_v4(),
    "name" text not null
);

alter table "public"."session_venues" enable row level security;

CREATE UNIQUE INDEX session_venues_pkey ON public.session_venues USING btree (id);

alter table "public"."session_venues" add constraint "session_venues_pkey" PRIMARY KEY using index "session_venues_pkey";

-- Create speakers table
create table "public"."speakers" (
    "id" uuid not null default uuid_generate_v4(),
    "name" text not null,
    "avatar_name" text,
    "x_id" text
);

alter table "public"."speakers" enable row level security;

CREATE UNIQUE INDEX speakers_pkey ON public.speakers USING btree (id);

alter table "public"."speakers" add constraint "speakers_pkey" PRIMARY KEY using index "speakers_pkey";

-- Create sessions table
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

CREATE UNIQUE INDEX sessions_pkey ON public.sessions USING btree (id);

alter table "public"."sessions" add constraint "sessions_pkey" PRIMARY KEY using index "sessions_pkey";

alter table "public"."sessions" add constraint "sessions_venue_id_fkey" FOREIGN KEY (venue_id) REFERENCES session_venues(id);

alter table "public"."sessions" add constraint "sessions_sponsor_id_fkey" FOREIGN KEY (sponsor_id) REFERENCES sponsor_companies(id);

-- Create session_speakers table (N:N relationship)
create table "public"."session_speakers" (
    "session_id" uuid not null,
    "speaker_id" uuid not null
);

alter table "public"."session_speakers" enable row level security;

CREATE UNIQUE INDEX session_speakers_pkey ON public.session_speakers USING btree (session_id, speaker_id);

alter table "public"."session_speakers" add constraint "session_speakers_pkey" PRIMARY KEY using index "session_speakers_pkey";

alter table "public"."session_speakers" add constraint "session_speakers_session_id_fkey" FOREIGN KEY (session_id) REFERENCES sessions(id) ON DELETE cascade;

alter table "public"."session_speakers" add constraint "session_speakers_speaker_id_fkey" FOREIGN KEY (speaker_id) REFERENCES speakers(id) ON DELETE cascade;

-- Create Storage bucket for speaker avatars
insert into storage.buckets (id, name, public)
values ('speakers', 'speakers', true);

-- Create view: session_venues_with_sessions
create or replace view session_venues_with_sessions as
select
    sv.id,
    sv.name,
    coalesce(
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
                'speakers', coalesce(
                    (select json_agg(
                        json_build_object(
                            'id', sp.id,
                            'name', sp.name,
                            'avatar_name', sp.avatar_name,
                            'x_id', sp.x_id
                        )
                    )
                    from session_speakers ss
                    join speakers sp on ss.speaker_id = sp.id
                    where ss.session_id = s.id),
                    '[]'::json
                ),
                'sponsor', case
                    when s.sponsor_id is not null then
                        (select json_build_object(
                            'id', c.id,
                            'name', c.name,
                            'logo_url', c.logo_name,
                            'slug', cd.slug,
                            'pr_text', cd.pr_text,
                            'website_url', cd.website_url,
                            'sponsor_type', sc.sponsor_type,
                            'display_order', sc.display_order,
                            'basic_plan_type', bsc.basic_plan_type,
                            'option_plan_types', coalesce(
                                array_agg(sco.option_plan_type::text) filter (where sco.option_plan_type is not null),
                                array[]::text[]
                            )
                        )
                        from companies c
                        inner join sponsor_companies sc on c.id = sc.company_id
                        left join basic_sponsor_companies bsc on sc.id = bsc.sponsor_company_id
                        left join company_drafts cd on c.id = cd.company_id
                        left join company_draft_approvals cda on cd.id = cda.company_draft_id
                        left join sponsor_company_options sco on sc.id = sco.sponsor_company_id
                        where sc.id = s.sponsor_id
                        group by c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url,
                                 sc.sponsor_type, sc.display_order, bsc.basic_plan_type
                        )
                    else null
                end
            ) order by s.starts_at
        ) filter (where s.id is not null),
        '[]'::json
    ) as sessions
from session_venues sv
left join sessions s on sv.id = s.venue_id
group by sv.id, sv.name
order by sv.name;

-- Create view: sponsor_with_sessions
create or replace view sponsor_with_sessions as
select
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
        'option_plan_types', coalesce(
            array_agg(distinct sco.option_plan_type::text) filter (where sco.option_plan_type is not null),
            array[]::text[]
        )
    ) as sponsor,
    coalesce(
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
                'speakers', coalesce(
                    (select json_agg(
                        json_build_object(
                            'id', sp.id,
                            'name', sp.name,
                            'avatar_name', sp.avatar_name,
                            'x_id', sp.x_id
                        )
                    )
                    from session_speakers ss
                    join speakers sp on ss.speaker_id = sp.id
                    where ss.session_id = s.id),
                    '[]'::json
                )
            ) order by s.starts_at
        ) filter (where s.id is not null),
        '[]'::json
    ) as sessions
from sponsor_companies sc
inner join companies c on sc.company_id = c.id
left join basic_sponsor_companies bsc on sc.id = bsc.sponsor_company_id
left join company_drafts cd on c.id = cd.company_id
left join company_draft_approvals cda on cd.id = cda.company_draft_id
left join sponsor_company_options sco on sc.id = sco.sponsor_company_id
left join sessions s on sc.id = s.sponsor_id
left join session_venues sv on s.venue_id = sv.id
where cda.id is not null and s.id is not null
group by c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url,
         sc.sponsor_type, sc.display_order, bsc.basic_plan_type
order by sc.display_order;

-- Grant permissions for session_venues table
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

-- Grant permissions for speakers table
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

-- Grant permissions for sessions table
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

-- Grant permissions for session_speakers table
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

-- Grant permissions for views
grant select on table "public"."session_venues_with_sessions" to "anon";
grant select on table "public"."session_venues_with_sessions" to "authenticated";
grant select on table "public"."session_venues_with_sessions" to "service_role";

grant select on table "public"."sponsor_with_sessions" to "anon";
grant select on table "public"."sponsor_with_sessions" to "authenticated";
grant select on table "public"."sponsor_with_sessions" to "service_role";

-- Create RLS policies (read-only for all users, write for admins only)

-- Session venues policies
create policy "session_venues_read_all" on "public"."session_venues"
as permissive for select
to public
using (true);

create policy "session_venues_admin_write" on "public"."session_venues"
as permissive for all
to authenticated
using (
  exists (
    select 1 from user_roles
    where user_id = auth.uid() and role = 'admin'
  )
);

-- Speakers policies
create policy "speakers_read_all" on "public"."speakers"
as permissive for select
to public
using (true);

create policy "speakers_admin_write" on "public"."speakers"
as permissive for all
to authenticated
using (
  exists (
    select 1 from user_roles
    where user_id = auth.uid() and role = 'admin'
  )
);

-- Sessions policies
create policy "sessions_read_all" on "public"."sessions"
as permissive for select
to public
using (true);

create policy "sessions_admin_write" on "public"."sessions"
as permissive for all
to authenticated
using (
  exists (
    select 1 from user_roles
    where user_id = auth.uid() and role = 'admin'
  )
);

-- Session speakers policies
create policy "session_speakers_read_all" on "public"."session_speakers"
as permissive for select
to public
using (true);

create policy "session_speakers_admin_write" on "public"."session_speakers"
as permissive for all
to authenticated
using (
  exists (
    select 1 from user_roles
    where user_id = auth.uid() and role = 'admin'
  )
);