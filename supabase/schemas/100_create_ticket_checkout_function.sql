-- チケットの残数を取得する
CREATE OR REPLACE FUNCTION get_ticket_count (ticket_type_id text, OUT sold_count integer, OUT reserved_count integer) language plpgsql volatile AS $$
BEGIN
  -- チケットタイプが存在するかチェック
  IF NOT EXISTS (
    SELECT 1 FROM public.ticket_types tt
    WHERE tt.id = get_ticket_count.ticket_type_id
  ) THEN
    RAISE EXCEPTION 'チケットタイプが見つかりません: %', ticket_type_id;
  END IF;

  -- 販売済みのチケット枚数を取得（ticket_purchases table）
  SELECT COUNT(*)
  INTO sold_count
  FROM public.ticket_purchases tp
  WHERE tp.ticket_type_id = get_ticket_count.ticket_type_id;

  -- 枠確保済みのチケット枚数を取得（ticket_checkout_sessions table）
  -- pending状態でまだ期限切れでないもの
  SELECT COUNT(*)
  INTO reserved_count
  FROM public.ticket_checkout_sessions tcs
  WHERE tcs.ticket_type_id = get_ticket_count.ticket_type_id
    AND tcs.status = 'pending'
    AND tcs.expires_at > now();
END;
$$;

-- チケットオプションの残数を取得する
CREATE OR REPLACE FUNCTION get_ticket_option_count (ticket_option_id text, OUT sold_count integer, OUT reserved_count integer) language plpgsql volatile AS $$
BEGIN
  -- チケットオプションが存在するかチェック
  IF NOT EXISTS (
    SELECT 1 FROM public.ticket_options t_opt
    WHERE t_opt.id = get_ticket_option_count.ticket_option_id
  ) THEN
    RAISE EXCEPTION 'チケットオプションが見つかりません: %', ticket_option_id;
  END IF;

  -- 販売済みのチケットオプション枚数を取得（ticket_purchase_options table）
  SELECT COUNT(*)
  INTO sold_count
  FROM public.ticket_purchase_options tpo
  JOIN public.ticket_purchases tp ON tpo.ticket_purchase_id = tp.id
  WHERE tpo.ticket_option_id = get_ticket_option_count.ticket_option_id
    AND tp.status = 'completed';

  -- 枠確保済みのチケットオプション枚数を取得（ticket_checkout_options table）
  -- pending状態でまだ期限切れでないもの
  SELECT COUNT(*)
  INTO reserved_count
  FROM public.ticket_checkout_options tco
  JOIN public.ticket_checkout_sessions tcs ON tco.checkout_session_id = tcs.id
  WHERE tco.ticket_option_id = get_ticket_option_count.ticket_option_id
    AND tcs.status = 'pending'
    AND tcs.expires_at > now();
END;
$$;

CREATE FUNCTION create_ticket_checkout (user_id uuid, ticket_type_id text, ticket_option_ids TEXT[], stripe_checkout_session_id text, stripe_checkout_url text) returns uuid language plpgsql AS $$
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
  FROM get_ticket_count(ticket_type_id);

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
        FROM get_ticket_option_count(v_option_id);

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
$$
