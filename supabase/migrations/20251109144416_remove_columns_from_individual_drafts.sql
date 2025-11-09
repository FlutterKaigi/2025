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

drop index if exists "public"."session_venues_display_order_idx";

alter table "public"."individual_drafts" drop column "enthusiasm";

alter table "public"."individual_drafts" drop column "name";

alter table "public"."individual_drafts" drop column "slug";

alter table "public"."individual_drafts" drop column "x_account";

alter table "public"."session_venues" drop column "display_order";

alter table "public"."ticket_purchases" alter column "nameplate_id" set data type character varying(4) using "nameplate_id"::character varying(4);

alter table "public"."timeline_events" drop column "url";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.check_option_plan_availability(p_basic_plan_type basic_plan_type, p_option_plan_type option_plan_type)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
BEGIN
  -- スカラシップは全プラン利用可能
  IF p_option_plan_type = 'scholarship' THEN
    RETURN TRUE;
  END IF;
  
  -- ネーミングライツ（ホール）：silver以上限定
  IF p_option_plan_type = 'naming_rights_hall' THEN
    RETURN p_basic_plan_type IN ('platinum', 'gold', 'silver');
  END IF;
  
  -- ネーミングライツ（ルーム）：silver以上限定
  IF p_option_plan_type = 'naming_rights_room' THEN
    RETURN p_basic_plan_type IN ('platinum', 'gold', 'silver');
  END IF;
  
  -- ネームプレート：ブロンズ以上限定
  IF p_option_plan_type = 'nameplate' THEN
    RETURN p_basic_plan_type IN ('platinum', 'gold', 'silver', 'bronze');
  END IF;
  
  -- 弁当：シルバー・ブロンズ限定
  IF p_option_plan_type = 'lunch' THEN
    RETURN p_basic_plan_type IN ('silver', 'bronze');
  END IF;
  
  RETURN FALSE;
END;
$function$
;

create or replace view "public"."session_venues_with_sessions" as  SELECT sv.id,
    sv.name,
    COALESCE(( SELECT json_agg(json_build_object('id', s.id, 'title', s.title, 'description', s.description, 'starts_at', s.starts_at, 'ends_at', s.ends_at, 'is_lightning_talk', s.is_lightning_talk, 'is_beginners_lightning_talk', s.is_beginners_lightning_talk, 'is_hands_on', s.is_hands_on, 'video_url', s.video_url, 'url', s.url, 'speakers', COALESCE(( SELECT json_agg(json_build_object('id', sp.id, 'name', sp.name, 'avatar_url', sp.avatar_url, 'x_id', sp.x_id)) AS json_agg
                   FROM (session_speakers ss
                     JOIN speakers sp ON ((ss.speaker_id = sp.id)))
                  WHERE (ss.session_id = s.id)), '[]'::json), 'sponsor',
                CASE
                    WHEN (s.sponsor_id IS NOT NULL) THEN ( SELECT json_build_object('id', c.id, 'name', c.name, 'logo_url', c.logo_name, 'slug', cd.slug, 'pr_text', cd.pr_text, 'website_url', cd.website_url, 'sponsor_type', sc.sponsor_type, 'display_order', sc.display_order, 'basic_plan_type', bsc.basic_plan_type, 'option_plan_types', COALESCE(array_agg((sco.option_plan_type)::text) FILTER (WHERE (sco.option_plan_type IS NOT NULL)), ARRAY[]::text[])) AS json_build_object
                       FROM (((((companies c
                         JOIN sponsor_companies sc ON ((c.id = sc.company_id)))
                         LEFT JOIN basic_sponsor_companies bsc ON ((sc.id = bsc.sponsor_company_id)))
                         LEFT JOIN company_drafts cd ON ((c.id = cd.company_id)))
                         LEFT JOIN company_draft_approvals cda ON ((cd.id = cda.company_draft_id)))
                         LEFT JOIN sponsor_company_options sco ON ((sc.id = sco.sponsor_company_id)))
                      WHERE (sc.id = s.sponsor_id)
                      GROUP BY c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url, sc.sponsor_type, sc.display_order, bsc.basic_plan_type)
                    ELSE NULL::json
                END) ORDER BY s.starts_at) AS json_agg
           FROM sessions s
          WHERE (s.venue_id = sv.id)), '[]'::json) AS sessions
   FROM session_venues sv
  ORDER BY sv.name;


