alter table "public"."individual_drafts" drop constraint "individual_drafts_enthusiasm_check";

alter table "public"."individual_drafts" drop constraint "individual_drafts_name_check";

alter table "public"."individual_drafts" drop constraint "individual_drafts_slug_check";

alter table "public"."individual_drafts" drop constraint "individual_drafts_slug_key";

alter table "public"."individual_drafts" drop constraint "individual_drafts_x_account_check";

drop view if exists "public"."session_venues_with_sessions";

drop view if exists "public"."sponsor_with_sessions";

drop view if exists "public"."v_ticket_counts";

drop view if exists "public"."v_ticket_option_counts";

drop index if exists "public"."individual_drafts_slug_key";

alter table "public"."individual_drafts" drop column "enthusiasm";

alter table "public"."individual_drafts" drop column "name";

alter table "public"."individual_drafts" drop column "slug";

alter table "public"."individual_drafts" drop column "x_account";

create or replace view "public"."session_venues_with_sessions" as  SELECT sv.id,
    sv.name,
    COALESCE(( SELECT json_agg(json_build_object('id', s.id, 'title', s.title, 'description', s.description, 'starts_at', s.starts_at, 'ends_at', s.ends_at, 'is_lightning_talk', s.is_lightning_talk, 'is_beginners_lightning_talk', s.is_beginners_lightning_talk, 'is_hands_on', s.is_hands_on, 'video_url', s.video_url, 'url', s.url, 'speakers', COALESCE(( SELECT json_agg(json_build_object('id', sp.id, 'name', sp.name, 'avatar_url', sp.avatar_url, 'x_id', sp.x_id)) AS json_agg
                   FROM (public.session_speakers ss
                     JOIN public.speakers sp ON ((ss.speaker_id = sp.id)))
                  WHERE (ss.session_id = s.id)), '[]'::json), 'sponsor',
                CASE
                    WHEN (s.sponsor_id IS NOT NULL) THEN ( SELECT json_build_object('id', c.id, 'name', c.name, 'logo_url', c.logo_name, 'slug', cd.slug, 'pr_text', cd.pr_text, 'website_url', cd.website_url, 'sponsor_type', sc.sponsor_type, 'display_order', sc.display_order, 'basic_plan_type', bsc.basic_plan_type, 'option_plan_types', COALESCE(array_agg((sco.option_plan_type)::text) FILTER (WHERE (sco.option_plan_type IS NOT NULL)), ARRAY[]::text[])) AS json_build_object
                       FROM (((((public.companies c
                         JOIN public.sponsor_companies sc ON ((c.id = sc.company_id)))
                         LEFT JOIN public.basic_sponsor_companies bsc ON ((sc.id = bsc.sponsor_company_id)))
                         LEFT JOIN public.company_drafts cd ON ((c.id = cd.company_id)))
                         LEFT JOIN public.company_draft_approvals cda ON ((cd.id = cda.company_draft_id)))
                         LEFT JOIN public.sponsor_company_options sco ON ((sc.id = sco.sponsor_company_id)))
                      WHERE (sc.id = s.sponsor_id)
                      GROUP BY c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url, sc.sponsor_type, sc.display_order, bsc.basic_plan_type)
                    ELSE NULL::json
                END) ORDER BY s.starts_at) AS json_agg
           FROM public.sessions s
          WHERE (s.venue_id = sv.id)), '[]'::json) AS sessions
   FROM public.session_venues sv
  ORDER BY sv.name;


