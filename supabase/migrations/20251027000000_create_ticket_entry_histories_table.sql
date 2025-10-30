-- Create ticket_entry_histories table
-- This table stores entry history for each ticket purchase (1-to-1 relationship)
create table "public"."ticket_entry_histories" (
    "id" uuid not null,
    "entered_at" timestamp without time zone not null default now(),
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);

alter table "public"."ticket_entry_histories" enable row level security;

-- Create primary key
CREATE UNIQUE INDEX ticket_entry_histories_pkey ON public.ticket_entry_histories USING btree (id);

alter table "public"."ticket_entry_histories" add constraint "ticket_entry_histories_pkey" PRIMARY KEY using index "ticket_entry_histories_pkey";

-- Create foreign key constraint to ticket_purchases
alter table "public"."ticket_entry_histories" add constraint "ticket_entry_histories_id_fkey" FOREIGN KEY (id) REFERENCES ticket_purchases(id) ON DELETE CASCADE not valid;

alter table "public"."ticket_entry_histories" validate constraint "ticket_entry_histories_id_fkey";

-- Grant permissions
grant delete on table "public"."ticket_entry_histories" to "anon";
grant insert on table "public"."ticket_entry_histories" to "anon";
grant references on table "public"."ticket_entry_histories" to "anon";
grant select on table "public"."ticket_entry_histories" to "anon";
grant trigger on table "public"."ticket_entry_histories" to "anon";
grant truncate on table "public"."ticket_entry_histories" to "anon";
grant update on table "public"."ticket_entry_histories" to "anon";

grant delete on table "public"."ticket_entry_histories" to "authenticated";
grant insert on table "public"."ticket_entry_histories" to "authenticated";
grant references on table "public"."ticket_entry_histories" to "authenticated";
grant select on table "public"."ticket_entry_histories" to "authenticated";
grant trigger on table "public"."ticket_entry_histories" to "authenticated";
grant truncate on table "public"."ticket_entry_histories" to "authenticated";
grant update on table "public"."ticket_entry_histories" to "authenticated";

grant delete on table "public"."ticket_entry_histories" to "service_role";
grant insert on table "public"."ticket_entry_histories" to "service_role";
grant references on table "public"."ticket_entry_histories" to "service_role";
grant select on table "public"."ticket_entry_histories" to "service_role";
grant trigger on table "public"."ticket_entry_histories" to "service_role";
grant truncate on table "public"."ticket_entry_histories" to "service_role";
grant update on table "public"."ticket_entry_histories" to "service_role";