create or replace view "public"."sponsor_with_sessions" as  SELECT json_build_object('id', c.id, 'name', c.name, 'logo_url', c.logo_name, 'slug', cd.slug, 'pr_text', cd.pr_text, 'website_url', cd.website_url, 'sponsor_type', sc.sponsor_type, 'display_order', sc.display_order, 'basic_plan_type', bsc.basic_plan_type, 'option_plan_types', COALESCE(array_agg(DISTINCT (sco.option_plan_type)::text) FILTER (WHERE (sco.option_plan_type IS NOT NULL)), ARRAY[]::text[])) AS sponsor,
    COALESCE(( SELECT json_agg(json_build_object('id', s.id, 'title', s.title, 'description', s.description, 'starts_at', s.starts_at, 'ends_at', s.ends_at, 'is_lightning_talk', s.is_lightning_talk, 'is_beginners_lightning_talk', s.is_beginners_lightning_talk, 'is_hands_on', s.is_hands_on, 'video_url', s.video_url, 'url', s.url, 'venue', json_build_object('id', sv.id, 'name', sv.name), 'speakers', COALESCE(( SELECT json_agg(json_build_object('id', sp.id, 'name', sp.name, 'avatar_url', sp.avatar_url, 'x_id', sp.x_id)) AS json_agg
                   FROM (session_speakers ss
                     JOIN speakers sp ON ((ss.speaker_id = sp.id)))
                  WHERE (ss.session_id = s.id)), '[]'::json)) ORDER BY s.starts_at) AS json_agg
           FROM (sessions s
             JOIN session_venues sv ON ((s.venue_id = sv.id)))
          WHERE (s.sponsor_id = sc.id)), '[]'::json) AS sessions
   FROM (((((sponsor_companies sc
     JOIN companies c ON ((sc.company_id = c.id)))
     LEFT JOIN basic_sponsor_companies bsc ON ((sc.id = bsc.sponsor_company_id)))
     LEFT JOIN company_drafts cd ON ((c.id = cd.company_id)))
     LEFT JOIN company_draft_approvals cda ON ((cd.id = cda.company_draft_id)))
     LEFT JOIN sponsor_company_options sco ON ((sc.id = sco.sponsor_company_id)))
  WHERE (cda.id IS NOT NULL)
  GROUP BY c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url, sc.sponsor_type, sc.display_order, bsc.basic_plan_type, sc.id
 HAVING (EXISTS ( SELECT 1
           FROM sessions s
          WHERE (s.sponsor_id = sc.id)))
  ORDER BY sc.display_order;


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


create or replace view "public"."v_ticket_option_counts" as  SELECT topt.id AS ticket_option_id,
    topt.ticket_type_id,
    COALESCE(tpo_counts.sold_count, 0) AS sold_count,
    COALESCE(tco_counts.reserved_count, 0) AS reserved_count
   FROM ((ticket_options topt
     LEFT JOIN ( SELECT tpo.ticket_option_id,
            (count(*))::integer AS sold_count
           FROM (ticket_purchase_options tpo
             JOIN ticket_purchases tp ON ((tpo.ticket_purchase_id = tp.id)))
          GROUP BY tpo.ticket_option_id) tpo_counts ON ((topt.id = tpo_counts.ticket_option_id)))
     LEFT JOIN ( SELECT tco.ticket_option_id,
            (count(*))::integer AS reserved_count
           FROM (ticket_checkout_options tco
             JOIN ticket_checkout_sessions tcs ON ((tco.checkout_session_id = tcs.id)))
          WHERE ((tcs.status = 'pending'::ticket_checkout_status) AND (tcs.expires_at > now()))
          GROUP BY tco.ticket_option_id) tco_counts ON ((topt.id = tco_counts.ticket_option_id)));


grant delete on table "public"."basic_sponsor_companies" to "anon";

grant insert on table "public"."basic_sponsor_companies" to "anon";

grant references on table "public"."basic_sponsor_companies" to "anon";

grant select on table "public"."basic_sponsor_companies" to "anon";

grant trigger on table "public"."basic_sponsor_companies" to "anon";

grant truncate on table "public"."basic_sponsor_companies" to "anon";

grant update on table "public"."basic_sponsor_companies" to "anon";

grant delete on table "public"."basic_sponsor_companies" to "authenticated";

grant insert on table "public"."basic_sponsor_companies" to "authenticated";

grant references on table "public"."basic_sponsor_companies" to "authenticated";

grant select on table "public"."basic_sponsor_companies" to "authenticated";

grant trigger on table "public"."basic_sponsor_companies" to "authenticated";

grant truncate on table "public"."basic_sponsor_companies" to "authenticated";

grant update on table "public"."basic_sponsor_companies" to "authenticated";

grant delete on table "public"."basic_sponsor_companies" to "service_role";

grant insert on table "public"."basic_sponsor_companies" to "service_role";

grant references on table "public"."basic_sponsor_companies" to "service_role";

grant select on table "public"."basic_sponsor_companies" to "service_role";

grant trigger on table "public"."basic_sponsor_companies" to "service_role";

grant truncate on table "public"."basic_sponsor_companies" to "service_role";

grant update on table "public"."basic_sponsor_companies" to "service_role";

grant delete on table "public"."companies" to "anon";

grant insert on table "public"."companies" to "anon";

grant references on table "public"."companies" to "anon";

grant select on table "public"."companies" to "anon";

grant trigger on table "public"."companies" to "anon";

grant truncate on table "public"."companies" to "anon";

grant update on table "public"."companies" to "anon";

grant delete on table "public"."companies" to "authenticated";

grant insert on table "public"."companies" to "authenticated";

grant references on table "public"."companies" to "authenticated";

grant select on table "public"."companies" to "authenticated";

grant trigger on table "public"."companies" to "authenticated";

grant truncate on table "public"."companies" to "authenticated";

grant update on table "public"."companies" to "authenticated";

grant delete on table "public"."companies" to "service_role";

grant insert on table "public"."companies" to "service_role";

grant references on table "public"."companies" to "service_role";

grant select on table "public"."companies" to "service_role";

grant trigger on table "public"."companies" to "service_role";

grant truncate on table "public"."companies" to "service_role";

grant update on table "public"."companies" to "service_role";

grant delete on table "public"."company_draft_approvals" to "anon";

grant insert on table "public"."company_draft_approvals" to "anon";

grant references on table "public"."company_draft_approvals" to "anon";

grant select on table "public"."company_draft_approvals" to "anon";

grant trigger on table "public"."company_draft_approvals" to "anon";

grant truncate on table "public"."company_draft_approvals" to "anon";

grant update on table "public"."company_draft_approvals" to "anon";

grant delete on table "public"."company_draft_approvals" to "authenticated";

