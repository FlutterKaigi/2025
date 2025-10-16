-- Create timeline_events table
create table "public"."timeline_events" (
    "id" uuid not null default uuid_generate_v4(),
    "title" text not null,
    "starts_at" timestamp with time zone not null,
    "ends_at" timestamp with time zone,
    "venue_id" uuid,
    "created_at" timestamp with time zone not null default now()
);

alter table "public"."timeline_events" enable row level security;

CREATE UNIQUE INDEX timeline_events_pkey ON public.timeline_events USING btree (id);

alter table "public"."timeline_events" add constraint "timeline_events_pkey" PRIMARY KEY using index "timeline_events_pkey";

alter table "public"."timeline_events" add constraint "timeline_events_venue_id_fkey" FOREIGN KEY (venue_id) REFERENCES session_venues(id);

-- Grant permissions for timeline_events table
grant delete on table "public"."timeline_events" to "anon";
grant insert on table "public"."timeline_events" to "anon";
grant references on table "public"."timeline_events" to "anon";
grant select on table "public"."timeline_events" to "anon";
grant trigger on table "public"."timeline_events" to "anon";
grant truncate on table "public"."timeline_events" to "anon";
grant update on table "public"."timeline_events" to "anon";

grant delete on table "public"."timeline_events" to "authenticated";
grant insert on table "public"."timeline_events" to "authenticated";
grant references on table "public"."timeline_events" to "authenticated";
grant select on table "public"."timeline_events" to "authenticated";
grant trigger on table "public"."timeline_events" to "authenticated";
grant truncate on table "public"."timeline_events" to "authenticated";
grant update on table "public"."timeline_events" to "authenticated";

grant delete on table "public"."timeline_events" to "service_role";
grant insert on table "public"."timeline_events" to "service_role";
grant references on table "public"."timeline_events" to "service_role";
grant select on table "public"."timeline_events" to "service_role";
grant trigger on table "public"."timeline_events" to "service_role";
grant truncate on table "public"."timeline_events" to "service_role";
grant update on table "public"."timeline_events" to "service_role";

-- Create RLS policies (read-only for all users, write for admins only)
create policy "timeline_events_read_all" on "public"."timeline_events"
as permissive for select
to public
using (true);

create policy "timeline_events_admin_write" on "public"."timeline_events"
as permissive for all
to authenticated
using (
  exists (
    select 1 from user_roles
    where user_id = auth.uid() and role = 'admin'
  )
);
