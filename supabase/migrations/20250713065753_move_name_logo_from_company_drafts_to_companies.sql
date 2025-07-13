alter table "public"."company_drafts" drop constraint "company_drafts_name_check";

alter table "public"."companies" add column "logo_name" text;

alter table "public"."companies" add column "name" text not null;

alter table "public"."company_drafts" drop column "logo_name";

alter table "public"."company_drafts" drop column "name";

alter table "public"."companies" add constraint "companies_name_check" CHECK ((name <> ''::text)) not valid;

alter table "public"."companies" validate constraint "companies_name_check";


