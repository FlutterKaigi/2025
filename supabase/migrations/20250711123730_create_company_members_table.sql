create table "public"."company_members" (
    "company_id" smallint not null,
    "user_id" uuid not null,
    "joined_at" timestamp without time zone not null default now(),
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."company_members" enable row level security;

CREATE UNIQUE INDEX company_members_pkey ON public.company_members USING btree (company_id, user_id);

alter table "public"."company_members" add constraint "company_members_pkey" PRIMARY KEY using index "company_members_pkey";

alter table "public"."company_members" add constraint "company_members_company_id_fkey" FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE not valid;

alter table "public"."company_members" validate constraint "company_members_company_id_fkey";

alter table "public"."company_members" add constraint "company_members_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE not valid;

alter table "public"."company_members" validate constraint "company_members_user_id_fkey";

grant delete on table "public"."company_members" to "anon";

grant insert on table "public"."company_members" to "anon";

grant references on table "public"."company_members" to "anon";

grant select on table "public"."company_members" to "anon";

grant trigger on table "public"."company_members" to "anon";

grant truncate on table "public"."company_members" to "anon";

grant update on table "public"."company_members" to "anon";

grant delete on table "public"."company_members" to "authenticated";

grant insert on table "public"."company_members" to "authenticated";

grant references on table "public"."company_members" to "authenticated";

grant select on table "public"."company_members" to "authenticated";

grant trigger on table "public"."company_members" to "authenticated";

grant truncate on table "public"."company_members" to "authenticated";

grant update on table "public"."company_members" to "authenticated";

grant delete on table "public"."company_members" to "service_role";

grant insert on table "public"."company_members" to "service_role";

grant references on table "public"."company_members" to "service_role";

grant select on table "public"."company_members" to "service_role";

grant trigger on table "public"."company_members" to "service_role";

grant truncate on table "public"."company_members" to "service_role";

grant update on table "public"."company_members" to "service_role";


