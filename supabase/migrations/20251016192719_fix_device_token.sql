alter table "public"."device_apns_live_activity_tokens" drop constraint "device_apns_live_activity_tokens_pkey";

drop index if exists "public"."device_apns_live_activity_tokens_pkey";

CREATE UNIQUE INDEX device_apns_live_activity_tokens_pkey ON public.device_apns_live_activity_tokens USING btree (device_id, type, topic);

alter table "public"."device_apns_live_activity_tokens" add constraint "device_apns_live_activity_tokens_pkey" PRIMARY KEY using index "device_apns_live_activity_tokens_pkey";

create or replace view "public"."v_device_tokens" as  SELECT json_build_object('id', d.id, 'user_id', d.user_id, 'type', (d.type)::text, 'name', d.name, 'created_at', d.created_at, 'updated_at', d.updated_at) AS device,
        CASE
            WHEN (dat.id IS NOT NULL) THEN json_build_object('id', dat.id, 'device_id', dat.device_id, 'token', dat.token, 'created_at', dat.created_at, 'updated_at', dat.updated_at)
            ELSE NULL::json
        END AS apns_token,
        CASE
            WHEN (dft.device_id IS NOT NULL) THEN json_build_object('device_id', dft.device_id, 'token', dft.token, 'created_at', dft.created_at, 'updated_at', dft.updated_at)
            ELSE NULL::json
        END AS fcm_token,
    COALESCE(json_agg(
        CASE
            WHEN (dalt.device_id IS NOT NULL) THEN json_build_object('device_id', dalt.device_id, 'token', dalt.token, 'type', (dalt.type)::text, 'topic', dalt.topic, 'created_at', dalt.created_at, 'updated_at', dalt.updated_at)
            ELSE NULL::json
        END) FILTER (WHERE (dalt.device_id IS NOT NULL)), '[]'::json) AS apns_live_activity_tokens
   FROM (((devices d
     LEFT JOIN device_apns_tokens dat ON (((d.id)::text = (dat.device_id)::text)))
     LEFT JOIN device_fcm_tokens dft ON (((d.id)::text = (dft.device_id)::text)))
     LEFT JOIN device_apns_live_activity_tokens dalt ON (((d.id)::text = (dalt.device_id)::text)))
  GROUP BY d.id, dat.id, dft.device_id;



