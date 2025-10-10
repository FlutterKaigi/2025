-- Fix session_venues_with_sessions view to resolve potential JSON ordering issues
drop view if exists session_venues_with_sessions;

create or replace view session_venues_with_sessions as
select
    sv.id,
    sv.name,
    coalesce(
        (select json_agg(
            json_build_object(
                'id', s.id,
                'title', s.title,
                'description', s.description,
                'starts_at', s.starts_at,
                'ends_at', s.ends_at,
                'is_lightning_talk', s.is_lightning_talk,
                'is_beginners_lightning_talk', s.is_beginners_lightning_talk,
                'is_hands_on', s.is_hands_on,
                'video_url', s.video_url,
                'speakers', coalesce(
                    (select json_agg(
                        json_build_object(
                            'id', sp.id,
                            'name', sp.name,
                            'avatar_name', sp.avatar_name,
                            'x_id', sp.x_id
                        )
                    )
                    from session_speakers ss
                    join speakers sp on ss.speaker_id = sp.id
                    where ss.session_id = s.id),
                    '[]'::json
                ),
                'sponsor', case
                    when s.sponsor_id is not null then
                        (select json_build_object(
                            'id', c.id,
                            'name', c.name,
                            'logo_url', c.logo_name,
                            'slug', cd.slug,
                            'pr_text', cd.pr_text,
                            'website_url', cd.website_url,
                            'sponsor_type', sc.sponsor_type,
                            'display_order', sc.display_order,
                            'basic_plan_type', bsc.basic_plan_type,
                            'option_plan_types', coalesce(
                                array_agg(sco.option_plan_type::text) filter (where sco.option_plan_type is not null),
                                array[]::text[]
                            )
                        )
                        from companies c
                        inner join sponsor_companies sc on c.id = sc.company_id
                        left join basic_sponsor_companies bsc on sc.id = bsc.sponsor_company_id
                        left join company_drafts cd on c.id = cd.company_id
                        left join company_draft_approvals cda on cd.id = cda.company_draft_id
                        left join sponsor_company_options sco on sc.id = sco.sponsor_company_id
                        where sc.id = s.sponsor_id
                        group by c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url,
                                 sc.sponsor_type, sc.display_order, bsc.basic_plan_type
                        )
                    else null
                end
            ) order by s.starts_at
        )
        from sessions s
        where s.venue_id = sv.id),
        '[]'::json
    ) as sessions
from session_venues sv
order by sv.name;

-- Grant permissions for the view
grant select on table "public"."session_venues_with_sessions" to "anon";
grant select on table "public"."session_venues_with_sessions" to "authenticated";
grant select on table "public"."session_venues_with_sessions" to "service_role";