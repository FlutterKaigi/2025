alter type "public"."company_sponsor_type" rename to "company_sponsor_type__old_version_to_be_dropped";

create type "public"."company_sponsor_type" as enum ('basic', 'community', 'tool', 'none');

alter table "public"."sponsor_companies" alter column sponsor_type type "public"."company_sponsor_type" using sponsor_type::text::"public"."company_sponsor_type";

drop type "public"."company_sponsor_type__old_version_to_be_dropped";


