drop function if exists "public"."get_ticket_count"(ticket_type_id text, OUT sold_count integer, OUT reserved_count integer);

drop function if exists "public"."get_ticket_option_count"(ticket_option_id text, OUT sold_count integer, OUT reserved_count integer);

set check_function_bodies = off;

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


CREATE OR REPLACE FUNCTION public.create_ticket_checkout(user_id uuid, ticket_type_id text, ticket_option_ids text[], stripe_checkout_session_id text, stripe_checkout_url text)
 RETURNS uuid
 LANGUAGE plpgsql
AS $function$
DECLARE
  v_checkout_session_id uuid;
  v_ticket_type_record record;
  v_option_record record;
  v_option_id text;
  v_sold_count integer;
  v_reserved_count integer;
  v_total_count integer;
BEGIN
  -- 対象チケットが期間中かどうか確認
  SELECT *
  INTO v_ticket_type_record
  FROM public.ticket_types
  WHERE id = ticket_type_id AND is_active = true;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'チケットタイプが見つからないか、非アクティブです: %', ticket_type_id;
  END IF;

  -- 販売期間の確認
  IF v_ticket_type_record.sale_starts_at IS NOT NULL AND now() < v_ticket_type_record.sale_starts_at THEN
    RAISE EXCEPTION 'チケットの販売期間前です';
  END IF;

  IF v_ticket_type_record.sale_ends_at IS NOT NULL AND now() > v_ticket_type_record.sale_ends_at THEN
    RAISE EXCEPTION 'チケットの販売期間が終了しています';
  END IF;

  -- 対象チケットオプションが期間中かどうか確認
  IF ticket_option_ids IS NOT NULL THEN
    FOREACH v_option_id IN ARRAY ticket_option_ids
    LOOP
      IF NOT EXISTS (
        SELECT 1 FROM public.ticket_options
        WHERE id = v_option_id AND ticket_type_id = create_ticket_checkout.ticket_type_id
      ) THEN
        RAISE EXCEPTION 'チケットオプションが見つからないか、指定されたチケットタイプに属していません: %', v_option_id;
      END IF;
    END LOOP;
  END IF;

  -- 対象チケットが残っているか確認
  SELECT sold_count, reserved_count INTO v_sold_count, v_reserved_count
  FROM v_ticket_counts
  WHERE ticket_type_id = create_ticket_checkout.ticket_type_id;

  v_total_count := v_sold_count + v_reserved_count;

  IF v_ticket_type_record.max_quantity IS NOT NULL AND v_total_count >= v_ticket_type_record.max_quantity THEN
    RAISE EXCEPTION 'チケットの在庫が不足しています。販売済み: %, 確保済み: %, 上限: %',
      v_sold_count, v_reserved_count, v_ticket_type_record.max_quantity;
  END IF;

      -- 対象チケットオプションが残っているか確認
  IF ticket_option_ids IS NOT NULL THEN
    FOREACH v_option_id IN ARRAY ticket_option_ids
    LOOP
      -- チケットオプションの情報を取得
      SELECT *
      INTO v_option_record
      FROM public.ticket_options
      WHERE id = v_option_id;

      -- max_quantityが設定されている場合のみ在庫制限をチェック
      IF v_option_record.max_quantity IS NOT NULL THEN
        -- チケットオプションの在庫状況を取得
        SELECT sold_count, reserved_count INTO v_sold_count, v_reserved_count
        FROM v_ticket_option_counts
        WHERE ticket_option_id = v_option_id;

        v_total_count := v_sold_count + v_reserved_count;

        IF v_total_count >= v_option_record.max_quantity THEN
          RAISE EXCEPTION 'チケットオプション % の在庫が不足しています。販売済み: %, 確保済み: %, 上限: %',
            v_option_id, v_sold_count, v_reserved_count, v_option_record.max_quantity;
        END IF;
      END IF;
    END LOOP;
  END IF;

  -- チェックアウトセッションを作成
  INSERT INTO public.ticket_checkout_sessions (
    user_id,
    ticket_type_id,
    status,
    stripe_checkout_session_id,
    stripe_checkout_url,
    expires_at
  ) VALUES (
    create_ticket_checkout.user_id,
    create_ticket_checkout.ticket_type_id,
    'pending',
    create_ticket_checkout.stripe_checkout_session_id,
    create_ticket_checkout.stripe_checkout_url,
    now() + interval '10 minutes'
  ) RETURNING id INTO v_checkout_session_id;

  -- チケットオプションを追加
  IF ticket_option_ids IS NOT NULL THEN
    FOREACH v_option_id IN ARRAY ticket_option_ids
    LOOP
      INSERT INTO public.ticket_checkout_options (
        checkout_session_id,
        ticket_option_id
      ) VALUES (
        v_checkout_session_id,
        v_option_id
      );
    END LOOP;
  END IF;

  RETURN v_checkout_session_id;
END;
$function$
;


