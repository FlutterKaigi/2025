-- 個人スポンサー「blendthink」のデモデータ統合ファイル
-- このファイルは以下のデータを作成します：
-- 1. individuals: blendthinkユーザーの基本情報
-- 2. individual_drafts: blendthinkの掲載情報（名前、スラッグ、ロゴ、熱意、Xアカウント）
-- 3. individual_draft_approvals: 掲載情報の承認
-- 4. sponsor_individuals: blendthinkを個人スポンサーとして登録
-- 共通のCTE定義
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    ),
    target_user_id AS (
        SELECT
            '123e4567-e89b-12d3-a456-426614174000'::uuid AS user_id
    ),
    individual_record AS (
        SELECT
            id
        FROM
            public.individuals
        WHERE
            user_id = (
                SELECT
                    user_id
                FROM
                    target_user_id
            )
    )
    -- 1. individuals テーブルのシードデータ（既存データがある場合はスキップ）
INSERT INTO
    public.individuals (user_id, created_at, updated_at)
SELECT
    (
        SELECT
            user_id
        FROM
            target_user_id
    ),
    (
        SELECT
            ts
        FROM
            timestamp
    ),
    (
        SELECT
            ts
        FROM
            timestamp
    )
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            individual_record
    );

-- 2. individual_drafts テーブルのシードデータ（既存データがある場合はスキップ）
WITH
    existing_draft AS (
        SELECT
            id
        FROM
            public.individual_drafts
        WHERE
            individual_id = (
                SELECT
                    id
                FROM
                    public.individuals
                WHERE
                    user_id = '123e4567-e89b-12d3-a456-426614174000'::uuid
            )
    )
INSERT INTO
    public.individual_drafts (individual_id, logo_name, created_at, updated_at)
SELECT
    (
        SELECT
            id
        FROM
            public.individuals
        WHERE
            user_id = '123e4567-e89b-12d3-a456-426614174000'::uuid
    ),
    'blendthink',
    '2025-06-01 00:00:00'::timestamp,
    '2025-06-01 00:00:00'::timestamp
WHERE
    EXISTS (
        SELECT
            1
        FROM
            public.individuals
        WHERE
            user_id = '123e4567-e89b-12d3-a456-426614174000'::uuid
    )
    AND NOT EXISTS (
        SELECT
            1
        FROM
            existing_draft
    );

-- 3. individual_drafts の全てのレコードを承認ユーザーで承認する（既存の承認がある場合はスキップ）
WITH
    draft_ids AS (
        SELECT
            id
        FROM
            public.individual_drafts
        WHERE
            individual_id = (
                SELECT
                    id
                FROM
                    public.individuals
                WHERE
                    user_id = '123e4567-e89b-12d3-a456-426614174000'::uuid
            )
            AND NOT EXISTS (
                SELECT
                    1
                FROM
                    public.individual_draft_approvals
                WHERE
                    individual_draft_id = id
            )
    )
INSERT INTO
    public.individual_draft_approvals (individual_draft_id, approved_by, created_at)
SELECT
    id,
    '123e4567-e89b-12d3-a456-426614174000'::uuid,
    '2025-06-01 00:00:00'::timestamp
FROM
    draft_ids;

-- 4. sponsor_individuals テーブルのシードデータ（既存データがある場合はスキップ）
WITH
    existing_sponsor AS (
        SELECT
            id
        FROM
            public.sponsor_individuals
        WHERE
            individual_id = (
                SELECT
                    id
                FROM
                    public.individuals
                WHERE
                    user_id = '123e4567-e89b-12d3-a456-426614174000'::uuid
            )
    )
INSERT INTO
    public.sponsor_individuals (individual_id, created_at)
SELECT
    (
        SELECT
            id
        FROM
            public.individuals
        WHERE
            user_id = '123e4567-e89b-12d3-a456-426614174000'::uuid
    ),
    '2025-06-01 00:00:00'::timestamp
WHERE
    EXISTS (
        SELECT
            1
        FROM
            public.individuals
        WHERE
            user_id = '123e4567-e89b-12d3-a456-426614174000'::uuid
    )
    AND NOT EXISTS (
        SELECT
            1
        FROM
            existing_sponsor
    );
