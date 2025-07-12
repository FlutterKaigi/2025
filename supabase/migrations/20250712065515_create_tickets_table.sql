create type "public"."ticket_purchase_status" as enum ('completed', 'refunded');

create table "public"."stripe_webhook_logs" (
    "id" integer generated always as identity not null,
    "stripe_event_id" text not null,
    "event_type" text not null,
    "payment_intent_id" text,
    "processed" boolean default false,
    "error_message" text,
    "raw_data" jsonb not null,
    "created_at" timestamp without time zone not null default now()
);


alter table "public"."stripe_webhook_logs" enable row level security;

create table "public"."ticket_options" (
    "id" text not null,
    "ticket_type_id" text not null,
    "name" text not null,
    "description" text,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."ticket_options" enable row level security;

create table "public"."ticket_purchase_options" (
    "id" uuid not null default uuid_generate_v7(),
    "ticket_purchase_id" uuid not null,
    "ticket_option_id" text not null,
    "option_value" text,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."ticket_purchase_options" enable row level security;

create table "public"."ticket_purchases" (
    "id" uuid not null default uuid_generate_v7(),
    "user_id" uuid not null,
    "ticket_type_id" text not null,
    "status" ticket_purchase_status not null default 'completed'::ticket_purchase_status,
    "stripe_payment_intent_id" text,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."ticket_purchases" enable row level security;

create table "public"."ticket_types" (
    "id" text not null,
    "name" text not null,
    "price" integer not null,
    "max_quantity" integer,
    "description" text,
    "is_active" boolean default true,
    "sale_starts_at" timestamp with time zone,
    "sale_ends_at" timestamp with time zone,
    "url" text,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."ticket_types" enable row level security;

CREATE INDEX idx_stripe_webhook_logs_processed ON public.stripe_webhook_logs USING btree (processed);

CREATE INDEX idx_stripe_webhook_logs_stripe_event_id ON public.stripe_webhook_logs USING btree (stripe_event_id);

CREATE INDEX idx_ticket_purchase_options_ticket_purchase_id ON public.ticket_purchase_options USING btree (ticket_purchase_id);

CREATE INDEX idx_ticket_purchases_status ON public.ticket_purchases USING btree (status);

CREATE INDEX idx_ticket_purchases_stripe_payment_intent_id ON public.ticket_purchases USING btree (stripe_payment_intent_id);

CREATE INDEX idx_ticket_purchases_ticket_type_id ON public.ticket_purchases USING btree (ticket_type_id);

CREATE INDEX idx_ticket_purchases_user_id ON public.ticket_purchases USING btree (user_id);

CREATE UNIQUE INDEX stripe_webhook_logs_pkey ON public.stripe_webhook_logs USING btree (id);

CREATE UNIQUE INDEX stripe_webhook_logs_stripe_event_id_key ON public.stripe_webhook_logs USING btree (stripe_event_id);

CREATE UNIQUE INDEX ticket_options_pkey ON public.ticket_options USING btree (id);

CREATE UNIQUE INDEX ticket_purchase_options_pkey ON public.ticket_purchase_options USING btree (id);

CREATE UNIQUE INDEX ticket_purchase_options_ticket_purchase_id_ticket_option_id_key ON public.ticket_purchase_options USING btree (ticket_purchase_id, ticket_option_id);

CREATE UNIQUE INDEX ticket_purchases_pkey ON public.ticket_purchases USING btree (id);

CREATE UNIQUE INDEX ticket_purchases_user_id_ticket_type_id_key ON public.ticket_purchases USING btree (user_id, ticket_type_id);

CREATE UNIQUE INDEX ticket_types_name_key ON public.ticket_types USING btree (name);

CREATE UNIQUE INDEX ticket_types_pkey ON public.ticket_types USING btree (id);

alter table "public"."stripe_webhook_logs" add constraint "stripe_webhook_logs_pkey" PRIMARY KEY using index "stripe_webhook_logs_pkey";

alter table "public"."ticket_options" add constraint "ticket_options_pkey" PRIMARY KEY using index "ticket_options_pkey";

alter table "public"."ticket_purchase_options" add constraint "ticket_purchase_options_pkey" PRIMARY KEY using index "ticket_purchase_options_pkey";

alter table "public"."ticket_purchases" add constraint "ticket_purchases_pkey" PRIMARY KEY using index "ticket_purchases_pkey";

alter table "public"."ticket_types" add constraint "ticket_types_pkey" PRIMARY KEY using index "ticket_types_pkey";

alter table "public"."stripe_webhook_logs" add constraint "stripe_webhook_logs_stripe_event_id_key" UNIQUE using index "stripe_webhook_logs_stripe_event_id_key";

alter table "public"."ticket_options" add constraint "ticket_options_ticket_type_id_fkey" FOREIGN KEY (ticket_type_id) REFERENCES ticket_types(id) ON DELETE CASCADE not valid;

alter table "public"."ticket_options" validate constraint "ticket_options_ticket_type_id_fkey";

alter table "public"."ticket_purchase_options" add constraint "ticket_purchase_options_ticket_option_id_fkey" FOREIGN KEY (ticket_option_id) REFERENCES ticket_options(id) ON DELETE CASCADE not valid;

alter table "public"."ticket_purchase_options" validate constraint "ticket_purchase_options_ticket_option_id_fkey";

alter table "public"."ticket_purchase_options" add constraint "ticket_purchase_options_ticket_purchase_id_fkey" FOREIGN KEY (ticket_purchase_id) REFERENCES ticket_purchases(id) ON DELETE CASCADE not valid;

alter table "public"."ticket_purchase_options" validate constraint "ticket_purchase_options_ticket_purchase_id_fkey";

alter table "public"."ticket_purchase_options" add constraint "ticket_purchase_options_ticket_purchase_id_ticket_option_id_key" UNIQUE using index "ticket_purchase_options_ticket_purchase_id_ticket_option_id_key";

alter table "public"."ticket_purchases" add constraint "ticket_purchases_ticket_type_id_fkey" FOREIGN KEY (ticket_type_id) REFERENCES ticket_types(id) ON DELETE CASCADE not valid;

alter table "public"."ticket_purchases" validate constraint "ticket_purchases_ticket_type_id_fkey";

alter table "public"."ticket_purchases" add constraint "ticket_purchases_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE not valid;

alter table "public"."ticket_purchases" validate constraint "ticket_purchases_user_id_fkey";

alter table "public"."ticket_purchases" add constraint "ticket_purchases_user_id_ticket_type_id_key" UNIQUE using index "ticket_purchases_user_id_ticket_type_id_key";

alter table "public"."ticket_types" add constraint "ticket_types_name_key" UNIQUE using index "ticket_types_name_key";

grant delete on table "public"."stripe_webhook_logs" to "anon";

grant insert on table "public"."stripe_webhook_logs" to "anon";

grant references on table "public"."stripe_webhook_logs" to "anon";

grant select on table "public"."stripe_webhook_logs" to "anon";

grant trigger on table "public"."stripe_webhook_logs" to "anon";

grant truncate on table "public"."stripe_webhook_logs" to "anon";

grant update on table "public"."stripe_webhook_logs" to "anon";

grant delete on table "public"."stripe_webhook_logs" to "authenticated";

grant insert on table "public"."stripe_webhook_logs" to "authenticated";

grant references on table "public"."stripe_webhook_logs" to "authenticated";

grant select on table "public"."stripe_webhook_logs" to "authenticated";

grant trigger on table "public"."stripe_webhook_logs" to "authenticated";

grant truncate on table "public"."stripe_webhook_logs" to "authenticated";

grant update on table "public"."stripe_webhook_logs" to "authenticated";

grant delete on table "public"."stripe_webhook_logs" to "service_role";

grant insert on table "public"."stripe_webhook_logs" to "service_role";

grant references on table "public"."stripe_webhook_logs" to "service_role";

grant select on table "public"."stripe_webhook_logs" to "service_role";

grant trigger on table "public"."stripe_webhook_logs" to "service_role";

grant truncate on table "public"."stripe_webhook_logs" to "service_role";

grant update on table "public"."stripe_webhook_logs" to "service_role";

grant delete on table "public"."ticket_options" to "anon";

grant insert on table "public"."ticket_options" to "anon";

grant references on table "public"."ticket_options" to "anon";

grant select on table "public"."ticket_options" to "anon";

grant trigger on table "public"."ticket_options" to "anon";

grant truncate on table "public"."ticket_options" to "anon";

grant update on table "public"."ticket_options" to "anon";

grant delete on table "public"."ticket_options" to "authenticated";

grant insert on table "public"."ticket_options" to "authenticated";

grant references on table "public"."ticket_options" to "authenticated";

grant select on table "public"."ticket_options" to "authenticated";

grant trigger on table "public"."ticket_options" to "authenticated";

grant truncate on table "public"."ticket_options" to "authenticated";

grant update on table "public"."ticket_options" to "authenticated";

grant delete on table "public"."ticket_options" to "service_role";

grant insert on table "public"."ticket_options" to "service_role";

grant references on table "public"."ticket_options" to "service_role";

grant select on table "public"."ticket_options" to "service_role";

grant trigger on table "public"."ticket_options" to "service_role";

grant truncate on table "public"."ticket_options" to "service_role";

grant update on table "public"."ticket_options" to "service_role";

grant delete on table "public"."ticket_purchase_options" to "anon";

grant insert on table "public"."ticket_purchase_options" to "anon";

grant references on table "public"."ticket_purchase_options" to "anon";

grant select on table "public"."ticket_purchase_options" to "anon";

grant trigger on table "public"."ticket_purchase_options" to "anon";

grant truncate on table "public"."ticket_purchase_options" to "anon";

grant update on table "public"."ticket_purchase_options" to "anon";

grant delete on table "public"."ticket_purchase_options" to "authenticated";

grant insert on table "public"."ticket_purchase_options" to "authenticated";

grant references on table "public"."ticket_purchase_options" to "authenticated";

grant select on table "public"."ticket_purchase_options" to "authenticated";

grant trigger on table "public"."ticket_purchase_options" to "authenticated";

grant truncate on table "public"."ticket_purchase_options" to "authenticated";

grant update on table "public"."ticket_purchase_options" to "authenticated";

grant delete on table "public"."ticket_purchase_options" to "service_role";

grant insert on table "public"."ticket_purchase_options" to "service_role";

grant references on table "public"."ticket_purchase_options" to "service_role";

grant select on table "public"."ticket_purchase_options" to "service_role";

grant trigger on table "public"."ticket_purchase_options" to "service_role";

grant truncate on table "public"."ticket_purchase_options" to "service_role";

grant update on table "public"."ticket_purchase_options" to "service_role";

grant delete on table "public"."ticket_purchases" to "anon";

grant insert on table "public"."ticket_purchases" to "anon";

grant references on table "public"."ticket_purchases" to "anon";

grant select on table "public"."ticket_purchases" to "anon";

grant trigger on table "public"."ticket_purchases" to "anon";

grant truncate on table "public"."ticket_purchases" to "anon";

grant update on table "public"."ticket_purchases" to "anon";

grant delete on table "public"."ticket_purchases" to "authenticated";

grant insert on table "public"."ticket_purchases" to "authenticated";

grant references on table "public"."ticket_purchases" to "authenticated";

grant select on table "public"."ticket_purchases" to "authenticated";

grant trigger on table "public"."ticket_purchases" to "authenticated";

grant truncate on table "public"."ticket_purchases" to "authenticated";

grant update on table "public"."ticket_purchases" to "authenticated";

grant delete on table "public"."ticket_purchases" to "service_role";

grant insert on table "public"."ticket_purchases" to "service_role";

grant references on table "public"."ticket_purchases" to "service_role";

grant select on table "public"."ticket_purchases" to "service_role";

grant trigger on table "public"."ticket_purchases" to "service_role";

grant truncate on table "public"."ticket_purchases" to "service_role";

grant update on table "public"."ticket_purchases" to "service_role";

grant delete on table "public"."ticket_types" to "anon";

grant insert on table "public"."ticket_types" to "anon";

grant references on table "public"."ticket_types" to "anon";

grant select on table "public"."ticket_types" to "anon";

grant trigger on table "public"."ticket_types" to "anon";

grant truncate on table "public"."ticket_types" to "anon";

grant update on table "public"."ticket_types" to "anon";

grant delete on table "public"."ticket_types" to "authenticated";

grant insert on table "public"."ticket_types" to "authenticated";

grant references on table "public"."ticket_types" to "authenticated";

grant select on table "public"."ticket_types" to "authenticated";

grant trigger on table "public"."ticket_types" to "authenticated";

grant truncate on table "public"."ticket_types" to "authenticated";

grant update on table "public"."ticket_types" to "authenticated";

grant delete on table "public"."ticket_types" to "service_role";

grant insert on table "public"."ticket_types" to "service_role";

grant references on table "public"."ticket_types" to "service_role";

grant select on table "public"."ticket_types" to "service_role";

grant trigger on table "public"."ticket_types" to "service_role";

grant truncate on table "public"."ticket_types" to "service_role";

grant update on table "public"."ticket_types" to "service_role";