grant insert on table "public"."company_draft_approvals" to "authenticated";

grant references on table "public"."company_draft_approvals" to "authenticated";

grant select on table "public"."company_draft_approvals" to "authenticated";

grant trigger on table "public"."company_draft_approvals" to "authenticated";

grant truncate on table "public"."company_draft_approvals" to "authenticated";

grant update on table "public"."company_draft_approvals" to "authenticated";

grant delete on table "public"."company_draft_approvals" to "service_role";

grant insert on table "public"."company_draft_approvals" to "service_role";

grant references on table "public"."company_draft_approvals" to "service_role";

grant select on table "public"."company_draft_approvals" to "service_role";

grant trigger on table "public"."company_draft_approvals" to "service_role";

grant truncate on table "public"."company_draft_approvals" to "service_role";

grant update on table "public"."company_draft_approvals" to "service_role";

grant delete on table "public"."company_drafts" to "anon";

grant insert on table "public"."company_drafts" to "anon";

grant references on table "public"."company_drafts" to "anon";

grant select on table "public"."company_drafts" to "anon";

grant trigger on table "public"."company_drafts" to "anon";

grant truncate on table "public"."company_drafts" to "anon";

grant update on table "public"."company_drafts" to "anon";

grant delete on table "public"."company_drafts" to "authenticated";

grant insert on table "public"."company_drafts" to "authenticated";

grant references on table "public"."company_drafts" to "authenticated";

grant select on table "public"."company_drafts" to "authenticated";

grant trigger on table "public"."company_drafts" to "authenticated";

grant truncate on table "public"."company_drafts" to "authenticated";

grant update on table "public"."company_drafts" to "authenticated";

grant delete on table "public"."company_drafts" to "service_role";

grant insert on table "public"."company_drafts" to "service_role";

grant references on table "public"."company_drafts" to "service_role";

grant select on table "public"."company_drafts" to "service_role";

grant trigger on table "public"."company_drafts" to "service_role";

grant truncate on table "public"."company_drafts" to "service_role";

grant update on table "public"."company_drafts" to "service_role";

grant delete on table "public"."company_invitation" to "anon";

grant insert on table "public"."company_invitation" to "anon";

grant references on table "public"."company_invitation" to "anon";

grant select on table "public"."company_invitation" to "anon";

grant trigger on table "public"."company_invitation" to "anon";

grant truncate on table "public"."company_invitation" to "anon";

grant update on table "public"."company_invitation" to "anon";

grant delete on table "public"."company_invitation" to "authenticated";

grant insert on table "public"."company_invitation" to "authenticated";

grant references on table "public"."company_invitation" to "authenticated";

grant select on table "public"."company_invitation" to "authenticated";

grant trigger on table "public"."company_invitation" to "authenticated";

grant truncate on table "public"."company_invitation" to "authenticated";

grant update on table "public"."company_invitation" to "authenticated";

grant delete on table "public"."company_invitation" to "service_role";

grant insert on table "public"."company_invitation" to "service_role";

grant references on table "public"."company_invitation" to "service_role";

grant select on table "public"."company_invitation" to "service_role";

grant trigger on table "public"."company_invitation" to "service_role";

grant truncate on table "public"."company_invitation" to "service_role";

grant update on table "public"."company_invitation" to "service_role";

grant delete on table "public"."company_members" to "anon";

grant insert on table "public"."company_members" to "anon";

grant references on table "public"."company_members" to "anon";

grant select on table "public"."company_members" to "anon";

grant trigger on table "public"."company_members" to "anon";

grant truncate on table "public"."company_members" to "anon";

grant update on table "public"."company_members" to "anon";

grant delete on table "public"."company_members" to "authenticated";

grant insert on table "public"."company_members" to "authenticated";

grant references on table "public"."company_members" to "authenticated";

grant select on table "public"."company_members" to "authenticated";

grant trigger on table "public"."company_members" to "authenticated";

grant truncate on table "public"."company_members" to "authenticated";

grant update on table "public"."company_members" to "authenticated";

grant delete on table "public"."company_members" to "service_role";

grant insert on table "public"."company_members" to "service_role";

grant references on table "public"."company_members" to "service_role";

grant select on table "public"."company_members" to "service_role";

grant trigger on table "public"."company_members" to "service_role";

grant truncate on table "public"."company_members" to "service_role";

grant update on table "public"."company_members" to "service_role";

grant delete on table "public"."device_apns_live_activity_tokens" to "anon";

grant insert on table "public"."device_apns_live_activity_tokens" to "anon";

grant references on table "public"."device_apns_live_activity_tokens" to "anon";

grant select on table "public"."device_apns_live_activity_tokens" to "anon";

grant trigger on table "public"."device_apns_live_activity_tokens" to "anon";

grant truncate on table "public"."device_apns_live_activity_tokens" to "anon";

grant update on table "public"."device_apns_live_activity_tokens" to "anon";

grant delete on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant insert on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant references on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant select on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant trigger on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant truncate on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant update on table "public"."device_apns_live_activity_tokens" to "authenticated";

grant delete on table "public"."device_apns_live_activity_tokens" to "service_role";

grant insert on table "public"."device_apns_live_activity_tokens" to "service_role";

grant references on table "public"."device_apns_live_activity_tokens" to "service_role";

grant select on table "public"."device_apns_live_activity_tokens" to "service_role";

grant trigger on table "public"."device_apns_live_activity_tokens" to "service_role";

grant truncate on table "public"."device_apns_live_activity_tokens" to "service_role";

