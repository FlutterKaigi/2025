create type "public"."basic_plan_type" as enum ('platinum', 'gold', 'silver', 'bronze');

create type "public"."company_sponsor_type" as enum ('basic', 'community', 'none');

create type "public"."option_plan_type" as enum ('naming_rights_hall', 'naming_rights_room', 'nameplate', 'lunch', 'scholarship');

revoke delete on table "public"."sponsor_lunch" from "anon";

revoke insert on table "public"."sponsor_lunch" from "anon";

revoke references on table "public"."sponsor_lunch" from "anon";

revoke select on table "public"."sponsor_lunch" from "anon";

revoke trigger on table "public"."sponsor_lunch" from "anon";

revoke truncate on table "public"."sponsor_lunch" from "anon";

revoke update on table "public"."sponsor_lunch" from "anon";

revoke delete on table "public"."sponsor_lunch" from "authenticated";

revoke insert on table "public"."sponsor_lunch" from "authenticated";

revoke references on table "public"."sponsor_lunch" from "authenticated";

revoke select on table "public"."sponsor_lunch" from "authenticated";

revoke trigger on table "public"."sponsor_lunch" from "authenticated";

revoke truncate on table "public"."sponsor_lunch" from "authenticated";

revoke update on table "public"."sponsor_lunch" from "authenticated";

revoke delete on table "public"."sponsor_lunch" from "service_role";

revoke insert on table "public"."sponsor_lunch" from "service_role";

revoke references on table "public"."sponsor_lunch" from "service_role";

revoke select on table "public"."sponsor_lunch" from "service_role";

revoke trigger on table "public"."sponsor_lunch" from "service_role";

revoke truncate on table "public"."sponsor_lunch" from "service_role";

revoke update on table "public"."sponsor_lunch" from "service_role";

revoke delete on table "public"."sponsor_nameplate" from "anon";

revoke insert on table "public"."sponsor_nameplate" from "anon";

revoke references on table "public"."sponsor_nameplate" from "anon";

revoke select on table "public"."sponsor_nameplate" from "anon";

revoke trigger on table "public"."sponsor_nameplate" from "anon";

revoke truncate on table "public"."sponsor_nameplate" from "anon";

revoke update on table "public"."sponsor_nameplate" from "anon";

revoke delete on table "public"."sponsor_nameplate" from "authenticated";

revoke insert on table "public"."sponsor_nameplate" from "authenticated";

revoke references on table "public"."sponsor_nameplate" from "authenticated";

revoke select on table "public"."sponsor_nameplate" from "authenticated";

revoke trigger on table "public"."sponsor_nameplate" from "authenticated";

revoke truncate on table "public"."sponsor_nameplate" from "authenticated";

revoke update on table "public"."sponsor_nameplate" from "authenticated";

revoke delete on table "public"."sponsor_nameplate" from "service_role";

revoke insert on table "public"."sponsor_nameplate" from "service_role";

revoke references on table "public"."sponsor_nameplate" from "service_role";

revoke select on table "public"."sponsor_nameplate" from "service_role";

revoke trigger on table "public"."sponsor_nameplate" from "service_role";

revoke truncate on table "public"."sponsor_nameplate" from "service_role";

revoke update on table "public"."sponsor_nameplate" from "service_role";

revoke delete on table "public"."sponsor_naming_rights" from "anon";

revoke insert on table "public"."sponsor_naming_rights" from "anon";

revoke references on table "public"."sponsor_naming_rights" from "anon";

revoke select on table "public"."sponsor_naming_rights" from "anon";

revoke trigger on table "public"."sponsor_naming_rights" from "anon";

revoke truncate on table "public"."sponsor_naming_rights" from "anon";

revoke update on table "public"."sponsor_naming_rights" from "anon";

revoke delete on table "public"."sponsor_naming_rights" from "authenticated";

revoke insert on table "public"."sponsor_naming_rights" from "authenticated";

revoke references on table "public"."sponsor_naming_rights" from "authenticated";

revoke select on table "public"."sponsor_naming_rights" from "authenticated";

revoke trigger on table "public"."sponsor_naming_rights" from "authenticated";

revoke truncate on table "public"."sponsor_naming_rights" from "authenticated";

revoke update on table "public"."sponsor_naming_rights" from "authenticated";

revoke delete on table "public"."sponsor_naming_rights" from "service_role";

