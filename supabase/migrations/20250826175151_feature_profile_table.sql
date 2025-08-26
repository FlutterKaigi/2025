create type "public"."sns_type" as enum ('github', 'x', 'discord', 'medium', 'qiita', 'zenn', 'note', 'other');

create table "public"."profiles" (
    "id" uuid not null,
    "name" text not null,
    "comment" text not null,
    "is_adult" boolean not null default false,
    "avatar_key" text,
    "created_at" timestamp without time zone not null default CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone not null default CURRENT_TIMESTAMP
);


alter table "public"."profiles" enable row level security;

create table "public"."user_sns_links" (
    "id" uuid not null default uuid_generate_v7(),
    "user_id" uuid not null,
    "sns_type" sns_type not null,
    "value" text not null,
    "created_at" timestamp without time zone not null default CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone not null default CURRENT_TIMESTAMP
);


alter table "public"."user_sns_links" enable row level security;

CREATE UNIQUE INDEX profiles_pkey ON public.profiles USING btree (id);

CREATE UNIQUE INDEX user_sns_links_pkey ON public.user_sns_links USING btree (id);

CREATE UNIQUE INDEX user_sns_links_user_id_sns_type_key ON public.user_sns_links USING btree (user_id, sns_type);

alter table "public"."profiles" add constraint "profiles_pkey" PRIMARY KEY using index "profiles_pkey";

alter table "public"."user_sns_links" add constraint "user_sns_links_pkey" PRIMARY KEY using index "user_sns_links_pkey";

alter table "public"."profiles" add constraint "profiles_comment_check" CHECK ((char_length(comment) <= 100)) not valid;

alter table "public"."profiles" validate constraint "profiles_comment_check";

alter table "public"."profiles" add constraint "profiles_id_fkey" FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."profiles" validate constraint "profiles_id_fkey";

alter table "public"."user_sns_links" add constraint "user_sns_links_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."user_sns_links" validate constraint "user_sns_links_user_id_fkey";

alter table "public"."user_sns_links" add constraint "user_sns_links_user_id_sns_type_key" UNIQUE using index "user_sns_links_user_id_sns_type_key";

alter table "public"."user_sns_links" add constraint "user_sns_links_value_check" CHECK ((char_length(TRIM(BOTH FROM value)) > 0)) not valid;

alter table "public"."user_sns_links" validate constraint "user_sns_links_value_check";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.replace_user_sns_links(user_id uuid, sns_accounts jsonb)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
BEGIN
  -- 既存のSNSアカウント情報を削除
  DELETE FROM public.user_sns_links WHERE user_sns_links.user_id = replace_user_sns_links.user_id;

  -- 新しいSNSアカウント情報を挿入
  -- sns_accountsが空でない場合のみ挿入
  IF jsonb_array_length(sns_accounts) > 0 THEN
    INSERT INTO public.user_sns_links (user_id, sns_type, value, created_at, updated_at)
    SELECT
      replace_user_sns_links.user_id,
      CAST(j->>'type' AS public.sns_type),
      trim(j->>'value'),
      current_timestamp,
      current_timestamp
    FROM jsonb_array_elements(sns_accounts) AS j
    WHERE trim(j->>'value') != '';
  END IF;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.update_updated_at_column()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
  NEW.updated_at = current_timestamp;
  RETURN NEW;
END;
$function$
;

grant delete on table "public"."profiles" to "anon";

grant insert on table "public"."profiles" to "anon";

grant references on table "public"."profiles" to "anon";

grant select on table "public"."profiles" to "anon";

grant trigger on table "public"."profiles" to "anon";

grant truncate on table "public"."profiles" to "anon";

grant update on table "public"."profiles" to "anon";

grant delete on table "public"."profiles" to "authenticated";

grant insert on table "public"."profiles" to "authenticated";

grant references on table "public"."profiles" to "authenticated";

grant select on table "public"."profiles" to "authenticated";

grant trigger on table "public"."profiles" to "authenticated";

grant truncate on table "public"."profiles" to "authenticated";

grant update on table "public"."profiles" to "authenticated";

grant delete on table "public"."profiles" to "service_role";

grant insert on table "public"."profiles" to "service_role";

grant references on table "public"."profiles" to "service_role";

grant select on table "public"."profiles" to "service_role";

grant trigger on table "public"."profiles" to "service_role";

grant truncate on table "public"."profiles" to "service_role";

grant update on table "public"."profiles" to "service_role";

grant delete on table "public"."user_sns_links" to "anon";

grant insert on table "public"."user_sns_links" to "anon";

grant references on table "public"."user_sns_links" to "anon";

grant select on table "public"."user_sns_links" to "anon";

grant trigger on table "public"."user_sns_links" to "anon";

grant truncate on table "public"."user_sns_links" to "anon";

grant update on table "public"."user_sns_links" to "anon";

grant delete on table "public"."user_sns_links" to "authenticated";

grant insert on table "public"."user_sns_links" to "authenticated";

grant references on table "public"."user_sns_links" to "authenticated";

grant select on table "public"."user_sns_links" to "authenticated";

grant trigger on table "public"."user_sns_links" to "authenticated";

grant truncate on table "public"."user_sns_links" to "authenticated";

grant update on table "public"."user_sns_links" to "authenticated";

grant delete on table "public"."user_sns_links" to "service_role";

grant insert on table "public"."user_sns_links" to "service_role";

grant references on table "public"."user_sns_links" to "service_role";

grant select on table "public"."user_sns_links" to "service_role";

grant trigger on table "public"."user_sns_links" to "service_role";

grant truncate on table "public"."user_sns_links" to "service_role";

grant update on table "public"."user_sns_links" to "service_role";

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_user_sns_links_updated_at BEFORE UPDATE ON public.user_sns_links FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();


