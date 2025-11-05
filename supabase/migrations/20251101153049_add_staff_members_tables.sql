create table "public"."staff_member_sns_links" (
    "id" uuid not null default uuid_generate_v7(),
    "staff_member_id" uuid not null,
    "sns_type" sns_type not null,
    "value" text not null,
    "created_at" timestamp without time zone not null default CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone not null default CURRENT_TIMESTAMP
);


alter table "public"."staff_member_sns_links" enable row level security;

create table "public"."staff_members" (
    "id" uuid not null default uuid_generate_v7(),
    "name" text not null,
    "icon_name" text not null,
    "greeting" text,
    "created_at" timestamp without time zone not null default CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone not null default CURRENT_TIMESTAMP
);


alter table "public"."staff_members" enable row level security;

CREATE UNIQUE INDEX staff_member_sns_links_pkey ON public.staff_member_sns_links USING btree (id);

CREATE UNIQUE INDEX staff_member_sns_links_staff_member_id_sns_type_key ON public.staff_member_sns_links USING btree (staff_member_id, sns_type);

CREATE UNIQUE INDEX staff_members_pkey ON public.staff_members USING btree (id);

alter table "public"."staff_member_sns_links" add constraint "staff_member_sns_links_pkey" PRIMARY KEY using index "staff_member_sns_links_pkey";

alter table "public"."staff_members" add constraint "staff_members_pkey" PRIMARY KEY using index "staff_members_pkey";

alter table "public"."staff_member_sns_links" add constraint "staff_member_sns_links_staff_member_id_fkey" FOREIGN KEY (staff_member_id) REFERENCES staff_members(id) ON DELETE CASCADE not valid;

alter table "public"."staff_member_sns_links" validate constraint "staff_member_sns_links_staff_member_id_fkey";

alter table "public"."staff_member_sns_links" add constraint "staff_member_sns_links_staff_member_id_sns_type_key" UNIQUE using index "staff_member_sns_links_staff_member_id_sns_type_key";

alter table "public"."staff_member_sns_links" add constraint "staff_member_sns_links_value_check" CHECK ((char_length(TRIM(BOTH FROM value)) > 0)) not valid;

alter table "public"."staff_member_sns_links" validate constraint "staff_member_sns_links_value_check";

alter table "public"."staff_members" add constraint "staff_members_icon_name_check" CHECK ((char_length(TRIM(BOTH FROM icon_name)) > 0)) not valid;

alter table "public"."staff_members" validate constraint "staff_members_icon_name_check";

alter table "public"."staff_members" add constraint "staff_members_name_check" CHECK ((char_length(TRIM(BOTH FROM name)) > 0)) not valid;

alter table "public"."staff_members" validate constraint "staff_members_name_check";

grant delete on table "public"."staff_member_sns_links" to "anon";

grant insert on table "public"."staff_member_sns_links" to "anon";

grant references on table "public"."staff_member_sns_links" to "anon";

grant select on table "public"."staff_member_sns_links" to "anon";

grant trigger on table "public"."staff_member_sns_links" to "anon";

grant truncate on table "public"."staff_member_sns_links" to "anon";

grant update on table "public"."staff_member_sns_links" to "anon";

grant delete on table "public"."staff_member_sns_links" to "authenticated";

grant insert on table "public"."staff_member_sns_links" to "authenticated";

grant references on table "public"."staff_member_sns_links" to "authenticated";

grant select on table "public"."staff_member_sns_links" to "authenticated";

grant trigger on table "public"."staff_member_sns_links" to "authenticated";

grant truncate on table "public"."staff_member_sns_links" to "authenticated";

grant update on table "public"."staff_member_sns_links" to "authenticated";

grant delete on table "public"."staff_member_sns_links" to "service_role";

grant insert on table "public"."staff_member_sns_links" to "service_role";

grant references on table "public"."staff_member_sns_links" to "service_role";

grant select on table "public"."staff_member_sns_links" to "service_role";

grant trigger on table "public"."staff_member_sns_links" to "service_role";

grant truncate on table "public"."staff_member_sns_links" to "service_role";

grant update on table "public"."staff_member_sns_links" to "service_role";

grant delete on table "public"."staff_members" to "anon";

grant insert on table "public"."staff_members" to "anon";

grant references on table "public"."staff_members" to "anon";

grant select on table "public"."staff_members" to "anon";

grant trigger on table "public"."staff_members" to "anon";

grant truncate on table "public"."staff_members" to "anon";

grant update on table "public"."staff_members" to "anon";

grant delete on table "public"."staff_members" to "authenticated";

grant insert on table "public"."staff_members" to "authenticated";

grant references on table "public"."staff_members" to "authenticated";

grant select on table "public"."staff_members" to "authenticated";

grant trigger on table "public"."staff_members" to "authenticated";

grant truncate on table "public"."staff_members" to "authenticated";

grant update on table "public"."staff_members" to "authenticated";

grant delete on table "public"."staff_members" to "service_role";

grant insert on table "public"."staff_members" to "service_role";

grant references on table "public"."staff_members" to "service_role";

grant select on table "public"."staff_members" to "service_role";

grant trigger on table "public"."staff_members" to "service_role";

grant truncate on table "public"."staff_members" to "service_role";

grant update on table "public"."staff_members" to "service_role";

CREATE TRIGGER update_staff_member_sns_links_updated_at BEFORE UPDATE ON public.staff_member_sns_links FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_staff_members_updated_at BEFORE UPDATE ON public.staff_members FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();


