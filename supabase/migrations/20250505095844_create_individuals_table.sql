create table "public"."individuals" (
    "id" integer not null,
    "user_id" uuid,
    "created_at" timestamp without time zone not null default CURRENT_TIMESTAMP,
    "updated_at" timestamp without time zone not null default CURRENT_TIMESTAMP
);


CREATE UNIQUE INDEX individuals_pkey ON public.individuals USING btree (id);

alter table "public"."individuals" add constraint "individuals_pkey" PRIMARY KEY using index "individuals_pkey";

alter table "public"."individuals" add constraint "individuals_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE not valid;

alter table "public"."individuals" validate constraint "individuals_user_id_fkey";

grant delete on table "public"."individuals" to "anon";

grant insert on table "public"."individuals" to "anon";

grant references on table "public"."individuals" to "anon";

grant select on table "public"."individuals" to "anon";

grant trigger on table "public"."individuals" to "anon";

grant truncate on table "public"."individuals" to "anon";

grant update on table "public"."individuals" to "anon";

grant delete on table "public"."individuals" to "authenticated";

grant insert on table "public"."individuals" to "authenticated";

grant references on table "public"."individuals" to "authenticated";

grant select on table "public"."individuals" to "authenticated";

grant trigger on table "public"."individuals" to "authenticated";

grant truncate on table "public"."individuals" to "authenticated";

grant update on table "public"."individuals" to "authenticated";

grant delete on table "public"."individuals" to "service_role";

grant insert on table "public"."individuals" to "service_role";

grant references on table "public"."individuals" to "service_role";

grant select on table "public"."individuals" to "service_role";

grant trigger on table "public"."individuals" to "service_role";

grant truncate on table "public"."individuals" to "service_role";

grant update on table "public"."individuals" to "service_role";