revoke insert on table "public"."sponsor_naming_rights" from "service_role";

revoke references on table "public"."sponsor_naming_rights" from "service_role";

revoke select on table "public"."sponsor_naming_rights" from "service_role";

revoke trigger on table "public"."sponsor_naming_rights" from "service_role";

revoke truncate on table "public"."sponsor_naming_rights" from "service_role";

revoke update on table "public"."sponsor_naming_rights" from "service_role";

revoke delete on table "public"."sponsor_scholarship" from "anon";

revoke insert on table "public"."sponsor_scholarship" from "anon";

revoke references on table "public"."sponsor_scholarship" from "anon";

revoke select on table "public"."sponsor_scholarship" from "anon";

revoke trigger on table "public"."sponsor_scholarship" from "anon";

revoke truncate on table "public"."sponsor_scholarship" from "anon";

revoke update on table "public"."sponsor_scholarship" from "anon";

revoke delete on table "public"."sponsor_scholarship" from "authenticated";

revoke insert on table "public"."sponsor_scholarship" from "authenticated";

revoke references on table "public"."sponsor_scholarship" from "authenticated";

revoke select on table "public"."sponsor_scholarship" from "authenticated";

revoke trigger on table "public"."sponsor_scholarship" from "authenticated";

revoke truncate on table "public"."sponsor_scholarship" from "authenticated";

revoke update on table "public"."sponsor_scholarship" from "authenticated";

revoke delete on table "public"."sponsor_scholarship" from "service_role";

revoke insert on table "public"."sponsor_scholarship" from "service_role";

revoke references on table "public"."sponsor_scholarship" from "service_role";

revoke select on table "public"."sponsor_scholarship" from "service_role";

revoke trigger on table "public"."sponsor_scholarship" from "service_role";

revoke truncate on table "public"."sponsor_scholarship" from "service_role";

revoke update on table "public"."sponsor_scholarship" from "service_role";

alter table "public"."sponsor_lunch" drop constraint "sponsor_lunch_company_id_fkey";

alter table "public"."sponsor_nameplate" drop constraint "sponsor_nameplate_company_id_fkey";

alter table "public"."sponsor_naming_rights" drop constraint "sponsor_naming_rights_company_id_fkey";

alter table "public"."sponsor_scholarship" drop constraint "sponsor_scholarship_company_id_fkey";

alter table "public"."sponsor_lunch" drop constraint "sponsor_lunch_pkey";

alter table "public"."sponsor_nameplate" drop constraint "sponsor_nameplate_pkey";

alter table "public"."sponsor_naming_rights" drop constraint "sponsor_naming_rights_pkey";

alter table "public"."sponsor_scholarship" drop constraint "sponsor_scholarship_pkey";

drop index if exists "public"."sponsor_lunch_pkey";

drop index if exists "public"."sponsor_nameplate_pkey";

drop index if exists "public"."sponsor_naming_rights_pkey";

drop index if exists "public"."sponsor_scholarship_pkey";

drop table "public"."sponsor_lunch";

drop table "public"."sponsor_nameplate";

drop table "public"."sponsor_naming_rights";

drop table "public"."sponsor_scholarship";

create table "public"."basic_sponsor_companies" (
    "id" smallint generated always as identity not null,
    "sponsor_company_id" smallint,
    "basic_plan_type" basic_plan_type not null,
    "created_at" timestamp without time zone not null default now()
);


alter table "public"."basic_sponsor_companies" enable row level security;

