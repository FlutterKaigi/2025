alter table "public"."individual_drafts" add column "enthusiasm" text;

alter table "public"."individual_drafts" add column "x_account" text;

alter table "public"."individual_drafts" add constraint "individual_drafts_enthusiasm_check" CHECK ((enthusiasm <> ''::text)) not valid;

alter table "public"."individual_drafts" validate constraint "individual_drafts_enthusiasm_check";

alter table "public"."individual_drafts" add constraint "individual_drafts_x_account_check" CHECK ((x_account <> ''::text)) not valid;

alter table "public"."individual_drafts" validate constraint "individual_drafts_x_account_check";


