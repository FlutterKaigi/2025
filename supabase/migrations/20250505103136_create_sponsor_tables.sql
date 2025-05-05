create table "public"."company_draft_approvals" (
    "id" integer generated always as identity not null,
    "company_draft_id" smallint,
    "approved_by" uuid,
    "created_at" timestamp without time zone not null default now()
);


alter table "public"."company_draft_approvals" enable row level security;

create table "public"."company_drafts" (
    "id" smallint generated always as identity not null,
    "company_id" smallint,
    "name" text not null,
    "name_en" text not null,
    "logo_name" text,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."company_drafts" enable row level security;

create table "public"."company_invitation" (
    "company_id" smallint,
    "key" text not null,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."company_invitation" enable row level security;

create table "public"."individual_draft_approvals" (
    "id" integer generated always as identity not null,
    "individual_draft_id" integer,
    "approved_by" uuid,
    "created_at" timestamp without time zone not null default now()
);


alter table "public"."individual_draft_approvals" enable row level security;

create table "public"."individual_drafts" (
    "id" integer generated always as identity not null,
    "individual_id" integer,
    "name" text not null,
    "name_en" text not null,
    "logo_name" text,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."individual_drafts" enable row level security;

create table "public"."sponsor_individuals" (
    "id" smallint generated always as identity not null,
    "individual_id" smallint,
    "created_at" timestamp without time zone not null default now()
);


alter table "public"."sponsor_individuals" enable row level security;

create table "public"."sponsor_lunch" (
    "id" smallint generated always as identity not null,
    "company_id" smallint,
    "created_at" timestamp without time zone not null default now()
);


alter table "public"."sponsor_lunch" enable row level security;

create table "public"."sponsor_nameplate" (
    "id" smallint generated always as identity not null,
    "company_id" smallint,
    "created_at" timestamp without time zone not null default now()
);


alter table "public"."sponsor_nameplate" enable row level security;

create table "public"."sponsor_naming_rights" (
    "id" smallint generated always as identity not null,
    "company_id" smallint,
    "created_at" timestamp without time zone not null default now()
);


alter table "public"."sponsor_naming_rights" enable row level security;

create table "public"."sponsor_scholarship" (
    "id" smallint generated always as identity not null,
    "company_id" smallint,
    "created_at" timestamp without time zone not null default now()
);


alter table "public"."sponsor_scholarship" enable row level security;

alter table "public"."companies" alter column "id" add generated always as identity;

alter table "public"."individuals" alter column "created_at" set default now();

alter table "public"."individuals" alter column "id" add generated always as identity;

alter table "public"."individuals" alter column "updated_at" set default now();

alter table "public"."individuals" enable row level security;

CREATE UNIQUE INDEX company_draft_approvals_pkey ON public.company_draft_approvals USING btree (id);

CREATE UNIQUE INDEX company_drafts_pkey ON public.company_drafts USING btree (id);

CREATE UNIQUE INDEX company_invitation_key_key ON public.company_invitation USING btree (key);

CREATE UNIQUE INDEX individual_draft_approvals_pkey ON public.individual_draft_approvals USING btree (id);

CREATE UNIQUE INDEX individual_drafts_pkey ON public.individual_drafts USING btree (id);

CREATE UNIQUE INDEX individuals_user_id_key ON public.individuals USING btree (user_id);

CREATE UNIQUE INDEX sponsor_individuals_pkey ON public.sponsor_individuals USING btree (id);

CREATE UNIQUE INDEX sponsor_lunch_pkey ON public.sponsor_lunch USING btree (id);

CREATE UNIQUE INDEX sponsor_nameplate_pkey ON public.sponsor_nameplate USING btree (id);

CREATE UNIQUE INDEX sponsor_naming_rights_pkey ON public.sponsor_naming_rights USING btree (id);

CREATE UNIQUE INDEX sponsor_scholarship_pkey ON public.sponsor_scholarship USING btree (id);

alter table "public"."company_draft_approvals" add constraint "company_draft_approvals_pkey" PRIMARY KEY using index "company_draft_approvals_pkey";

alter table "public"."company_drafts" add constraint "company_drafts_pkey" PRIMARY KEY using index "company_drafts_pkey";

alter table "public"."individual_draft_approvals" add constraint "individual_draft_approvals_pkey" PRIMARY KEY using index "individual_draft_approvals_pkey";

alter table "public"."individual_drafts" add constraint "individual_drafts_pkey" PRIMARY KEY using index "individual_drafts_pkey";

alter table "public"."sponsor_individuals" add constraint "sponsor_individuals_pkey" PRIMARY KEY using index "sponsor_individuals_pkey";

alter table "public"."sponsor_lunch" add constraint "sponsor_lunch_pkey" PRIMARY KEY using index "sponsor_lunch_pkey";

alter table "public"."sponsor_nameplate" add constraint "sponsor_nameplate_pkey" PRIMARY KEY using index "sponsor_nameplate_pkey";

alter table "public"."sponsor_naming_rights" add constraint "sponsor_naming_rights_pkey" PRIMARY KEY using index "sponsor_naming_rights_pkey";

alter table "public"."sponsor_scholarship" add constraint "sponsor_scholarship_pkey" PRIMARY KEY using index "sponsor_scholarship_pkey";

alter table "public"."company_draft_approvals" add constraint "company_draft_approvals_approved_by_fkey" FOREIGN KEY (approved_by) REFERENCES users(id) ON DELETE SET NULL not valid;

alter table "public"."company_draft_approvals" validate constraint "company_draft_approvals_approved_by_fkey";

alter table "public"."company_draft_approvals" add constraint "company_draft_approvals_company_draft_id_fkey" FOREIGN KEY (company_draft_id) REFERENCES company_drafts(id) ON DELETE CASCADE not valid;

alter table "public"."company_draft_approvals" validate constraint "company_draft_approvals_company_draft_id_fkey";

alter table "public"."company_drafts" add constraint "company_drafts_company_id_fkey" FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE not valid;

alter table "public"."company_drafts" validate constraint "company_drafts_company_id_fkey";

alter table "public"."company_drafts" add constraint "company_drafts_name_check" CHECK ((name <> ''::text)) not valid;

alter table "public"."company_drafts" validate constraint "company_drafts_name_check";

alter table "public"."company_drafts" add constraint "company_drafts_name_en_check" CHECK ((name_en <> ''::text)) not valid;

alter table "public"."company_drafts" validate constraint "company_drafts_name_en_check";

alter table "public"."company_invitation" add constraint "company_invitation_company_id_fkey" FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE not valid;

alter table "public"."company_invitation" validate constraint "company_invitation_company_id_fkey";

alter table "public"."company_invitation" add constraint "company_invitation_key_check" CHECK ((key <> ''::text)) not valid;

alter table "public"."company_invitation" validate constraint "company_invitation_key_check";

alter table "public"."company_invitation" add constraint "company_invitation_key_key" UNIQUE using index "company_invitation_key_key";

alter table "public"."individual_draft_approvals" add constraint "individual_draft_approvals_approved_by_fkey" FOREIGN KEY (approved_by) REFERENCES users(id) ON DELETE SET NULL not valid;

alter table "public"."individual_draft_approvals" validate constraint "individual_draft_approvals_approved_by_fkey";

alter table "public"."individual_draft_approvals" add constraint "individual_draft_approvals_individual_draft_id_fkey" FOREIGN KEY (individual_draft_id) REFERENCES individual_drafts(id) ON DELETE CASCADE not valid;

alter table "public"."individual_draft_approvals" validate constraint "individual_draft_approvals_individual_draft_id_fkey";

alter table "public"."individual_drafts" add constraint "individual_drafts_individual_id_fkey" FOREIGN KEY (individual_id) REFERENCES individuals(id) ON DELETE CASCADE not valid;

alter table "public"."individual_drafts" validate constraint "individual_drafts_individual_id_fkey";

alter table "public"."individual_drafts" add constraint "individual_drafts_name_check" CHECK ((name <> ''::text)) not valid;

alter table "public"."individual_drafts" validate constraint "individual_drafts_name_check";

alter table "public"."individual_drafts" add constraint "individual_drafts_name_en_check" CHECK ((name_en <> ''::text)) not valid;

alter table "public"."individual_drafts" validate constraint "individual_drafts_name_en_check";

alter table "public"."individuals" add constraint "individuals_user_id_key" UNIQUE using index "individuals_user_id_key";

alter table "public"."sponsor_individuals" add constraint "sponsor_individuals_individual_id_fkey" FOREIGN KEY (individual_id) REFERENCES individuals(id) ON DELETE CASCADE not valid;

alter table "public"."sponsor_individuals" validate constraint "sponsor_individuals_individual_id_fkey";

alter table "public"."sponsor_lunch" add constraint "sponsor_lunch_company_id_fkey" FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE not valid;

alter table "public"."sponsor_lunch" validate constraint "sponsor_lunch_company_id_fkey";

alter table "public"."sponsor_nameplate" add constraint "sponsor_nameplate_company_id_fkey" FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE not valid;

alter table "public"."sponsor_nameplate" validate constraint "sponsor_nameplate_company_id_fkey";

alter table "public"."sponsor_naming_rights" add constraint "sponsor_naming_rights_company_id_fkey" FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE not valid;

alter table "public"."sponsor_naming_rights" validate constraint "sponsor_naming_rights_company_id_fkey";

alter table "public"."sponsor_scholarship" add constraint "sponsor_scholarship_company_id_fkey" FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE not valid;

alter table "public"."sponsor_scholarship" validate constraint "sponsor_scholarship_company_id_fkey";

grant delete on table "public"."company_draft_approvals" to "anon";

grant insert on table "public"."company_draft_approvals" to "anon";

grant references on table "public"."company_draft_approvals" to "anon";

grant select on table "public"."company_draft_approvals" to "anon";

grant trigger on table "public"."company_draft_approvals" to "anon";

grant truncate on table "public"."company_draft_approvals" to "anon";

grant update on table "public"."company_draft_approvals" to "anon";

grant delete on table "public"."company_draft_approvals" to "authenticated";

grant insert on table "public"."company_draft_approvals" to "authenticated";

grant references on table "public"."company_draft_approvals" to "authenticated";

grant select on table "public"."company_draft_approvals" to "authenticated";

grant trigger on table "public"."company_draft_approvals" to "authenticated";

grant truncate on table "public"."company_draft_approvals" to "authenticated";

grant update on table "public"."company_draft_approvals" to "authenticated";

grant delete on table "public"."company_draft_approvals" to "service_role";

grant insert on table "public"."company_draft_approvals" to "service_role";

grant references on table "public"."company_draft_approvals" to "service_role";

grant select on table "public"."company_draft_approvals" to "service_role";

grant trigger on table "public"."company_draft_approvals" to "service_role";

grant truncate on table "public"."company_draft_approvals" to "service_role";

grant update on table "public"."company_draft_approvals" to "service_role";

grant delete on table "public"."company_drafts" to "anon";

grant insert on table "public"."company_drafts" to "anon";

grant references on table "public"."company_drafts" to "anon";

grant select on table "public"."company_drafts" to "anon";

grant trigger on table "public"."company_drafts" to "anon";

grant truncate on table "public"."company_drafts" to "anon";

grant update on table "public"."company_drafts" to "anon";

grant delete on table "public"."company_drafts" to "authenticated";

grant insert on table "public"."company_drafts" to "authenticated";

grant references on table "public"."company_drafts" to "authenticated";

grant select on table "public"."company_drafts" to "authenticated";

grant trigger on table "public"."company_drafts" to "authenticated";

grant truncate on table "public"."company_drafts" to "authenticated";

grant update on table "public"."company_drafts" to "authenticated";

grant delete on table "public"."company_drafts" to "service_role";

grant insert on table "public"."company_drafts" to "service_role";

grant references on table "public"."company_drafts" to "service_role";

grant select on table "public"."company_drafts" to "service_role";

grant trigger on table "public"."company_drafts" to "service_role";

grant truncate on table "public"."company_drafts" to "service_role";

grant update on table "public"."company_drafts" to "service_role";

grant delete on table "public"."company_invitation" to "anon";

grant insert on table "public"."company_invitation" to "anon";

grant references on table "public"."company_invitation" to "anon";

grant select on table "public"."company_invitation" to "anon";

grant trigger on table "public"."company_invitation" to "anon";

grant truncate on table "public"."company_invitation" to "anon";

grant update on table "public"."company_invitation" to "anon";

grant delete on table "public"."company_invitation" to "authenticated";

grant insert on table "public"."company_invitation" to "authenticated";

grant references on table "public"."company_invitation" to "authenticated";

grant select on table "public"."company_invitation" to "authenticated";

grant trigger on table "public"."company_invitation" to "authenticated";

grant truncate on table "public"."company_invitation" to "authenticated";

grant update on table "public"."company_invitation" to "authenticated";

grant delete on table "public"."company_invitation" to "service_role";

grant insert on table "public"."company_invitation" to "service_role";

grant references on table "public"."company_invitation" to "service_role";

grant select on table "public"."company_invitation" to "service_role";

grant trigger on table "public"."company_invitation" to "service_role";

grant truncate on table "public"."company_invitation" to "service_role";

grant update on table "public"."company_invitation" to "service_role";

grant delete on table "public"."individual_draft_approvals" to "anon";

grant insert on table "public"."individual_draft_approvals" to "anon";

grant references on table "public"."individual_draft_approvals" to "anon";

grant select on table "public"."individual_draft_approvals" to "anon";

grant trigger on table "public"."individual_draft_approvals" to "anon";

grant truncate on table "public"."individual_draft_approvals" to "anon";

grant update on table "public"."individual_draft_approvals" to "anon";

grant delete on table "public"."individual_draft_approvals" to "authenticated";

grant insert on table "public"."individual_draft_approvals" to "authenticated";

grant references on table "public"."individual_draft_approvals" to "authenticated";

grant select on table "public"."individual_draft_approvals" to "authenticated";

grant trigger on table "public"."individual_draft_approvals" to "authenticated";

grant truncate on table "public"."individual_draft_approvals" to "authenticated";

grant update on table "public"."individual_draft_approvals" to "authenticated";

grant delete on table "public"."individual_draft_approvals" to "service_role";

grant insert on table "public"."individual_draft_approvals" to "service_role";

grant references on table "public"."individual_draft_approvals" to "service_role";

grant select on table "public"."individual_draft_approvals" to "service_role";

grant trigger on table "public"."individual_draft_approvals" to "service_role";

grant truncate on table "public"."individual_draft_approvals" to "service_role";

grant update on table "public"."individual_draft_approvals" to "service_role";

grant delete on table "public"."individual_drafts" to "anon";

grant insert on table "public"."individual_drafts" to "anon";

grant references on table "public"."individual_drafts" to "anon";

grant select on table "public"."individual_drafts" to "anon";

grant trigger on table "public"."individual_drafts" to "anon";

grant truncate on table "public"."individual_drafts" to "anon";

grant update on table "public"."individual_drafts" to "anon";

grant delete on table "public"."individual_drafts" to "authenticated";

grant insert on table "public"."individual_drafts" to "authenticated";

grant references on table "public"."individual_drafts" to "authenticated";

grant select on table "public"."individual_drafts" to "authenticated";

grant trigger on table "public"."individual_drafts" to "authenticated";

grant truncate on table "public"."individual_drafts" to "authenticated";

grant update on table "public"."individual_drafts" to "authenticated";

grant delete on table "public"."individual_drafts" to "service_role";

grant insert on table "public"."individual_drafts" to "service_role";

grant references on table "public"."individual_drafts" to "service_role";

grant select on table "public"."individual_drafts" to "service_role";

grant trigger on table "public"."individual_drafts" to "service_role";

grant truncate on table "public"."individual_drafts" to "service_role";

grant update on table "public"."individual_drafts" to "service_role";

grant delete on table "public"."sponsor_individuals" to "anon";

grant insert on table "public"."sponsor_individuals" to "anon";

grant references on table "public"."sponsor_individuals" to "anon";

grant select on table "public"."sponsor_individuals" to "anon";

grant trigger on table "public"."sponsor_individuals" to "anon";

grant truncate on table "public"."sponsor_individuals" to "anon";

grant update on table "public"."sponsor_individuals" to "anon";

grant delete on table "public"."sponsor_individuals" to "authenticated";

grant insert on table "public"."sponsor_individuals" to "authenticated";

grant references on table "public"."sponsor_individuals" to "authenticated";

grant select on table "public"."sponsor_individuals" to "authenticated";

grant trigger on table "public"."sponsor_individuals" to "authenticated";

grant truncate on table "public"."sponsor_individuals" to "authenticated";

grant update on table "public"."sponsor_individuals" to "authenticated";

grant delete on table "public"."sponsor_individuals" to "service_role";

grant insert on table "public"."sponsor_individuals" to "service_role";

grant references on table "public"."sponsor_individuals" to "service_role";

grant select on table "public"."sponsor_individuals" to "service_role";

grant trigger on table "public"."sponsor_individuals" to "service_role";

grant truncate on table "public"."sponsor_individuals" to "service_role";

grant update on table "public"."sponsor_individuals" to "service_role";

grant delete on table "public"."sponsor_lunch" to "anon";

grant insert on table "public"."sponsor_lunch" to "anon";

grant references on table "public"."sponsor_lunch" to "anon";

grant select on table "public"."sponsor_lunch" to "anon";

grant trigger on table "public"."sponsor_lunch" to "anon";

grant truncate on table "public"."sponsor_lunch" to "anon";

grant update on table "public"."sponsor_lunch" to "anon";

grant delete on table "public"."sponsor_lunch" to "authenticated";

grant insert on table "public"."sponsor_lunch" to "authenticated";

grant references on table "public"."sponsor_lunch" to "authenticated";

grant select on table "public"."sponsor_lunch" to "authenticated";

grant trigger on table "public"."sponsor_lunch" to "authenticated";

grant truncate on table "public"."sponsor_lunch" to "authenticated";

grant update on table "public"."sponsor_lunch" to "authenticated";

grant delete on table "public"."sponsor_lunch" to "service_role";

grant insert on table "public"."sponsor_lunch" to "service_role";

grant references on table "public"."sponsor_lunch" to "service_role";

grant select on table "public"."sponsor_lunch" to "service_role";

grant trigger on table "public"."sponsor_lunch" to "service_role";

grant truncate on table "public"."sponsor_lunch" to "service_role";

grant update on table "public"."sponsor_lunch" to "service_role";

grant delete on table "public"."sponsor_nameplate" to "anon";

grant insert on table "public"."sponsor_nameplate" to "anon";

grant references on table "public"."sponsor_nameplate" to "anon";

grant select on table "public"."sponsor_nameplate" to "anon";

grant trigger on table "public"."sponsor_nameplate" to "anon";

grant truncate on table "public"."sponsor_nameplate" to "anon";

grant update on table "public"."sponsor_nameplate" to "anon";

grant delete on table "public"."sponsor_nameplate" to "authenticated";

grant insert on table "public"."sponsor_nameplate" to "authenticated";

grant references on table "public"."sponsor_nameplate" to "authenticated";

grant select on table "public"."sponsor_nameplate" to "authenticated";

grant trigger on table "public"."sponsor_nameplate" to "authenticated";

grant truncate on table "public"."sponsor_nameplate" to "authenticated";

grant update on table "public"."sponsor_nameplate" to "authenticated";

grant delete on table "public"."sponsor_nameplate" to "service_role";

grant insert on table "public"."sponsor_nameplate" to "service_role";

grant references on table "public"."sponsor_nameplate" to "service_role";

grant select on table "public"."sponsor_nameplate" to "service_role";

grant trigger on table "public"."sponsor_nameplate" to "service_role";

grant truncate on table "public"."sponsor_nameplate" to "service_role";

grant update on table "public"."sponsor_nameplate" to "service_role";

grant delete on table "public"."sponsor_naming_rights" to "anon";

grant insert on table "public"."sponsor_naming_rights" to "anon";

grant references on table "public"."sponsor_naming_rights" to "anon";

grant select on table "public"."sponsor_naming_rights" to "anon";

grant trigger on table "public"."sponsor_naming_rights" to "anon";

grant truncate on table "public"."sponsor_naming_rights" to "anon";

grant update on table "public"."sponsor_naming_rights" to "anon";

grant delete on table "public"."sponsor_naming_rights" to "authenticated";

grant insert on table "public"."sponsor_naming_rights" to "authenticated";

grant references on table "public"."sponsor_naming_rights" to "authenticated";

grant select on table "public"."sponsor_naming_rights" to "authenticated";

grant trigger on table "public"."sponsor_naming_rights" to "authenticated";

grant truncate on table "public"."sponsor_naming_rights" to "authenticated";

grant update on table "public"."sponsor_naming_rights" to "authenticated";

grant delete on table "public"."sponsor_naming_rights" to "service_role";

grant insert on table "public"."sponsor_naming_rights" to "service_role";

grant references on table "public"."sponsor_naming_rights" to "service_role";

grant select on table "public"."sponsor_naming_rights" to "service_role";

grant trigger on table "public"."sponsor_naming_rights" to "service_role";

grant truncate on table "public"."sponsor_naming_rights" to "service_role";

grant update on table "public"."sponsor_naming_rights" to "service_role";

grant delete on table "public"."sponsor_scholarship" to "anon";

grant insert on table "public"."sponsor_scholarship" to "anon";

grant references on table "public"."sponsor_scholarship" to "anon";

grant select on table "public"."sponsor_scholarship" to "anon";

grant trigger on table "public"."sponsor_scholarship" to "anon";

grant truncate on table "public"."sponsor_scholarship" to "anon";

grant update on table "public"."sponsor_scholarship" to "anon";

grant delete on table "public"."sponsor_scholarship" to "authenticated";

grant insert on table "public"."sponsor_scholarship" to "authenticated";

grant references on table "public"."sponsor_scholarship" to "authenticated";

grant select on table "public"."sponsor_scholarship" to "authenticated";

grant trigger on table "public"."sponsor_scholarship" to "authenticated";

grant truncate on table "public"."sponsor_scholarship" to "authenticated";

grant update on table "public"."sponsor_scholarship" to "authenticated";

grant delete on table "public"."sponsor_scholarship" to "service_role";

grant insert on table "public"."sponsor_scholarship" to "service_role";

grant references on table "public"."sponsor_scholarship" to "service_role";

grant select on table "public"."sponsor_scholarship" to "service_role";

grant trigger on table "public"."sponsor_scholarship" to "service_role";

grant truncate on table "public"."sponsor_scholarship" to "service_role";

grant update on table "public"."sponsor_scholarship" to "service_role";


