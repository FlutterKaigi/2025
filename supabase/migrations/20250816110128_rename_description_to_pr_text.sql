alter table "public"."company_drafts" drop constraint "company_drafts_description_check";

alter table "public"."company_drafts" drop column "description";

alter table "public"."company_drafts" add column "pr_text" text not null;

alter table "public"."company_drafts" add constraint "company_drafts_pr_text_check" CHECK ((pr_text <> ''::text)) not valid;

alter table "public"."company_drafts" validate constraint "company_drafts_pr_text_check";


