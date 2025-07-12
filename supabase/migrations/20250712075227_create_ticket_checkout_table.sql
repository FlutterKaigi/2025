create type "public"."ticket_checkout_status" as enum ('pending', 'completed');

create table "public"."ticket_checkout_options" (
    "id" uuid not null default uuid_generate_v7(),
    "checkout_session_id" uuid not null,
    "ticket_option_id" text not null,
    "option_value" text,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."ticket_checkout_options" enable row level security;

create table "public"."ticket_checkout_sessions" (
    "id" uuid not null default uuid_generate_v7(),
    "user_id" uuid not null,
    "ticket_type_id" text not null,
    "status" ticket_checkout_status not null default 'pending'::ticket_checkout_status,
    "stripe_payment_intent_id" text,
    "stripe_checkout_session_id" text,
    "total_amount" integer not null,
    "expires_at" timestamp with time zone not null default (now() + '00:30:00'::interval),
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);


alter table "public"."ticket_checkout_sessions" enable row level security;

CREATE INDEX idx_ticket_checkout_options_checkout_session_id ON public.ticket_checkout_options USING btree (checkout_session_id);

CREATE INDEX idx_ticket_checkout_sessions_expires_at ON public.ticket_checkout_sessions USING btree (expires_at);

CREATE INDEX idx_ticket_checkout_sessions_status ON public.ticket_checkout_sessions USING btree (status);

CREATE INDEX idx_ticket_checkout_sessions_stripe_payment_intent_id ON public.ticket_checkout_sessions USING btree (stripe_payment_intent_id);

CREATE INDEX idx_ticket_checkout_sessions_user_id ON public.ticket_checkout_sessions USING btree (user_id);

CREATE UNIQUE INDEX ticket_checkout_options_checkout_session_id_ticket_option_i_key ON public.ticket_checkout_options USING btree (checkout_session_id, ticket_option_id);

CREATE UNIQUE INDEX ticket_checkout_options_pkey ON public.ticket_checkout_options USING btree (id);

CREATE UNIQUE INDEX ticket_checkout_sessions_pkey ON public.ticket_checkout_sessions USING btree (id);

CREATE UNIQUE INDEX ticket_checkout_sessions_user_id_ticket_type_id_status_key ON public.ticket_checkout_sessions USING btree (user_id, ticket_type_id, status);

alter table "public"."ticket_checkout_options" add constraint "ticket_checkout_options_pkey" PRIMARY KEY using index "ticket_checkout_options_pkey";

alter table "public"."ticket_checkout_sessions" add constraint "ticket_checkout_sessions_pkey" PRIMARY KEY using index "ticket_checkout_sessions_pkey";

alter table "public"."ticket_checkout_options" add constraint "ticket_checkout_options_checkout_session_id_fkey" FOREIGN KEY (checkout_session_id) REFERENCES ticket_checkout_sessions(id) ON DELETE CASCADE not valid;

alter table "public"."ticket_checkout_options" validate constraint "ticket_checkout_options_checkout_session_id_fkey";

alter table "public"."ticket_checkout_options" add constraint "ticket_checkout_options_checkout_session_id_ticket_option_i_key" UNIQUE using index "ticket_checkout_options_checkout_session_id_ticket_option_i_key";

alter table "public"."ticket_checkout_options" add constraint "ticket_checkout_options_ticket_option_id_fkey" FOREIGN KEY (ticket_option_id) REFERENCES ticket_options(id) ON DELETE CASCADE not valid;

alter table "public"."ticket_checkout_options" validate constraint "ticket_checkout_options_ticket_option_id_fkey";

alter table "public"."ticket_checkout_sessions" add constraint "ticket_checkout_sessions_ticket_type_id_fkey" FOREIGN KEY (ticket_type_id) REFERENCES ticket_types(id) ON DELETE CASCADE not valid;

alter table "public"."ticket_checkout_sessions" validate constraint "ticket_checkout_sessions_ticket_type_id_fkey";

alter table "public"."ticket_checkout_sessions" add constraint "ticket_checkout_sessions_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE not valid;

alter table "public"."ticket_checkout_sessions" validate constraint "ticket_checkout_sessions_user_id_fkey";

alter table "public"."ticket_checkout_sessions" add constraint "ticket_checkout_sessions_user_id_ticket_type_id_status_key" UNIQUE using index "ticket_checkout_sessions_user_id_ticket_type_id_status_key" DEFERRABLE INITIALLY DEFERRED;

grant delete on table "public"."ticket_checkout_options" to "anon";

grant insert on table "public"."ticket_checkout_options" to "anon";

grant references on table "public"."ticket_checkout_options" to "anon";

grant select on table "public"."ticket_checkout_options" to "anon";

grant trigger on table "public"."ticket_checkout_options" to "anon";

grant truncate on table "public"."ticket_checkout_options" to "anon";

grant update on table "public"."ticket_checkout_options" to "anon";

grant delete on table "public"."ticket_checkout_options" to "authenticated";

grant insert on table "public"."ticket_checkout_options" to "authenticated";

grant references on table "public"."ticket_checkout_options" to "authenticated";

grant select on table "public"."ticket_checkout_options" to "authenticated";

grant trigger on table "public"."ticket_checkout_options" to "authenticated";

grant truncate on table "public"."ticket_checkout_options" to "authenticated";

grant update on table "public"."ticket_checkout_options" to "authenticated";

grant delete on table "public"."ticket_checkout_options" to "service_role";

grant insert on table "public"."ticket_checkout_options" to "service_role";

grant references on table "public"."ticket_checkout_options" to "service_role";

grant select on table "public"."ticket_checkout_options" to "service_role";

grant trigger on table "public"."ticket_checkout_options" to "service_role";

grant truncate on table "public"."ticket_checkout_options" to "service_role";

grant update on table "public"."ticket_checkout_options" to "service_role";

grant delete on table "public"."ticket_checkout_sessions" to "anon";

grant insert on table "public"."ticket_checkout_sessions" to "anon";

grant references on table "public"."ticket_checkout_sessions" to "anon";

grant select on table "public"."ticket_checkout_sessions" to "anon";

grant trigger on table "public"."ticket_checkout_sessions" to "anon";

grant truncate on table "public"."ticket_checkout_sessions" to "anon";

grant update on table "public"."ticket_checkout_sessions" to "anon";

grant delete on table "public"."ticket_checkout_sessions" to "authenticated";

grant insert on table "public"."ticket_checkout_sessions" to "authenticated";

grant references on table "public"."ticket_checkout_sessions" to "authenticated";

grant select on table "public"."ticket_checkout_sessions" to "authenticated";

grant trigger on table "public"."ticket_checkout_sessions" to "authenticated";

grant truncate on table "public"."ticket_checkout_sessions" to "authenticated";

grant update on table "public"."ticket_checkout_sessions" to "authenticated";

grant delete on table "public"."ticket_checkout_sessions" to "service_role";

grant insert on table "public"."ticket_checkout_sessions" to "service_role";

grant references on table "public"."ticket_checkout_sessions" to "service_role";

grant select on table "public"."ticket_checkout_sessions" to "service_role";

grant trigger on table "public"."ticket_checkout_sessions" to "service_role";

grant truncate on table "public"."ticket_checkout_sessions" to "service_role";

grant update on table "public"."ticket_checkout_sessions" to "service_role";


