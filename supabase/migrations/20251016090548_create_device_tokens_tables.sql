-- デバイス種別を定義するenum
create type "public"."device_type_enum" as enum ('ios', 'android', 'web');

-- APNsトークン種別を定義するenum
create type "public"."apns_token_type_enum" as enum ('push', 'voip', 'live_activity');

-- デバイスマスターテーブル
create table "public"."devices" (
    "id" character varying(64) not null,
    "user_id" uuid not null,
    "device_type" device_type_enum not null,
    "created_at" timestamp without time zone not null default now()
);

alter table "public"."devices" enable row level security;

-- APNsトークンテーブル
create table "public"."device_apns_tokens" (
    "device_id" character varying(64) not null,
    "token" text not null,
    "token_type" apns_token_type_enum not null,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);

alter table "public"."device_apns_tokens" enable row level security;

-- FCMトークンテーブル
create table "public"."device_fcm_tokens" (
    "device_id" character varying(64) not null,
    "token" text not null,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);

alter table "public"."device_fcm_tokens" enable row level security;

-- インデックスとPKの作成
CREATE UNIQUE INDEX devices_pkey ON public.devices USING btree (user_id, id);

CREATE UNIQUE INDEX devices_id_unique ON public.devices USING btree (id);

CREATE INDEX devices_user_id_idx ON public.devices USING btree (user_id);

CREATE UNIQUE INDEX device_apns_tokens_pkey ON public.device_apns_tokens USING btree (device_id, token_type);

CREATE UNIQUE INDEX device_fcm_tokens_pkey ON public.device_fcm_tokens USING btree (device_id);

-- 主キー制約の追加
alter table "public"."devices" add constraint "devices_pkey" PRIMARY KEY using index "devices_pkey";

alter table "public"."devices" add constraint "devices_id_unique" UNIQUE using index "devices_id_unique";

alter table "public"."device_apns_tokens" add constraint "device_apns_tokens_pkey" PRIMARY KEY using index "device_apns_tokens_pkey";

alter table "public"."device_fcm_tokens" add constraint "device_fcm_tokens_pkey" PRIMARY KEY using index "device_fcm_tokens_pkey";

-- 外部キー制約の追加
alter table "public"."devices" add constraint "devices_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."devices" validate constraint "devices_user_id_fkey";

alter table "public"."device_apns_tokens" add constraint "device_apns_tokens_device_id_fkey" FOREIGN KEY (device_id) REFERENCES devices(id) ON DELETE CASCADE not valid;

alter table "public"."device_apns_tokens" validate constraint "device_apns_tokens_device_id_fkey";

alter table "public"."device_fcm_tokens" add constraint "device_fcm_tokens_device_id_fkey" FOREIGN KEY (device_id) REFERENCES devices(id) ON DELETE CASCADE not valid;

alter table "public"."device_fcm_tokens" validate constraint "device_fcm_tokens_device_id_fkey";

-- updated_atを自動更新するトリガー（device_apns_tokens用）
CREATE TRIGGER update_device_apns_tokens_updated_at before UPDATE ON public.device_apns_tokens FOR each ROW EXECUTE function public.update_updated_at_column ();

-- updated_atを自動更新するトリガー（device_fcm_tokens用）
CREATE TRIGGER update_device_fcm_tokens_updated_at before UPDATE ON public.device_fcm_tokens FOR each ROW EXECUTE function public.update_updated_at_column ();

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

-- Grant permissions
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
