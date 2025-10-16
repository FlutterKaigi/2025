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
  device_id varchar(64) PRIMARY KEY REFERENCES public.devices (id) ON DELETE CASCADE,
  token text NOT NULL CHECK (char_length(token) <= 1024), -- さすがに1024文字あれば十分...たぶん
  type public.apns_live_activity_token_type NOT NULL,
  topic text NOT NULL CHECK (char_length(topic) <= 255),
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
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