grant update on table "public"."device_apns_live_activity_tokens" to "service_role";

grant delete on table "public"."device_apns_tokens" to "anon";

grant insert on table "public"."device_apns_tokens" to "anon";

grant references on table "public"."device_apns_tokens" to "anon";

grant select on table "public"."device_apns_tokens" to "anon";

grant trigger on table "public"."device_apns_tokens" to "anon";

grant truncate on table "public"."device_apns_tokens" to "anon";

grant update on table "public"."device_apns_tokens" to "anon";

grant delete on table "public"."device_apns_tokens" to "authenticated";

grant insert on table "public"."device_apns_tokens" to "authenticated";

grant references on table "public"."device_apns_tokens" to "authenticated";

grant select on table "public"."device_apns_tokens" to "authenticated";

grant trigger on table "public"."device_apns_tokens" to "authenticated";

grant truncate on table "public"."device_apns_tokens" to "authenticated";

grant update on table "public"."device_apns_tokens" to "authenticated";

grant delete on table "public"."device_apns_tokens" to "service_role";

grant insert on table "public"."device_apns_tokens" to "service_role";

grant references on table "public"."device_apns_tokens" to "service_role";

grant select on table "public"."device_apns_tokens" to "service_role";

grant trigger on table "public"."device_apns_tokens" to "service_role";

grant truncate on table "public"."device_apns_tokens" to "service_role";

grant update on table "public"."device_apns_tokens" to "service_role";

grant delete on table "public"."device_fcm_tokens" to "anon";

grant insert on table "public"."device_fcm_tokens" to "anon";

grant references on table "public"."device_fcm_tokens" to "anon";

grant select on table "public"."device_fcm_tokens" to "anon";

grant trigger on table "public"."device_fcm_tokens" to "anon";

grant truncate on table "public"."device_fcm_tokens" to "anon";

grant update on table "public"."device_fcm_tokens" to "anon";

grant delete on table "public"."device_fcm_tokens" to "authenticated";

grant insert on table "public"."device_fcm_tokens" to "authenticated";

grant references on table "public"."device_fcm_tokens" to "authenticated";

grant select on table "public"."device_fcm_tokens" to "authenticated";

grant trigger on table "public"."device_fcm_tokens" to "authenticated";

grant truncate on table "public"."device_fcm_tokens" to "authenticated";

grant update on table "public"."device_fcm_tokens" to "authenticated";

grant delete on table "public"."device_fcm_tokens" to "service_role";

grant insert on table "public"."device_fcm_tokens" to "service_role";

grant references on table "public"."device_fcm_tokens" to "service_role";

grant select on table "public"."device_fcm_tokens" to "service_role";

grant trigger on table "public"."device_fcm_tokens" to "service_role";

grant truncate on table "public"."device_fcm_tokens" to "service_role";

grant update on table "public"."device_fcm_tokens" to "service_role";

grant delete on table "public"."devices" to "anon";

grant insert on table "public"."devices" to "anon";

grant references on table "public"."devices" to "anon";

grant select on table "public"."devices" to "anon";

grant trigger on table "public"."devices" to "anon";

grant truncate on table "public"."devices" to "anon";

grant update on table "public"."devices" to "anon";

grant delete on table "public"."devices" to "authenticated";

grant insert on table "public"."devices" to "authenticated";

grant references on table "public"."devices" to "authenticated";

grant select on table "public"."devices" to "authenticated";

grant trigger on table "public"."devices" to "authenticated";

grant truncate on table "public"."devices" to "authenticated";

grant update on table "public"."devices" to "authenticated";

grant delete on table "public"."devices" to "service_role";

grant insert on table "public"."devices" to "service_role";

grant references on table "public"."devices" to "service_role";

grant select on table "public"."devices" to "service_role";

grant trigger on table "public"."devices" to "service_role";

grant truncate on table "public"."devices" to "service_role";

grant update on table "public"."devices" to "service_role";

grant delete on table "public"."individual_draft_approvals" to "anon";

grant insert on table "public"."individual_draft_approvals" to "anon";

grant references on table "public"."individual_draft_approvals" to "anon";

grant select on table "public"."individual_draft_approvals" to "anon";

grant trigger on table "public"."individual_draft_approvals" to "anon";

grant truncate on table "public"."individual_draft_approvals" to "anon";

grant update on table "public"."individual_draft_approvals" to "anon";

grant delete on table "public"."individual_draft_approvals" to "authenticated";

grant insert on table "public"."individual_draft_approvals" to "authenticated";

grant references on table "public"."individual_draft_approvals" to "authenticated";

grant select on table "public"."individual_draft_approvals" to "authenticated";

grant trigger on table "public"."individual_draft_approvals" to "authenticated";

grant truncate on table "public"."individual_draft_approvals" to "authenticated";

grant update on table "public"."individual_draft_approvals" to "authenticated";

grant delete on table "public"."individual_draft_approvals" to "service_role";

grant insert on table "public"."individual_draft_approvals" to "service_role";

grant references on table "public"."individual_draft_approvals" to "service_role";

grant select on table "public"."individual_draft_approvals" to "service_role";

grant trigger on table "public"."individual_draft_approvals" to "service_role";

grant truncate on table "public"."individual_draft_approvals" to "service_role";

grant update on table "public"."individual_draft_approvals" to "service_role";

grant delete on table "public"."individual_drafts" to "anon";

grant insert on table "public"."individual_drafts" to "anon";

grant references on table "public"."individual_drafts" to "anon";

grant select on table "public"."individual_drafts" to "anon";

grant trigger on table "public"."individual_drafts" to "anon";