create or replace view "public"."sponsor_with_sessions" as  SELECT json_build_object('id', c.id, 'name', c.name, 'logo_url', c.logo_name, 'slug', cd.slug, 'pr_text', cd.pr_text, 'website_url', cd.website_url, 'sponsor_type', sc.sponsor_type, 'display_order', sc.display_order, 'basic_plan_type', bsc.basic_plan_type, 'option_plan_types', COALESCE(array_agg(DISTINCT (sco.option_plan_type)::text) FILTER (WHERE (sco.option_plan_type IS NOT NULL)), ARRAY[]::text[])) AS sponsor,
    COALESCE(( SELECT json_agg(json_build_object('id', s.id, 'title', s.title, 'description', s.description, 'starts_at', s.starts_at, 'ends_at', s.ends_at, 'is_lightning_talk', s.is_lightning_talk, 'is_beginners_lightning_talk', s.is_beginners_lightning_talk, 'is_hands_on', s.is_hands_on, 'video_url', s.video_url, 'url', s.url, 'venue', json_build_object('id', sv.id, 'name', sv.name), 'speakers', COALESCE(( SELECT json_agg(json_build_object('id', sp.id, 'name', sp.name, 'avatar_url', sp.avatar_url, 'x_id', sp.x_id)) AS json_agg
                   FROM (public.session_speakers ss
                     JOIN public.speakers sp ON ((ss.speaker_id = sp.id)))
                  WHERE (ss.session_id = s.id)), '[]'::json)) ORDER BY s.starts_at) AS json_agg
           FROM (public.sessions s
             JOIN public.session_venues sv ON ((s.venue_id = sv.id)))
          WHERE (s.sponsor_id = sc.id)), '[]'::json) AS sessions
   FROM (((((public.sponsor_companies sc
     JOIN public.companies c ON ((sc.company_id = c.id)))
     LEFT JOIN public.basic_sponsor_companies bsc ON ((sc.id = bsc.sponsor_company_id)))
     LEFT JOIN public.company_drafts cd ON ((c.id = cd.company_id)))
     LEFT JOIN public.company_draft_approvals cda ON ((cd.id = cda.company_draft_id)))
     LEFT JOIN public.sponsor_company_options sco ON ((sc.id = sco.sponsor_company_id)))
  WHERE (cda.id IS NOT NULL)
  GROUP BY c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url, sc.sponsor_type, sc.display_order, bsc.basic_plan_type, sc.id
 HAVING (EXISTS ( SELECT 1
           FROM public.sessions s
          WHERE (s.sponsor_id = sc.id)))
  ORDER BY sc.display_order;


create or replace view "public"."v_ticket_counts" as  SELECT tt.id AS ticket_type_id,
    COALESCE(tp_counts.sold_count, 0) AS sold_count,
    COALESCE(tcs_counts.reserved_count, 0) AS reserved_count
   FROM ((public.ticket_types tt
     LEFT JOIN ( SELECT tp.ticket_type_id,
            (count(*))::integer AS sold_count
           FROM public.ticket_purchases tp
          GROUP BY tp.ticket_type_id) tp_counts ON ((tt.id = tp_counts.ticket_type_id)))
     LEFT JOIN ( SELECT tcs.ticket_type_id,
            (count(*))::integer AS reserved_count
           FROM public.ticket_checkout_sessions tcs
          WHERE ((tcs.status = 'pending'::public.ticket_checkout_status) AND (tcs.expires_at > now()))
          GROUP BY tcs.ticket_type_id) tcs_counts ON ((tt.id = tcs_counts.ticket_type_id)));


create or replace view "public"."v_ticket_option_counts" as  SELECT topt.id AS ticket_option_id,
    topt.ticket_type_id,
    COALESCE(tpo_counts.sold_count, 0) AS sold_count,
    COALESCE(tco_counts.reserved_count, 0) AS reserved_count
   FROM ((public.ticket_options topt
     LEFT JOIN ( SELECT tpo.ticket_option_id,
            (count(*))::integer AS sold_count
           FROM (public.ticket_purchase_options tpo
             JOIN public.ticket_purchases tp ON ((tpo.ticket_purchase_id = tp.id)))
          GROUP BY tpo.ticket_option_id) tpo_counts ON ((topt.id = tpo_counts.ticket_option_id)))
     LEFT JOIN ( SELECT tco.ticket_option_id,
            (count(*))::integer AS reserved_count
           FROM (public.ticket_checkout_options tco
             JOIN public.ticket_checkout_sessions tcs ON ((tco.checkout_session_id = tcs.id)))
          WHERE ((tcs.status = 'pending'::public.ticket_checkout_status) AND (tcs.expires_at > now()))
          GROUP BY tco.ticket_option_id) tco_counts ON ((topt.id = tco_counts.ticket_option_id)));



