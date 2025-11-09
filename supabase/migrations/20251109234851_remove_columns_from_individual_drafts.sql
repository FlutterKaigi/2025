alter table "public"."individual_drafts" drop constraint "individual_drafts_enthusiasm_check";

alter table "public"."individual_drafts" drop constraint "individual_drafts_name_check";

alter table "public"."individual_drafts" drop constraint "individual_drafts_slug_check";

alter table "public"."individual_drafts" drop constraint "individual_drafts_slug_key";

alter table "public"."individual_drafts" drop constraint "individual_drafts_x_account_check";

drop index if exists "public"."individual_drafts_slug_key";

alter table "public"."individual_drafts" drop column "enthusiasm";

alter table "public"."individual_drafts" drop column "name";

alter table "public"."individual_drafts" drop column "slug";

alter table "public"."individual_drafts" drop column "x_account";


