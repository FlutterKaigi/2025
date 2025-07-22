alter table "public"."companies" alter column "logo_name" set not null;

alter table "public"."companies" add constraint "companies_logo_name_check" CHECK ((logo_name <> ''::text)) not valid;

alter table "public"."companies" validate constraint "companies_logo_name_check";


