alter table "public"."ticket_types" drop column "url";

alter table "public"."ticket_types" add column "stripe_price_id" text not null;


