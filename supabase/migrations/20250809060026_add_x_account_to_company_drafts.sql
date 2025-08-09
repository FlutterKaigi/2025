alter table "public"."company_drafts" add column "x_account" text;

alter table "public"."company_drafts" add constraint "company_drafts_x_account_check" CHECK ((x_account <> ''::text)) not valid;

alter table "public"."company_drafts" validate constraint "company_drafts_x_account_check";