grant truncate on table "public"."individual_drafts" to "anon";

grant update on table "public"."individual_drafts" to "anon";

grant delete on table "public"."individual_drafts" to "authenticated";

grant insert on table "public"."individual_drafts" to "authenticated";

grant references on table "public"."individual_drafts" to "authenticated";

grant select on table "public"."individual_drafts" to "authenticated";

grant trigger on table "public"."individual_drafts" to "authenticated";

grant truncate on table "public"."individual_drafts" to "authenticated";

grant update on table "public"."individual_drafts" to "authenticated";

grant delete on table "public"."individual_drafts" to "service_role";

grant insert on table "public"."individual_drafts" to "service_role";

grant references on table "public"."individual_drafts" to "service_role";

grant select on table "public"."individual_drafts" to "service_role";

grant trigger on table "public"."individual_drafts" to "service_role";

grant truncate on table "public"."individual_drafts" to "service_role";

grant update on table "public"."individual_drafts" to "service_role";

grant delete on table "public"."individuals" to "anon";

grant insert on table "public"."individuals" to "anon";

grant references on table "public"."individuals" to "anon";

grant select on table "public"."individuals" to "anon";

grant trigger on table "public"."individuals" to "anon";

grant truncate on table "public"."individuals" to "anon";

grant update on table "public"."individuals" to "anon";

grant delete on table "public"."individuals" to "authenticated";

grant insert on table "public"."individuals" to "authenticated";

grant references on table "public"."individuals" to "authenticated";

grant select on table "public"."individuals" to "authenticated";

grant trigger on table "public"."individuals" to "authenticated";

grant truncate on table "public"."individuals" to "authenticated";

grant update on table "public"."individuals" to "authenticated";

grant delete on table "public"."individuals" to "service_role";

grant insert on table "public"."individuals" to "service_role";

grant references on table "public"."individuals" to "service_role";

grant select on table "public"."individuals" to "service_role";

grant trigger on table "public"."individuals" to "service_role";

grant truncate on table "public"."individuals" to "service_role";

grant update on table "public"."individuals" to "service_role";

grant delete on table "public"."job_boards" to "anon";

grant insert on table "public"."job_boards" to "anon";

grant references on table "public"."job_boards" to "anon";

grant select on table "public"."job_boards" to "anon";

grant trigger on table "public"."job_boards" to "anon";

grant truncate on table "public"."job_boards" to "anon";

grant update on table "public"."job_boards" to "anon";

grant delete on table "public"."job_boards" to "authenticated";

grant insert on table "public"."job_boards" to "authenticated";

grant references on table "public"."job_boards" to "authenticated";

grant select on table "public"."job_boards" to "authenticated";

grant trigger on table "public"."job_boards" to "authenticated";

grant truncate on table "public"."job_boards" to "authenticated";

grant update on table "public"."job_boards" to "authenticated";

grant delete on table "public"."job_boards" to "service_role";

grant insert on table "public"."job_boards" to "service_role";

grant references on table "public"."job_boards" to "service_role";

grant select on table "public"."job_boards" to "service_role";

grant trigger on table "public"."job_boards" to "service_role";

grant truncate on table "public"."job_boards" to "service_role";

grant update on table "public"."job_boards" to "service_role";

grant delete on table "public"."news" to "anon";

grant insert on table "public"."news" to "anon";

grant references on table "public"."news" to "anon";

grant select on table "public"."news" to "anon";

grant trigger on table "public"."news" to "anon";

grant truncate on table "public"."news" to "anon";

grant update on table "public"."news" to "anon";

grant delete on table "public"."news" to "authenticated";

grant insert on table "public"."news" to "authenticated";

grant references on table "public"."news" to "authenticated";

grant select on table "public"."news" to "authenticated";

grant trigger on table "public"."news" to "authenticated";

grant truncate on table "public"."news" to "authenticated";

grant update on table "public"."news" to "authenticated";

grant delete on table "public"."news" to "service_role";

grant insert on table "public"."news" to "service_role";

grant references on table "public"."news" to "service_role";

grant select on table "public"."news" to "service_role";

grant trigger on table "public"."news" to "service_role";

grant truncate on table "public"."news" to "service_role";

grant update on table "public"."news" to "service_role";

grant delete on table "public"."profile_share" to "anon";

grant insert on table "public"."profile_share" to "anon";

grant references on table "public"."profile_share" to "anon";

grant select on table "public"."profile_share" to "anon";

grant trigger on table "public"."profile_share" to "anon";

grant truncate on table "public"."profile_share" to "anon";

grant update on table "public"."profile_share" to "anon";

grant delete on table "public"."profile_share" to "authenticated";

grant insert on table "public"."profile_share" to "authenticated";

grant references on table "public"."profile_share" to "authenticated";

grant select on table "public"."profile_share" to "authenticated";

grant trigger on table "public"."profile_share" to "authenticated";

grant truncate on table "public"."profile_share" to "authenticated";

grant update on table "public"."profile_share" to "authenticated";

grant delete on table "public"."profile_share" to "service_role";

grant insert on table "public"."profile_share" to "service_role";

grant references on table "public"."profile_share" to "service_role";

grant select on table "public"."profile_share" to "service_role";

grant trigger on table "public"."profile_share" to "service_role";

grant truncate on table "public"."profile_share" to "service_role";

grant update on table "public"."profile_share" to "service_role";

grant delete on table "public"."profiles" to "anon";

grant insert on table "public"."profiles" to "anon";

grant references on table "public"."profiles" to "anon";

grant select on table "public"."profiles" to "anon";

