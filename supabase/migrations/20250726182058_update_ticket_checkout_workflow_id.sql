alter table "public"."ticket_checkout_sessions" add column "ticket_checkout_workflow_id" text;

CREATE UNIQUE INDEX ticket_purchases_stripe_payment_intent_id_key ON public.ticket_purchases USING btree (stripe_payment_intent_id);

alter table "public"."ticket_purchases" add constraint "ticket_purchases_stripe_payment_intent_id_key" UNIQUE using index "ticket_purchases_stripe_payment_intent_id_key";


