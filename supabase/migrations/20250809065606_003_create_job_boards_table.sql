create table "public"."job_boards" (
    "id" smallint not null,
    "url" text not null,
    "alt_text" text not null,
    "image_name" text not null
);


alter table "public"."job_boards" enable row level security;

CREATE UNIQUE INDEX job_boards_pkey ON public.job_boards USING btree (id);

CREATE UNIQUE INDEX job_boards_url_key ON public.job_boards USING btree (url);

alter table "public"."job_boards" add constraint "job_boards_pkey" PRIMARY KEY using index "job_boards_pkey";

alter table "public"."job_boards" add constraint "job_boards_alt_text_check" CHECK ((alt_text <> ''::text)) not valid;

alter table "public"."job_boards" validate constraint "job_boards_alt_text_check";

alter table "public"."job_boards" add constraint "job_boards_id_fkey" FOREIGN KEY (id) REFERENCES companies(id) ON DELETE CASCADE not valid;

alter table "public"."job_boards" validate constraint "job_boards_id_fkey";

alter table "public"."job_boards" add constraint "job_boards_image_name_check" CHECK ((image_name <> ''::text)) not valid;

alter table "public"."job_boards" validate constraint "job_boards_image_name_check";

alter table "public"."job_boards" add constraint "job_boards_url_check" CHECK ((url ~* '^https?://'::text)) not valid;

alter table "public"."job_boards" validate constraint "job_boards_url_check";

alter table "public"."job_boards" add constraint "job_boards_url_key" UNIQUE using index "job_boards_url_key";

grant delete on table "public"."job_boards" to "anon";

grant insert on table "public"."job_boards" to "anon";

grant references on table "public"."job_boards" to "anon";

grant select on table "public"."job_boards" to "anon";

grant trigger on table "public"."job_boards" to "anon";

grant truncate on table "public"."job_boards" to "anon";

grant update on table "public"."job_boards" to "anon";

grant delete on table "public"."job_boards" to "authenticated";

grant insert on table "public"."job_boards" to "authenticated";

grant references on table "public"."job_boards" to "authenticated";

grant select on table "public"."job_boards" to "authenticated";

grant trigger on table "public"."job_boards" to "authenticated";

grant truncate on table "public"."job_boards" to "authenticated";

grant update on table "public"."job_boards" to "authenticated";

grant delete on table "public"."job_boards" to "service_role";

grant insert on table "public"."job_boards" to "service_role";

grant references on table "public"."job_boards" to "service_role";

grant select on table "public"."job_boards" to "service_role";

grant trigger on table "public"."job_boards" to "service_role";

grant truncate on table "public"."job_boards" to "service_role";

grant update on table "public"."job_boards" to "service_role";