grant trigger on table "public"."profiles" to "anon";

grant truncate on table "public"."profiles" to "anon";

grant update on table "public"."profiles" to "anon";

grant delete on table "public"."profiles" to "authenticated";

grant insert on table "public"."profiles" to "authenticated";

grant references on table "public"."profiles" to "authenticated";

grant select on table "public"."profiles" to "authenticated";

grant trigger on table "public"."profiles" to "authenticated";

grant truncate on table "public"."profiles" to "authenticated";

grant update on table "public"."profiles" to "authenticated";

grant delete on table "public"."profiles" to "service_role";

grant insert on table "public"."profiles" to "service_role";

grant references on table "public"."profiles" to "service_role";

grant select on table "public"."profiles" to "service_role";

grant trigger on table "public"."profiles" to "service_role";

grant truncate on table "public"."profiles" to "service_role";

grant update on table "public"."profiles" to "service_role";

grant delete on table "public"."session_speakers" to "anon";

grant insert on table "public"."session_speakers" to "anon";

grant references on table "public"."session_speakers" to "anon";

grant select on table "public"."session_speakers" to "anon";

grant trigger on table "public"."session_speakers" to "anon";

grant truncate on table "public"."session_speakers" to "anon";

grant update on table "public"."session_speakers" to "anon";

grant delete on table "public"."session_speakers" to "authenticated";

grant insert on table "public"."session_speakers" to "authenticated";

grant references on table "public"."session_speakers" to "authenticated";

grant select on table "public"."session_speakers" to "authenticated";

grant trigger on table "public"."session_speakers" to "authenticated";

grant truncate on table "public"."session_speakers" to "authenticated";

grant update on table "public"."session_speakers" to "authenticated";

grant delete on table "public"."session_speakers" to "service_role";

grant insert on table "public"."session_speakers" to "service_role";

grant references on table "public"."session_speakers" to "service_role";

grant select on table "public"."session_speakers" to "service_role";

grant trigger on table "public"."session_speakers" to "service_role";

grant truncate on table "public"."session_speakers" to "service_role";

grant update on table "public"."session_speakers" to "service_role";

grant delete on table "public"."session_venues" to "anon";

grant insert on table "public"."session_venues" to "anon";

grant references on table "public"."session_venues" to "anon";

grant select on table "public"."session_venues" to "anon";

grant trigger on table "public"."session_venues" to "anon";

grant truncate on table "public"."session_venues" to "anon";

grant update on table "public"."session_venues" to "anon";

grant delete on table "public"."session_venues" to "authenticated";

grant insert on table "public"."session_venues" to "authenticated";

grant references on table "public"."session_venues" to "authenticated";

grant select on table "public"."session_venues" to "authenticated";

grant trigger on table "public"."session_venues" to "authenticated";

grant truncate on table "public"."session_venues" to "authenticated";

grant update on table "public"."session_venues" to "authenticated";

grant delete on table "public"."session_venues" to "service_role";

grant insert on table "public"."session_venues" to "service_role";

grant references on table "public"."session_venues" to "service_role";

grant select on table "public"."session_venues" to "service_role";

grant trigger on table "public"."session_venues" to "service_role";

grant truncate on table "public"."session_venues" to "service_role";

grant update on table "public"."session_venues" to "service_role";

grant delete on table "public"."sessions" to "anon";

grant insert on table "public"."sessions" to "anon";

grant references on table "public"."sessions" to "anon";

grant select on table "public"."sessions" to "anon";

grant trigger on table "public"."sessions" to "anon";

grant truncate on table "public"."sessions" to "anon";

grant update on table "public"."sessions" to "anon";

grant delete on table "public"."sessions" to "authenticated";

grant insert on table "public"."sessions" to "authenticated";

grant references on table "public"."sessions" to "authenticated";

grant select on table "public"."sessions" to "authenticated";

grant trigger on table "public"."sessions" to "authenticated";

grant truncate on table "public"."sessions" to "authenticated";

grant update on table "public"."sessions" to "authenticated";

grant delete on table "public"."sessions" to "service_role";

grant insert on table "public"."sessions" to "service_role";

grant references on table "public"."sessions" to "service_role";

grant select on table "public"."sessions" to "service_role";

grant trigger on table "public"."sessions" to "service_role";

grant truncate on table "public"."sessions" to "service_role";

grant update on table "public"."sessions" to "service_role";

grant delete on table "public"."speakers" to "anon";

grant insert on table "public"."speakers" to "anon";

grant references on table "public"."speakers" to "anon";

grant select on table "public"."speakers" to "anon";

grant trigger on table "public"."speakers" to "anon";

grant truncate on table "public"."speakers" to "anon";

grant update on table "public"."speakers" to "anon";

grant delete on table "public"."speakers" to "authenticated";

grant insert on table "public"."speakers" to "authenticated";

grant references on table "public"."speakers" to "authenticated";

grant select on table "public"."speakers" to "authenticated";

grant trigger on table "public"."speakers" to "authenticated";

grant truncate on table "public"."speakers" to "authenticated";

grant update on table "public"."speakers" to "authenticated";

grant delete on table "public"."speakers" to "service_role";

grant insert on table "public"."speakers" to "service_role";

grant references on table "public"."speakers" to "service_role";

grant select on table "public"."speakers" to "service_role";

grant trigger on table "public"."speakers" to "service_role";

grant truncate on table "public"."speakers" to "service_role";

grant update on table "public"."speakers" to "service_role";

grant delete on table "public"."sponsor_companies" to "anon";

grant insert on table "public"."sponsor_companies" to "anon";

