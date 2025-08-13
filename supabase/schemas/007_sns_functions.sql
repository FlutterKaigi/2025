-- [user_id]のSNSアカウントを更新する関数
-- [sns_accounts]はJSONB型の配列で、各要素は以下のような形式です。
-- {type: sns_type, value: string}[]
-- 実行すると、既存のSNSアカウント登録は削除され、全てのSNSアカウントが新しいものに更新されます。
CREATE OR REPLACE FUNCTION public.replace_user_sns_links (user_id uuid, sns_accounts jsonb) returns void language plpgsql AS $$
BEGIN
  -- 既存のSNSアカウント情報を削除
  DELETE FROM public.user_sns_links WHERE user_sns_links.user_id = replace_user_sns_links.user_id;

  -- 新しいSNSアカウント情報を挿入
  -- sns_accountsが空でない場合のみ挿入
  IF jsonb_array_length(sns_accounts) > 0 THEN
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
$$;

-- 使用例:
-- SELECT public.replace_user_sns_links(
--   '123e4567-e89b-12d3-a456-426614174000'::uuid,
--   '[
--     {"type": "github", "value": "username"},
--     {"type": "x", "value": "twitter_handle"},
--     {"type": "qiita", "value": "qiita_user"}
--   ]'::jsonb
-- );

