-- スポンサー企業を登録
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    ),
    -- 企業IDを取得
    company_ids AS (
        SELECT
            id,
            name
        FROM
            public.companies
        WHERE
            name IN (
                '株式会社サイバーエージェント',
                'Hamee株式会社',
                'NTTレゾナントテクノロジー株式会社',
                '株式会社MIXI',
                'Sentry',
                '株式会社LayerX',
                'パイオニア株式会社',
                '株式会社メドレー',
                '株式会社ZOZO',
                '株式会社GENDA',
                '株式会社Linc''well',
                '株式会社ゆめみ',
                'CodeRabbit',
                'スタディプラス株式会社',
                '株式会社IBJ',
                '株式会社ディー・エヌ・エー',
                '株式会社ギークニア',
                '株式会社アサイン',
                '株式会社アイビス',
                '株式会社出前館',
                'エムスリー株式会社',
                'チームラボ',
                'ソニー株式会社'
            )
    )
INSERT INTO
    public.sponsor_companies (company_id, sponsor_type, created_at)
SELECT
    ci.id,
    'basic'::public.company_sponsor_type,
    ts
FROM
    company_ids ci
    CROSS JOIN timestamp;

-- ツールスポンサーのプランを設定
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    ),
    -- 企業IDを取得
    company_ids AS (
        SELECT
            id,
            name
        FROM
            public.companies
        WHERE
            name IN ('Kibela')
    )
INSERT INTO
    public.sponsor_companies (company_id, sponsor_type, created_at)
SELECT
    ci.id,
    'tool'::public.company_sponsor_type,
    ts
FROM
    company_ids ci
    CROSS JOIN timestamp;

-- ベーシックスポンサーのプランを設定
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.basic_sponsor_companies (sponsor_company_id, basic_plan_type, created_at)
SELECT
    sc.id,
    CASE
        WHEN c.name = '株式会社ゆめみ' THEN 'platinum'::public.basic_plan_type
        WHEN c.name = '株式会社出前館' THEN 'platinum'::public.basic_plan_type
        WHEN c.name = '株式会社アサイン' THEN 'platinum'::public.basic_plan_type
        WHEN c.name = '株式会社サイバーエージェント' THEN 'gold'::public.basic_plan_type
        WHEN c.name = '株式会社ZOZO' THEN 'silver'::public.basic_plan_type
        WHEN c.name = '株式会社GENDA' THEN 'silver'::public.basic_plan_type
        WHEN c.name = 'エムスリー株式会社' THEN 'silver'::public.basic_plan_type
        WHEN c.name = '株式会社Linc''well' THEN 'silver'::public.basic_plan_type
        WHEN c.name = '株式会社ディー・エヌ・エー' THEN 'silver'::public.basic_plan_type
        WHEN c.name = 'CodeRabbit' THEN 'silver'::public.basic_plan_type
        WHEN c.name = 'ソニー株式会社' THEN 'silver'::public.basic_plan_type
        WHEN c.name = 'チームラボ' THEN 'silver'::public.basic_plan_type
        WHEN c.name = '株式会社MIXI' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = 'スタディプラス株式会社' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = '株式会社ギークニア' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = 'Sentry' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = 'パイオニア株式会社' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = '株式会社メドレー' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = 'Hamee株式会社' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = '株式会社アイビス' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = '株式会社LayerX' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = 'NTTレゾナントテクノロジー株式会社' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = '株式会社IBJ' THEN 'bronze'::public.basic_plan_type
    END,
    ts
FROM
    public.sponsor_companies sc
    JOIN public.companies c ON sc.company_id = c.id
    CROSS JOIN timestamp
WHERE
    sc.sponsor_type = 'basic'
    AND c.name IN (
        '株式会社ゆめみ',
        '株式会社出前館',
        '株式会社アサイン',
        '株式会社サイバーエージェント',
        '株式会社ZOZO',
        '株式会社GENDA',
        'エムスリー株式会社',
        '株式会社Linc''well',
        '株式会社ディー・エヌ・エー',
        'CodeRabbit',
        'ソニー株式会社',
        'チームラボ',
        '株式会社MIXI',
        'スタディプラス株式会社',
        '株式会社ギークニア',
        'Sentry',
        'パイオニア株式会社',
        '株式会社メドレー',
        'Hamee株式会社',
        '株式会社アイビス',
        '株式会社LayerX',
        'NTTレゾナントテクノロジー株式会社',
        '株式会社IBJ'
    );

-- オプションプランの設定
-- ネーミングライツ・ホール
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.sponsor_company_options (sponsor_company_id, option_plan_type, created_at)
SELECT
    sc.id,
    'naming_rights_hall'::public.option_plan_type,
    ts
FROM
    public.sponsor_companies sc
    JOIN public.companies c ON sc.company_id = c.id
    CROSS JOIN timestamp
WHERE
    sc.sponsor_type = 'basic'
    AND c.name IN ('株式会社アサイン');

-- ネームプレート
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.sponsor_company_options (sponsor_company_id, option_plan_type, created_at)
SELECT
    sc.id,
    'nameplate'::public.option_plan_type,
    ts
FROM
    public.sponsor_companies sc
    JOIN public.companies c ON sc.company_id = c.id
    CROSS JOIN timestamp
WHERE
    sc.sponsor_type = 'basic'
    AND c.name IN ('株式会社ゆめみ');

-- 弁当
-- WITH
--     timestamp AS (
--         SELECT
--             '2025-06-01 00:00:00'::timestamp AS ts
--     )
-- INSERT INTO
--     public.sponsor_company_options (sponsor_company_id, option_plan_type, created_at)
-- SELECT
--     sc.id,
--     'lunch'::public.option_plan_type,
--     ts
-- FROM
--     public.sponsor_companies sc
--     JOIN public.companies c ON sc.company_id = c.id
--     CROSS JOIN timestamp
-- WHERE
--     sc.sponsor_type = 'basic'
--     AND c.name IN ();
-- スカラシップ
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.sponsor_company_options (sponsor_company_id, option_plan_type, created_at)
SELECT
    sc.id,
    'scholarship'::public.option_plan_type,
    ts
FROM
    public.sponsor_companies sc
    JOIN public.companies c ON sc.company_id = c.id
    CROSS JOIN timestamp
WHERE
    sc.sponsor_type = 'basic'
    AND c.name IN ('株式会社アサイン', '株式会社サイバーエージェント', '株式会社ZOZO', 'チームラボ', '株式会社MIXI', '株式会社LayerX');
