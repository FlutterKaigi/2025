create type "public"."apns_live_activity_token_type" as enum ('start', 'update');

create type "public"."device_type" as enum ('ios', 'android', 'web');

create table "public"."device_apns_live_activity_tokens" (
    "device_id" character varying(64) not null,
    "token" text not null,
    "type" apns_live_activity_token_type not null,
    "topic" text not null,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."device_apns_live_activity_tokens" enable row level security;

create table "public"."device_apns_tokens" (
    "id" uuid not null default uuid_generate_v7(),
    "device_id" character varying(64) not null,
    "token" text not null,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."device_apns_tokens" enable row level security;

create table "public"."device_fcm_tokens" (
    "device_id" character varying(64) not null,
    "token" text not null,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."device_fcm_tokens" enable row level security;

create table "public"."devices" (
    "id" character varying(64) not null,
    "user_id" uuid not null,
    "type" device_type not null,
    "name" text not null,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."devices" enable row level security;

CREATE UNIQUE INDEX device_apns_live_activity_tokens_pkey ON public.device_apns_live_activity_tokens USING btree (device_id);

CREATE UNIQUE INDEX device_apns_tokens_device_id_key ON public.device_apns_tokens USING btree (device_id);

CREATE UNIQUE INDEX device_apns_tokens_pkey ON public.device_apns_tokens USING btree (id);

CREATE UNIQUE INDEX device_fcm_tokens_pkey ON public.device_fcm_tokens USING btree (device_id);

CREATE UNIQUE INDEX devices_pkey ON public.devices USING btree (id);

alter table "public"."device_apns_live_activity_tokens" add constraint "device_apns_live_activity_tokens_pkey" PRIMARY KEY using index "device_apns_live_activity_tokens_pkey";

alter table "public"."device_apns_tokens" add constraint "device_apns_tokens_pkey" PRIMARY KEY using index "device_apns_tokens_pkey";

alter table "public"."device_fcm_tokens" add constraint "device_fcm_tokens_pkey" PRIMARY KEY using index "device_fcm_tokens_pkey";

alter table "public"."devices" add constraint "devices_pkey" PRIMARY KEY using index "devices_pkey";

alter table "public"."device_apns_live_activity_tokens" add constraint "device_apns_live_activity_tokens_device_id_fkey" FOREIGN KEY (device_id) REFERENCES devices(id) ON DELETE CASCADE not valid;

alter table "public"."device_apns_live_activity_tokens" validate constraint "device_apns_live_activity_tokens_device_id_fkey";

alter table "public"."device_apns_live_activity_tokens" add constraint "device_apns_live_activity_tokens_token_check" CHECK ((char_length(token) <= 1024)) not valid;

alter table "public"."device_apns_live_activity_tokens" validate constraint "device_apns_live_activity_tokens_token_check";

alter table "public"."device_apns_live_activity_tokens" add constraint "device_apns_live_activity_tokens_topic_check" CHECK ((char_length(topic) <= 255)) not valid;

alter table "public"."device_apns_live_activity_tokens" validate constraint "device_apns_live_activity_tokens_topic_check";

alter table "public"."device_apns_tokens" add constraint "device_apns_tokens_device_id_fkey" FOREIGN KEY (device_id) REFERENCES devices(id) ON DELETE CASCADE not valid;

alter table "public"."device_apns_tokens" validate constraint "device_apns_tokens_device_id_fkey";

alter table "public"."device_apns_tokens" add constraint "device_apns_tokens_device_id_key" UNIQUE using index "device_apns_tokens_device_id_key";

alter table "public"."device_apns_tokens" add constraint "device_apns_tokens_token_check" CHECK ((char_length(token) <= 1024)) not valid;

alter table "public"."device_apns_tokens" validate constraint "device_apns_tokens_token_check";

alter table "public"."device_fcm_tokens" add constraint "device_fcm_tokens_device_id_fkey" FOREIGN KEY (device_id) REFERENCES devices(id) ON DELETE CASCADE not valid;

alter table "public"."device_fcm_tokens" validate constraint "device_fcm_tokens_device_id_fkey";

alter table "public"."device_fcm_tokens" add constraint "device_fcm_tokens_token_check" CHECK ((char_length(token) <= 1024)) not valid;

alter table "public"."device_fcm_tokens" validate constraint "device_fcm_tokens_token_check";

alter table "public"."devices" add constraint "devices_name_check" CHECK ((char_length(name) <= 255)) not valid;

alter table "public"."devices" validate constraint "devices_name_check";

alter table "public"."devices" add constraint "devices_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."devices" validate constraint "devices_user_id_fkey";

grant delete on table "public"."device_apns_live_activity_tokens" to "anon";

grant insert on table "public"."device_apns_live_activity_tokens" to "anon";

grant references on table "public"."device_apns_live_activity_tokens" to "anon";

grant select on table "public"."device_apns_live_activity_tokens" to "anon";

grant trigger on table "public"."device_apns_live_activity_tokens" to "anon";

grant truncate on table "public"."device_apns_live_activity_tokens" to "anon";

grant update on table "public"."device_apns_live_activity_tokens" to "anon";

grant delete on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant insert on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant references on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant select on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant trigger on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant truncate on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant update on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant delete on table "public"."device_apns_live_activity_tokens" to "service_role";

grant insert on table "public"."device_apns_live_activity_tokens" to "service_role";

grant references on table "public"."device_apns_live_activity_tokens" to "service_role";

grant select on table "public"."device_apns_live_activity_tokens" to "service_role";

grant trigger on table "public"."device_apns_live_activity_tokens" to "service_role";

grant truncate on table "public"."device_apns_live_activity_tokens" to "service_role";

grant update on table "public"."device_apns_live_activity_tokens" to "service_role";

grant delete on table "public"."device_apns_tokens" to "anon";

grant insert on table "public"."device_apns_tokens" to "anon";

grant references on table "public"."device_apns_tokens" to "anon";

grant select on table "public"."device_apns_tokens" to "anon";

grant trigger on table "public"."device_apns_tokens" to "anon";

grant truncate on table "public"."device_apns_tokens" to "anon";

grant update on table "public"."device_apns_tokens" to "anon";

grant delete on table "public"."device_apns_tokens" to "authenticated";

grant insert on table "public"."device_apns_tokens" to "authenticated";

grant references on table "public"."device_apns_tokens" to "authenticated";

grant select on table "public"."device_apns_tokens" to "authenticated";

grant trigger on table "public"."device_apns_tokens" to "authenticated";

grant truncate on table "public"."device_apns_tokens" to "authenticated";

grant update on table "public"."device_apns_tokens" to "authenticated";

grant delete on table "public"."device_apns_tokens" to "service_role";

grant insert on table "public"."device_apns_tokens" to "service_role";

grant references on table "public"."device_apns_tokens" to "service_role";

grant select on table "public"."device_apns_tokens" to "service_role";

grant trigger on table "public"."device_apns_tokens" to "service_role";

grant truncate on table "public"."device_apns_tokens" to "service_role";

grant update on table "public"."device_apns_tokens" to "service_role";

grant delete on table "public"."device_fcm_tokens" to "anon";

grant insert on table "public"."device_fcm_tokens" to "anon";

grant references on table "public"."device_fcm_tokens" to "anon";

grant select on table "public"."device_fcm_tokens" to "anon";

grant trigger on table "public"."device_fcm_tokens" to "anon";

grant truncate on table "public"."device_fcm_tokens" to "anon";

grant update on table "public"."device_fcm_tokens" to "anon";

grant delete on table "public"."device_fcm_tokens" to "authenticated";

grant insert on table "public"."device_fcm_tokens" to "authenticated";

grant references on table "public"."device_fcm_tokens" to "authenticated";

grant select on table "public"."device_fcm_tokens" to "authenticated";

grant trigger on table "public"."device_fcm_tokens" to "authenticated";

grant truncate on table "public"."device_fcm_tokens" to "authenticated";

grant update on table "public"."device_fcm_tokens" to "authenticated";

grant delete on table "public"."device_fcm_tokens" to "service_role";

grant insert on table "public"."device_fcm_tokens" to "service_role";

grant references on table "public"."device_fcm_tokens" to "service_role";

grant select on table "public"."device_fcm_tokens" to "service_role";

grant trigger on table "public"."device_fcm_tokens" to "service_role";

grant truncate on table "public"."device_fcm_tokens" to "service_role";

grant update on table "public"."device_fcm_tokens" to "service_role";

grant delete on table "public"."devices" to "anon";

grant insert on table "public"."devices" to "anon";

grant references on table "public"."devices" to "anon";

grant select on table "public"."devices" to "anon";

grant trigger on table "public"."devices" to "anon";

grant truncate on table "public"."devices" to "anon";

grant update on table "public"."devices" to "anon";

grant delete on table "public"."devices" to "authenticated";

grant insert on table "public"."devices" to "authenticated";

grant references on table "public"."devices" to "authenticated";

grant select on table "public"."devices" to "authenticated";

grant trigger on table "public"."devices" to "authenticated";

grant truncate on table "public"."devices" to "authenticated";

grant update on table "public"."devices" to "authenticated";

grant delete on table "public"."devices" to "service_role";

grant insert on table "public"."devices" to "service_role";

grant references on table "public"."devices" to "service_role";

grant select on table "public"."devices" to "service_role";

grant trigger on table "public"."devices" to "service_role";

grant truncate on table "public"."devices" to "service_role";

grant update on table "public"."devices" to "service_role";


