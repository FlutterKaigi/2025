CREATE TYPE public.device_type AS enum('ios', 'android', 'web');

CREATE TYPE public.apns_live_activity_token_type AS enum('start', 'update');

-- デバイスマスターテーブル
CREATE TABLE public.devices (
  id varchar(64) PRIMARY KEY, -- SHA256
  user_id uuid NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
  type public.device_type NOT NULL,
  name text NOT NULL CHECK (char_length(name) <= 255),
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.devices enable ROW level security;

-- APNsトークンテーブル
CREATE TABLE public.device_apns_tokens (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v7 (),
  device_id varchar(64) NOT NULL REFERENCES public.devices (id) ON DELETE CASCADE UNIQUE,
  token text NOT NULL CHECK (char_length(token) <= 1024), -- さすがに1024文字あれば十分...たぶん
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.device_apns_tokens enable ROW level security;

CREATE TABLE public.device_apns_live_activity_tokens (
  device_id varchar(64) REFERENCES public.devices (id) ON DELETE CASCADE,
  token text NOT NULL CHECK (char_length(token) <= 1024), -- さすがに1024文字あれば十分...たぶん
  type public.apns_live_activity_token_type NOT NULL,
  topic text NOT NULL CHECK (char_length(topic) <= 255),
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL,
  PRIMARY KEY (device_id, type, topic)
);

ALTER TABLE public.device_apns_live_activity_tokens enable ROW level security;

-- FCMトークンテーブル
CREATE TABLE public.device_fcm_tokens (
  device_id varchar(64) PRIMARY KEY REFERENCES public.devices (id) ON DELETE CASCADE,
  token text NOT NULL CHECK (char_length(token) <= 1024), -- さすがに1024文字あれば十分...たぶん
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.device_fcm_tokens enable ROW level security;

CREATE VIEW public.v_device_tokens AS
SELECT
  d.id AS device_id,
  d.user_id,
  d.created_at,
  json_build_object(
    'id',
    d.id,
    'user_id',
    d.user_id,
    'type',
    d.type::text,
    'name',
    d.name,
    'created_at',
    d.created_at,
    'updated_at',
    d.updated_at
  ) AS device,
  CASE
    WHEN dat.id IS NOT NULL THEN json_build_object(
      'id',
      dat.id,
      'device_id',
      dat.device_id,
      'token',
      dat.token,
      'created_at',
      dat.created_at,
      'updated_at',
      dat.updated_at
    )
    ELSE NULL
  END AS apns_token,
  CASE
    WHEN dft.device_id IS NOT NULL THEN json_build_object('device_id', dft.device_id, 'token', dft.token, 'created_at', dft.created_at, 'updated_at', dft.updated_at)
    ELSE NULL
  END AS fcm_token,
  coalesce(
    json_agg(
      CASE
        WHEN dalt.device_id IS NOT NULL THEN json_build_object(
          'device_id',
          dalt.device_id,
          'token',
          dalt.token,
          'type',
          dalt.type::text,
          'topic',
          dalt.topic,
          'created_at',
          dalt.created_at,
          'updated_at',
          dalt.updated_at
        )
        ELSE NULL
      END
    ) FILTER (
      WHERE
        dalt.device_id IS NOT NULL
    ),
    '[]'::json
  ) AS apns_live_activity_tokens
FROM
  public.devices d
  LEFT JOIN public.device_apns_tokens dat ON d.id = dat.device_id
  LEFT JOIN public.device_fcm_tokens dft ON d.id = dft.device_id
  LEFT JOIN public.device_apns_live_activity_tokens dalt ON d.id = dalt.device_id
GROUP BY
  d.id,
  dat.id,
  dft.device_id;