grant references on table "public"."sponsor_companies" to "anon";

grant select on table "public"."sponsor_companies" to "anon";

grant trigger on table "public"."sponsor_companies" to "anon";

grant truncate on table "public"."sponsor_companies" to "anon";

grant update on table "public"."sponsor_companies" to "anon";

grant delete on table "public"."sponsor_companies" to "authenticated";

grant insert on table "public"."sponsor_companies" to "authenticated";

grant references on table "public"."sponsor_companies" to "authenticated";

grant select on table "public"."sponsor_companies" to "authenticated";

grant trigger on table "public"."sponsor_companies" to "authenticated";

grant truncate on table "public"."sponsor_companies" to "authenticated";

grant update on table "public"."sponsor_companies" to "authenticated";

grant delete on table "public"."sponsor_companies" to "service_role";

grant insert on table "public"."sponsor_companies" to "service_role";

grant references on table "public"."sponsor_companies" to "service_role";

grant select on table "public"."sponsor_companies" to "service_role";

grant trigger on table "public"."sponsor_companies" to "service_role";

grant truncate on table "public"."sponsor_companies" to "service_role";

grant update on table "public"."sponsor_companies" to "service_role";

grant delete on table "public"."sponsor_company_options" to "anon";

grant insert on table "public"."sponsor_company_options" to "anon";

grant references on table "public"."sponsor_company_options" to "anon";

grant select on table "public"."sponsor_company_options" to "anon";

grant trigger on table "public"."sponsor_company_options" to "anon";

grant truncate on table "public"."sponsor_company_options" to "anon";

grant update on table "public"."sponsor_company_options" to "anon";

grant delete on table "public"."sponsor_company_options" to "authenticated";

grant insert on table "public"."sponsor_company_options" to "authenticated";

grant references on table "public"."sponsor_company_options" to "authenticated";

grant select on table "public"."sponsor_company_options" to "authenticated";

grant trigger on table "public"."sponsor_company_options" to "authenticated";

grant truncate on table "public"."sponsor_company_options" to "authenticated";

grant update on table "public"."sponsor_company_options" to "authenticated";

grant delete on table "public"."sponsor_company_options" to "service_role";

grant insert on table "public"."sponsor_company_options" to "service_role";

grant references on table "public"."sponsor_company_options" to "service_role";

grant select on table "public"."sponsor_company_options" to "service_role";

grant trigger on table "public"."sponsor_company_options" to "service_role";

grant truncate on table "public"."sponsor_company_options" to "service_role";

grant update on table "public"."sponsor_company_options" to "service_role";

grant delete on table "public"."sponsor_individuals" to "anon";

grant insert on table "public"."sponsor_individuals" to "anon";

grant references on table "public"."sponsor_individuals" to "anon";

grant select on table "public"."sponsor_individuals" to "anon";

grant trigger on table "public"."sponsor_individuals" to "anon";

grant truncate on table "public"."sponsor_individuals" to "anon";

grant update on table "public"."sponsor_individuals" to "anon";

grant delete on table "public"."sponsor_individuals" to "authenticated";

grant insert on table "public"."sponsor_individuals" to "authenticated";

grant references on table "public"."sponsor_individuals" to "authenticated";

grant select on table "public"."sponsor_individuals" to "authenticated";

grant trigger on table "public"."sponsor_individuals" to "authenticated";

grant truncate on table "public"."sponsor_individuals" to "authenticated";

grant update on table "public"."sponsor_individuals" to "authenticated";

grant delete on table "public"."sponsor_individuals" to "service_role";

grant insert on table "public"."sponsor_individuals" to "service_role";

grant references on table "public"."sponsor_individuals" to "service_role";

grant select on table "public"."sponsor_individuals" to "service_role";

grant trigger on table "public"."sponsor_individuals" to "service_role";

grant truncate on table "public"."sponsor_individuals" to "service_role";

grant update on table "public"."sponsor_individuals" to "service_role";

grant delete on table "public"."staff_member_sns_links" to "anon";

grant insert on table "public"."staff_member_sns_links" to "anon";

grant references on table "public"."staff_member_sns_links" to "anon";

grant select on table "public"."staff_member_sns_links" to "anon";

grant trigger on table "public"."staff_member_sns_links" to "anon";

grant truncate on table "public"."staff_member_sns_links" to "anon";

grant update on table "public"."staff_member_sns_links" to "anon";

grant delete on table "public"."staff_member_sns_links" to "authenticated";

grant insert on table "public"."staff_member_sns_links" to "authenticated";

grant references on table "public"."staff_member_sns_links" to "authenticated";

grant select on table "public"."staff_member_sns_links" to "authenticated";

grant trigger on table "public"."staff_member_sns_links" to "authenticated";

grant truncate on table "public"."staff_member_sns_links" to "authenticated";

grant update on table "public"."staff_member_sns_links" to "authenticated";

grant delete on table "public"."staff_member_sns_links" to "service_role";

grant insert on table "public"."staff_member_sns_links" to "service_role";

grant references on table "public"."staff_member_sns_links" to "service_role";

grant select on table "public"."staff_member_sns_links" to "service_role";

grant trigger on table "public"."staff_member_sns_links" to "service_role";

grant truncate on table "public"."staff_member_sns_links" to "service_role";

grant update on table "public"."staff_member_sns_links" to "service_role";

grant delete on table "public"."staff_members" to "anon";

grant insert on table "public"."staff_members" to "anon";

grant references on table "public"."staff_members" to "anon";

grant select on table "public"."staff_members" to "anon";