create table "public"."sponsor_companies" (
    "id" smallint generated always as identity not null,
    "company_id" smallint,
    "sponsor_type" company_sponsor_type not null,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."sponsor_companies" enable row level security;

create table "public"."sponsor_company_options" (
    "id" smallint generated always as identity not null,
    "sponsor_company_id" smallint,
    "option_plan_type" option_plan_type not null,
    "created_at" timestamp without time zone not null default now()
);


alter table "public"."sponsor_company_options" enable row level security;

CREATE UNIQUE INDEX basic_sponsor_companies_pkey ON public.basic_sponsor_companies USING btree (id);

CREATE UNIQUE INDEX basic_sponsor_companies_sponsor_company_id_key ON public.basic_sponsor_companies USING btree (sponsor_company_id);

CREATE UNIQUE INDEX sponsor_companies_pkey ON public.sponsor_companies USING btree (id);

CREATE UNIQUE INDEX sponsor_company_options_pkey ON public.sponsor_company_options USING btree (id);

CREATE UNIQUE INDEX sponsor_company_options_sponsor_company_id_option_plan_type_key ON public.sponsor_company_options USING btree (sponsor_company_id, option_plan_type);

alter table "public"."basic_sponsor_companies" add constraint "basic_sponsor_companies_pkey" PRIMARY KEY using index "basic_sponsor_companies_pkey";

alter table "public"."sponsor_companies" add constraint "sponsor_companies_pkey" PRIMARY KEY using index "sponsor_companies_pkey";

alter table "public"."sponsor_company_options" add constraint "sponsor_company_options_pkey" PRIMARY KEY using index "sponsor_company_options_pkey";

alter table "public"."basic_sponsor_companies" add constraint "basic_sponsor_companies_sponsor_company_id_fkey" FOREIGN KEY (sponsor_company_id) REFERENCES sponsor_companies(id) ON DELETE CASCADE not valid;

alter table "public"."basic_sponsor_companies" validate constraint "basic_sponsor_companies_sponsor_company_id_fkey";

alter table "public"."basic_sponsor_companies" add constraint "basic_sponsor_companies_sponsor_company_id_key" UNIQUE using index "basic_sponsor_companies_sponsor_company_id_key";

alter table "public"."sponsor_companies" add constraint "sponsor_companies_company_id_fkey" FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE not valid;

alter table "public"."sponsor_companies" validate constraint "sponsor_companies_company_id_fkey";

alter table "public"."sponsor_company_options" add constraint "sponsor_company_options_sponsor_company_id_fkey" FOREIGN KEY (sponsor_company_id) REFERENCES sponsor_companies(id) ON DELETE CASCADE not valid;

alter table "public"."sponsor_company_options" validate constraint "sponsor_company_options_sponsor_company_id_fkey";

alter table "public"."sponsor_company_options" add constraint "sponsor_company_options_sponsor_company_id_option_plan_type_key" UNIQUE using index "sponsor_company_options_sponsor_company_id_option_plan_type_key";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.check_option_plan_availability(p_basic_plan_type basic_plan_type, p_option_plan_type option_plan_type)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
BEGIN
  -- スカラシップは全プラン利用可能
  IF p_option_plan_type = 'scholarship' THEN
    RETURN TRUE;
  END IF;
  
  -- ネーミングライツ（ホール）：silver以上限定
  IF p_option_plan_type = 'naming_rights_hall' THEN
    RETURN p_basic_plan_type IN ('platinum', 'gold', 'silver');
  END IF;
  
  -- ネーミングライツ（ルーム）：silver以上限定
  IF p_option_plan_type = 'naming_rights_room' THEN
    RETURN p_basic_plan_type IN ('platinum', 'gold', 'silver');
  END IF;
  
  -- ネームプレート：ブロンズ以上限定
  IF p_option_plan_type = 'nameplate' THEN
    RETURN p_basic_plan_type IN ('platinum', 'gold', 'silver', 'bronze');
  END IF;
  
  -- 弁当：シルバー・ブロンズ限定
  IF p_option_plan_type = 'lunch' THEN
    RETURN p_basic_plan_type IN ('silver', 'bronze');
  END IF;
  
  RETURN FALSE;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.check_sponsor_option_constraint()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
  v_basic_plan_type public.basic_plan_type;
  v_sponsor_type public.company_sponsor_type;
BEGIN
  -- スポンサータイプを取得
  SELECT sc.sponsor_type
  INTO v_sponsor_type
  FROM sponsor_companies sc
  WHERE sc.id = NEW.sponsor_company_id;

  IF v_sponsor_type != 'basic' THEN
    IF NEW.option_plan_type != 'scholarship' THEN
      RAISE EXCEPTION 'ベーシックスポンサーではない場合、スカラーシップスポンサー以外は利用できません。';
    END IF;
    RETURN NEW;
  END IF;

  -- ベーシックスポンサーの場合、プラン制約をチェック
  SELECT bsc.basic_plan_type
  INTO v_basic_plan_type
  FROM basic_sponsor_companies bsc
  WHERE bsc.sponsor_company_id = NEW.sponsor_company_id;

  IF NOT check_option_plan_availability(v_basic_plan_type, NEW.option_plan_type) THEN
    RAISE EXCEPTION 'このプランでは利用できないオプションです';
  END IF;

  RETURN NEW;
END;
$function$
;

grant delete on table "public"."basic_sponsor_companies" to "anon";

grant insert on table "public"."basic_sponsor_companies" to "anon";

grant references on table "public"."basic_sponsor_companies" to "anon";

grant select on table "public"."basic_sponsor_companies" to "anon";

grant trigger on table "public"."basic_sponsor_companies" to "anon";

grant truncate on table "public"."basic_sponsor_companies" to "anon";

grant update on table "public"."basic_sponsor_companies" to "anon";

grant delete on table "public"."basic_sponsor_companies" to "authenticated";

grant insert on table "public"."basic_sponsor_companies" to "authenticated";

grant references on table "public"."basic_sponsor_companies" to "authenticated";

grant select on table "public"."basic_sponsor_companies" to "authenticated";

grant trigger on table "public"."basic_sponsor_companies" to "authenticated";

grant truncate on table "public"."basic_sponsor_companies" to "authenticated";

grant update on table "public"."basic_sponsor_companies" to "authenticated";

grant delete on table "public"."basic_sponsor_companies" to "service_role";

grant insert on table "public"."basic_sponsor_companies" to "service_role";

grant references on table "public"."basic_sponsor_companies" to "service_role";

grant select on table "public"."basic_sponsor_companies" to "service_role";

grant trigger on table "public"."basic_sponsor_companies" to "service_role";

grant truncate on table "public"."basic_sponsor_companies" to "service_role";

grant update on table "public"."basic_sponsor_companies" to "service_role";

grant delete on table "public"."sponsor_companies" to "anon";

grant insert on table "public"."sponsor_companies" to "anon";

grant references on table "public"."sponsor_companies" to "anon";

grant select on table "public"."sponsor_companies" to "anon";

grant trigger on table "public"."sponsor_companies" to "anon";

grant truncate on table "public"."sponsor_companies" to "anon";

grant update on table "public"."sponsor_companies" to "anon";

grant delete on table "public"."sponsor_companies" to "authenticated";

grant insert on table "public"."sponsor_companies" to "authenticated";

grant references on table "public"."sponsor_companies" to "authenticated";

grant select on table "public"."sponsor_companies" to "authenticated";

grant trigger on table "public"."sponsor_companies" to "authenticated";

grant truncate on table "public"."sponsor_companies" to "authenticated";

grant update on table "public"."sponsor_companies" to "authenticated";

grant delete on table "public"."sponsor_companies" to "service_role";

grant insert on table "public"."sponsor_companies" to "service_role";

grant references on table "public"."sponsor_companies" to "service_role";

grant select on table "public"."sponsor_companies" to "service_role";

grant trigger on table "public"."sponsor_companies" to "service_role";

grant truncate on table "public"."sponsor_companies" to "service_role";

grant update on table "public"."sponsor_companies" to "service_role";

grant delete on table "public"."sponsor_company_options" to "anon";

grant insert on table "public"."sponsor_company_options" to "anon";

grant references on table "public"."sponsor_company_options" to "anon";

grant select on table "public"."sponsor_company_options" to "anon";

grant trigger on table "public"."sponsor_company_options" to "anon";

grant truncate on table "public"."sponsor_company_options" to "anon";

grant update on table "public"."sponsor_company_options" to "anon";

grant delete on table "public"."sponsor_company_options" to "authenticated";

grant insert on table "public"."sponsor_company_options" to "authenticated";

grant references on table "public"."sponsor_company_options" to "authenticated";

grant select on table "public"."sponsor_company_options" to "authenticated";

grant trigger on table "public"."sponsor_company_options" to "authenticated";

grant truncate on table "public"."sponsor_company_options" to "authenticated";

grant update on table "public"."sponsor_company_options" to "authenticated";

grant delete on table "public"."sponsor_company_options" to "service_role";

grant insert on table "public"."sponsor_company_options" to "service_role";

grant references on table "public"."sponsor_company_options" to "service_role";

grant select on table "public"."sponsor_company_options" to "service_role";

grant trigger on table "public"."sponsor_company_options" to "service_role";

grant truncate on table "public"."sponsor_company_options" to "service_role";

grant update on table "public"."sponsor_company_options" to "service_role";

CREATE TRIGGER check_sponsor_option_constraint_trigger BEFORE INSERT OR UPDATE ON public.sponsor_company_options FOR EACH ROW EXECUTE FUNCTION check_sponsor_option_constraint();


