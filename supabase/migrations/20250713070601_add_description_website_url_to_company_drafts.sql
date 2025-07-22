alter table "public"."company_drafts" add column "description" text not null;

alter table "public"."company_drafts" add column "website_url" text not null;

alter table "public"."company_drafts" add constraint "company_drafts_description_check" CHECK ((description <> ''::text)) not valid;

alter table "public"."company_drafts" validate constraint "company_drafts_description_check";

alter table "public"."company_drafts" add constraint "company_drafts_website_url_check" CHECK ((website_url <> ''::text)) not valid;

alter table "public"."company_drafts" validate constraint "company_drafts_website_url_check";


