alter table "public"."company_drafts" drop constraint "company_drafts_name_en_check";

alter table "public"."individual_drafts" drop constraint "individual_drafts_name_en_check";

alter table "public"."company_drafts" drop column "name_en";

alter table "public"."company_drafts" add column "slug" text not null;

alter table "public"."individual_drafts" drop column "name_en";

alter table "public"."individual_drafts" add column "slug" text not null;

CREATE UNIQUE INDEX company_drafts_slug_key ON public.company_drafts USING btree (slug);

CREATE UNIQUE INDEX individual_drafts_slug_key ON public.individual_drafts USING btree (slug);

alter table "public"."company_drafts" add constraint "company_drafts_slug_check" CHECK ((slug <> ''::text)) not valid;

alter table "public"."company_drafts" validate constraint "company_drafts_slug_check";

alter table "public"."company_drafts" add constraint "company_drafts_slug_key" UNIQUE using index "company_drafts_slug_key";

alter table "public"."individual_drafts" add constraint "individual_drafts_slug_check" CHECK ((slug <> ''::text)) not valid;

alter table "public"."individual_drafts" validate constraint "individual_drafts_slug_check";

alter table "public"."individual_drafts" add constraint "individual_drafts_slug_key" UNIQUE using index "individual_drafts_slug_key";


