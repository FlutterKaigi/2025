drop view if exists "public"."v_ticket_counts";

alter table "public"."ticket_types" add column "is_entry_allowed" boolean not null default true;

create or replace view "public"."v_ticket_counts" as  SELECT tt.id AS ticket_type_id,
    COALESCE(tp_counts.sold_count, 0) AS sold_count,
    COALESCE(tcs_counts.reserved_count, 0) AS reserved_count
   FROM ((ticket_types tt
     LEFT JOIN ( SELECT tp.ticket_type_id,
            (count(*))::integer AS sold_count
           FROM ticket_purchases tp
          GROUP BY tp.ticket_type_id) tp_counts ON ((tt.id = tp_counts.ticket_type_id)))
     LEFT JOIN ( SELECT tcs.ticket_type_id,
            (count(*))::integer AS reserved_count
           FROM ticket_checkout_sessions tcs
          WHERE ((tcs.status = 'pending'::ticket_checkout_status) AND (tcs.expires_at > now()))
          GROUP BY tcs.ticket_type_id) tcs_counts ON ((tt.id = tcs_counts.ticket_type_id)));