grant trigger on table "public"."staff_members" to "anon";

grant truncate on table "public"."staff_members" to "anon";

grant update on table "public"."staff_members" to "anon";

grant delete on table "public"."staff_members" to "authenticated";

grant insert on table "public"."staff_members" to "authenticated";

grant references on table "public"."staff_members" to "authenticated";

grant select on table "public"."staff_members" to "authenticated";

grant trigger on table "public"."staff_members" to "authenticated";

grant truncate on table "public"."staff_members" to "authenticated";

grant update on table "public"."staff_members" to "authenticated";

grant delete on table "public"."staff_members" to "service_role";

grant insert on table "public"."staff_members" to "service_role";

grant references on table "public"."staff_members" to "service_role";

grant select on table "public"."staff_members" to "service_role";

grant trigger on table "public"."staff_members" to "service_role";

grant truncate on table "public"."staff_members" to "service_role";

grant update on table "public"."staff_members" to "service_role";

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

grant delete on table "public"."timeline_events" to "anon";

grant insert on table "public"."timeline_events" to "anon";

grant references on table "public"."timeline_events" to "anon";

grant select on table "public"."timeline_events" to "anon";

grant trigger on table "public"."timeline_events" to "anon";

grant truncate on table "public"."timeline_events" to "anon";

grant update on table "public"."timeline_events" to "anon";

grant delete on table "public"."timeline_events" to "authenticated";

grant insert on table "public"."timeline_events" to "authenticated";

grant references on table "public"."timeline_events" to "authenticated";

grant select on table "public"."timeline_events" to "authenticated";

grant trigger on table "public"."timeline_events" to "authenticated";

grant truncate on table "public"."timeline_events" to "authenticated";

grant update on table "public"."timeline_events" to "authenticated";

grant delete on table "public"."timeline_events" to "service_role";

grant insert on table "public"."timeline_events" to "service_role";

grant references on table "public"."timeline_events" to "service_role";

grant select on table "public"."timeline_events" to "service_role";

grant trigger on table "public"."timeline_events" to "service_role";

grant truncate on table "public"."timeline_events" to "service_role";

grant update on table "public"."timeline_events" to "service_role";

grant delete on table "public"."user_roles" to "anon";

grant insert on table "public"."user_roles" to "anon";

grant references on table "public"."user_roles" to "anon";

grant select on table "public"."user_roles" to "anon";

grant trigger on table "public"."user_roles" to "anon";

grant truncate on table "public"."user_roles" to "anon";

grant update on table "public"."user_roles" to "anon";

grant delete on table "public"."user_roles" to "authenticated";

grant insert on table "public"."user_roles" to "authenticated";

grant references on table "public"."user_roles" to "authenticated";

grant select on table "public"."user_roles" to "authenticated";

grant trigger on table "public"."user_roles" to "authenticated";

grant truncate on table "public"."user_roles" to "authenticated";

grant update on table "public"."user_roles" to "authenticated";

grant delete on table "public"."user_roles" to "service_role";

grant insert on table "public"."user_roles" to "service_role";

grant references on table "public"."user_roles" to "service_role";

grant select on table "public"."user_roles" to "service_role";

grant trigger on table "public"."user_roles" to "service_role";

grant truncate on table "public"."user_roles" to "service_role";

grant update on table "public"."user_roles" to "service_role";

grant delete on table "public"."user_sns_links" to "anon";

grant insert on table "public"."user_sns_links" to "anon";

grant references on table "public"."user_sns_links" to "anon";

grant select on table "public"."user_sns_links" to "anon";

grant trigger on table "public"."user_sns_links" to "anon";

grant truncate on table "public"."user_sns_links" to "anon";

grant update on table "public"."user_sns_links" to "anon";

grant delete on table "public"."user_sns_links" to "authenticated";

grant insert on table "public"."user_sns_links" to "authenticated";

grant references on table "public"."user_sns_links" to "authenticated";

grant select on table "public"."user_sns_links" to "authenticated";

grant trigger on table "public"."user_sns_links" to "authenticated";

grant truncate on table "public"."user_sns_links" to "authenticated";

grant update on table "public"."user_sns_links" to "authenticated";

grant delete on table "public"."user_sns_links" to "service_role";

grant insert on table "public"."user_sns_links" to "service_role";

grant references on table "public"."user_sns_links" to "service_role";

grant select on table "public"."user_sns_links" to "service_role";

grant trigger on table "public"."user_sns_links" to "service_role";

grant truncate on table "public"."user_sns_links" to "service_role";

grant update on table "public"."user_sns_links" to "service_role";

grant delete on table "public"."users" to "anon";

grant insert on table "public"."users" to "anon";

grant references on table "public"."users" to "anon";

grant select on table "public"."users" to "anon";

grant trigger on table "public"."users" to "anon";

grant truncate on table "public"."users" to "anon";

grant update on table "public"."users" to "anon";

grant delete on table "public"."users" to "authenticated";

grant insert on table "public"."users" to "authenticated";

grant references on table "public"."users" to "authenticated";

grant select on table "public"."users" to "authenticated";

grant trigger on table "public"."users" to "authenticated";

grant truncate on table "public"."users" to "authenticated";

grant update on table "public"."users" to "authenticated";

grant delete on table "public"."users" to "service_role";

grant insert on table "public"."users" to "service_role";

grant references on table "public"."users" to "service_role";

grant select on table "public"."users" to "service_role";

grant trigger on table "public"."users" to "service_role";

grant truncate on table "public"."users" to "service_role";

grant update on table "public"."users" to "service_role";


