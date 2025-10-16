-- デバイス種別を定義するenum
CREATE TYPE public.device_type_enum AS enum('ios', 'android', 'web');

-- APNsトークン種別を定義するenum
CREATE TYPE public.apns_token_type_enum AS enum('push', 'voip', 'live_activity');

-- デバイスマスターテーブル
CREATE TABLE public.devices (
  id varchar(64) NOT NULL,
  user_id uuid NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
  device_type public.device_type_enum NOT NULL,
  created_at timestamp DEFAULT now() NOT NULL,
  PRIMARY KEY (user_id, id)
);

ALTER TABLE public.devices enable ROW level security;

-- APNsトークンテーブル
CREATE TABLE public.device_apns_tokens (
  device_id varchar(64) NOT NULL,
  token text NOT NULL,
  token_type public.apns_token_type_enum NOT NULL,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL,
  PRIMARY KEY (device_id, token_type)
);

-- device_idの外部キー制約を追加
-- devicesテーブルの主キーは(user_id, id)だが、idのみで一意性が保証されるため、
-- 外部キーはidのみを参照する必要がある
-- そのため、まずdevices.idにユニーク制約を追加
ALTER TABLE public.devices ADD CONSTRAINT devices_id_unique UNIQUE (id);

-- その後、外部キー制約を追加
ALTER TABLE public.device_apns_tokens 
  ADD CONSTRAINT device_apns_tokens_device_id_fkey 
  FOREIGN KEY (device_id) REFERENCES public.devices (id) ON DELETE CASCADE;

ALTER TABLE public.device_apns_tokens enable ROW level security;

-- FCMトークンテーブル
CREATE TABLE public.device_fcm_tokens (
  device_id varchar(64) PRIMARY KEY REFERENCES public.devices (id) ON DELETE CASCADE,
  token text NOT NULL,
  created_at timestamp DEFAULT now() NOT NULL,
  updated_at timestamp DEFAULT now() NOT NULL
);

ALTER TABLE public.device_fcm_tokens enable ROW level security;

-- updated_atを自動更新するトリガー（device_apns_tokens用）
CREATE TRIGGER update_device_apns_tokens_updated_at before
UPDATE ON public.device_apns_tokens FOR each ROW
EXECUTE function public.update_updated_at_column ();

-- updated_atを自動更新するトリガー（device_fcm_tokens用）
CREATE TRIGGER update_device_fcm_tokens_updated_at before
UPDATE ON public.device_fcm_tokens FOR each ROW
EXECUTE function public.update_updated_at_column ();

-- インデックス作成
CREATE INDEX devices_user_id_idx ON public.devices (user_id);

-- RLSポリシー設定

-- devices: ユーザーは自分のデバイスのみ閲覧・操作可能
CREATE POLICY "Users can view their own devices" ON public.devices
  FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own devices" ON public.devices
  FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own devices" ON public.devices
  FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own devices" ON public.devices
  FOR DELETE
  USING (auth.uid() = user_id);

-- device_apns_tokens: ユーザーは自分のデバイスのトークンのみ操作可能
CREATE POLICY "Users can view their own device apns tokens" ON public.device_apns_tokens
  FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM public.devices
      WHERE devices.id = device_apns_tokens.device_id
      AND devices.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can insert their own device apns tokens" ON public.device_apns_tokens
  FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.devices
      WHERE devices.id = device_apns_tokens.device_id
      AND devices.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can update their own device apns tokens" ON public.device_apns_tokens
  FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM public.devices
      WHERE devices.id = device_apns_tokens.device_id
      AND devices.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can delete their own device apns tokens" ON public.device_apns_tokens
  FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM public.devices
      WHERE devices.id = device_apns_tokens.device_id
      AND devices.user_id = auth.uid()
    )
  );

-- device_fcm_tokens: ユーザーは自分のデバイスのトークンのみ操作可能
CREATE POLICY "Users can view their own device fcm tokens" ON public.device_fcm_tokens
  FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM public.devices
      WHERE devices.id = device_fcm_tokens.device_id
      AND devices.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can insert their own device fcm tokens" ON public.device_fcm_tokens
  FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.devices
      WHERE devices.id = device_fcm_tokens.device_id
      AND devices.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can update their own device fcm tokens" ON public.device_fcm_tokens
  FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM public.devices
      WHERE devices.id = device_fcm_tokens.device_id
      AND devices.user_id = auth.uid()
    )
  );

CREATE POLICY "Users can delete their own device fcm tokens" ON public.device_fcm_tokens
  FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM public.devices
      WHERE devices.id = device_fcm_tokens.device_id
      AND devices.user_id = auth.uid()
    )
  );
