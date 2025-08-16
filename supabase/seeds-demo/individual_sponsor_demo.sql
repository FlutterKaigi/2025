-- 個人スポンサー「blendthink」のデモデータ統合ファイル
-- このファイルは以下のデータを作成します：
-- 1. individuals: blendthinkユーザーの基本情報
-- 2. individual_drafts: blendthinkの掲載情報（名前、スラッグ、ロゴ、熱意、Xアカウント）
-- 3. individual_draft_approvals: 掲載情報の承認
-- 4. sponsor_individuals: blendthinkを個人スポンサーとして登録
-- 1. individuals テーブルのシードデータ
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.individuals (user_id, created_at, updated_at)
SELECT
    user_id::uuid,
    ts,
    ts
FROM
    (
        VALUES
            ('123e4567-e89b-12d3-a456-426614174000')
    ) AS individuals (user_id)
    CROSS JOIN timestamp;

-- 2. individual_drafts テーブルのシードデータ
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.individual_drafts (individual_id, name, slug, logo_name, enthusiasm, x_account, created_at, updated_at)
SELECT
    individual_id,
    name,
    slug,
    logo_name,
    enthusiasm,
    x_account,
    ts,
    ts
FROM
    (
        VALUES
            (1, 'blendthink', 'blendthink', 'blendthink', '開発頑張る', 'blendthink')
    ) AS drafts (individual_id, name, slug, logo_name, enthusiasm, x_account)
    CROSS JOIN timestamp;

-- 3. individual_drafts の全てのレコードを承認ユーザーで承認する
WITH
    draft_ids AS (
        SELECT
            id
        FROM
            public.individual_drafts
    ),
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.individual_draft_approvals (individual_draft_id, approved_by, created_at)
SELECT
    id,
    '123e4567-e89b-12d3-a456-426614174000'::uuid,
    ts
FROM
    draft_ids
    CROSS JOIN timestamp;

-- 4. sponsor_individuals テーブルのシードデータ
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.sponsor_individuals (individual_id, created_at)
SELECT
    individual_id,
    ts
FROM
    (
        VALUES
            (1)
    ) AS sponsor_individuals (individual_id)
    CROSS JOIN timestamp;
