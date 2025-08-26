set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.replace_user_sns_links(user_id uuid, sns_accounts jsonb)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
BEGIN
  -- 既存のSNSアカウント情報を削除
  DELETE FROM public.user_sns_links WHERE user_sns_links.user_id = replace_user_sns_links.user_id;

  -- 新しいSNSアカウント情報を挿入
  -- sns_accountsがnullでない、配列である、かつ空でない場合のみ挿入
  IF sns_accounts IS NOT NULL AND jsonb_typeof(sns_accounts) = 'array' AND jsonb_array_length(sns_accounts) > 0 THEN
    INSERT INTO public.user_sns_links (user_id, sns_type, value, created_at, updated_at)
    SELECT
      replace_user_sns_links.user_id,
      CAST(j->>'type' AS public.sns_type),
      trim(j->>'value'),
      current_timestamp,
      current_timestamp
    FROM jsonb_array_elements(sns_accounts) AS j
    WHERE trim(j->>'value') != '';
  END IF;
END;
$function$
;


