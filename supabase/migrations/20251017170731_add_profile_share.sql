drop view if exists "public"."v_device_tokens";

create table "public"."profile_share" (
    "id" uuid not null default uuid_generate_v7(),
    "from_id" uuid not null,
    "to_id" uuid not null,
    "created_at" timestamp without time zone not null default CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone not null default CURRENT_TIMESTAMP
);


alter table "public"."profile_share" enable row level security;

CREATE INDEX profile_share_from_id_index ON public.profile_share USING btree (from_id);

CREATE UNIQUE INDEX profile_share_from_id_to_id_key ON public.profile_share USING btree (from_id, to_id);

CREATE UNIQUE INDEX profile_share_pkey ON public.profile_share USING btree (id);

CREATE INDEX profile_share_to_id_index ON public.profile_share USING btree (to_id);

alter table "public"."profile_share" add constraint "profile_share_pkey" PRIMARY KEY using index "profile_share_pkey";

alter table "public"."profile_share" add constraint "profile_share_check" CHECK ((from_id <> to_id)) not valid;

alter table "public"."profile_share" validate constraint "profile_share_check";

alter table "public"."profile_share" add constraint "profile_share_from_id_fkey" FOREIGN KEY (from_id) REFERENCES profiles(id) ON DELETE CASCADE not valid;

alter table "public"."profile_share" validate constraint "profile_share_from_id_fkey";

alter table "public"."profile_share" add constraint "profile_share_from_id_to_id_key" UNIQUE using index "profile_share_from_id_to_id_key";

alter table "public"."profile_share" add constraint "profile_share_to_id_fkey" FOREIGN KEY (to_id) REFERENCES profiles(id) ON DELETE CASCADE not valid;

alter table "public"."profile_share" validate constraint "profile_share_to_id_fkey";

create or replace view "public"."v_device_tokens" as  SELECT d.id AS device_id,
    d.user_id,
    d.created_at,
    json_build_object('id', d.id, 'user_id', d.user_id, 'type', (d.type)::text, 'name', d.name, 'created_at', d.created_at, 'updated_at', d.updated_at) AS device,
        CASE
            WHEN (dat.id IS NOT NULL) THEN json_build_object('id', dat.id, 'device_id', dat.device_id, 'token', dat.token, 'created_at', dat.created_at, 'updated_at', dat.updated_at)
            ELSE NULL::json
        END AS apns_token,
        CASE
            WHEN (dft.device_id IS NOT NULL) THEN json_build_object('device_id', dft.device_id, 'token', dft.token, 'created_at', dft.created_at, 'updated_at', dft.updated_at)
            ELSE NULL::json
        END AS fcm_token,
    COALESCE(json_agg(
        CASE
            WHEN (dalt.device_id IS NOT NULL) THEN json_build_object('device_id', dalt.device_id, 'token', dalt.token, 'type', (dalt.type)::text, 'topic', dalt.topic, 'created_at', dalt.created_at, 'updated_at', dalt.updated_at)
            ELSE NULL::json
        END) FILTER (WHERE (dalt.device_id IS NOT NULL)), '[]'::json) AS apns_live_activity_tokens
   FROM (((devices d
     LEFT JOIN device_apns_tokens dat ON (((d.id)::text = (dat.device_id)::text)))
     LEFT JOIN device_fcm_tokens dft ON (((d.id)::text = (dft.device_id)::text)))
     LEFT JOIN device_apns_live_activity_tokens dalt ON (((d.id)::text = (dalt.device_id)::text)))
  GROUP BY d.id, dat.id, dft.device_id;


grant delete on table "public"."profile_share" to "anon";

grant insert on table "public"."profile_share" to "anon";

grant references on table "public"."profile_share" to "anon";

grant select on table "public"."profile_share" to "anon";

grant trigger on table "public"."profile_share" to "anon";

grant truncate on table "public"."profile_share" to "anon";

grant update on table "public"."profile_share" to "anon";

grant delete on table "public"."profile_share" to "authenticated";

grant insert on table "public"."profile_share" to "authenticated";

grant references on table "public"."profile_share" to "authenticated";

grant select on table "public"."profile_share" to "authenticated";

grant trigger on table "public"."profile_share" to "authenticated";

grant truncate on table "public"."profile_share" to "authenticated";

grant update on table "public"."profile_share" to "authenticated";

grant delete on table "public"."profile_share" to "service_role";

grant insert on table "public"."profile_share" to "service_role";

grant references on table "public"."profile_share" to "service_role";

grant select on table "public"."profile_share" to "service_role";

grant trigger on table "public"."profile_share" to "service_role";

grant truncate on table "public"."profile_share" to "service_role";

grant update on table "public"."profile_share" to "service_role";


