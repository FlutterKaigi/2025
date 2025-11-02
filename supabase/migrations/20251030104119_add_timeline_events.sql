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

alter table "public"."timeline_events" add constraint "timeline_events_venue_id_fkey" FOREIGN KEY (venue_id) REFERENCES session_venues(id) not valid;

alter table "public"."timeline_events" validate constraint "timeline_events_venue_id_fkey";

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


