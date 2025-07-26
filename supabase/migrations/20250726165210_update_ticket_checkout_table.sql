alter table "public"."ticket_checkout_sessions" drop constraint "ticket_checkout_sessions_user_id_ticket_type_id_status_key";

drop index if exists "public"."idx_ticket_checkout_sessions_stripe_payment_intent_id";

drop index if exists "public"."ticket_checkout_sessions_user_id_ticket_type_id_status_key";

alter table "public"."ticket_checkout_sessions" alter column "status" drop default;

alter type "public"."ticket_checkout_status" rename to "ticket_checkout_status__old_version_to_be_dropped";

create type "public"."ticket_checkout_status" as enum ('pending', 'completed', 'expired');

alter table "public"."ticket_checkout_sessions" alter column status type "public"."ticket_checkout_status" using status::text::"public"."ticket_checkout_status";

alter table "public"."ticket_checkout_sessions" alter column "status" set default 'pending'::ticket_checkout_status;

drop type "public"."ticket_checkout_status__old_version_to_be_dropped";

alter table "public"."ticket_checkout_options" drop column "option_value";

alter table "public"."ticket_checkout_sessions" drop column "stripe_payment_intent_id";

alter table "public"."ticket_checkout_sessions" drop column "total_amount";

alter table "public"."ticket_checkout_sessions" add column "stripe_checkout_url" text not null;

alter table "public"."ticket_checkout_sessions" alter column "expires_at" set default (now() + '00:10:00'::interval);

alter table "public"."ticket_checkout_sessions" alter column "stripe_checkout_session_id" set not null;

CREATE UNIQUE INDEX ticket_checkout_sessions_stripe_checkout_session_id_key ON public.ticket_checkout_sessions USING btree (stripe_checkout_session_id);

alter table "public"."ticket_checkout_sessions" add constraint "ticket_checkout_sessions_stripe_checkout_session_id_key" UNIQUE using index "ticket_checkout_sessions_stripe_checkout_session_id_key";


