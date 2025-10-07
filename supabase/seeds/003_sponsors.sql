-- スポンサー企業を登録
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.sponsor_companies (company_id, sponsor_type, display_order, created_at)
SELECT
    c.id,
    'basic'::public.company_sponsor_type,
    CASE
        WHEN c.name = '株式会社ゆめみ' THEN '01_01'
        WHEN c.name = '株式会社出前館' THEN '01_02'
        WHEN c.name = '株式会社アサイン' THEN '01_03'
        WHEN c.name = 'RevenueCat, Inc.' THEN '01_04'
        WHEN c.name = 'Flutter' THEN '01_05'
        WHEN c.name = '株式会社サイバーエージェント' THEN '02_01'
        WHEN c.name = '株式会社iiba' THEN '02_02'
        WHEN c.name = 'シンプレクス株式会社' THEN '02_03'
        WHEN c.name = 'Codemagic' THEN '02_04'
        WHEN c.name = '株式会社MagicPod' THEN '02_05'
        WHEN c.name = '株式会社ZOZO' THEN '03_01'
        WHEN c.name = '株式会社GENDA' THEN '03_02'
        WHEN c.name = 'エムスリー株式会社' THEN '03_03'
        WHEN c.name = '株式会社Linc''well' THEN '03_04'
        WHEN c.name = '株式会社ディー・エヌ・エー' THEN '03_05'
        WHEN c.name = 'CodeRabbit' THEN '03_06'
        WHEN c.name = '株式会社YOUTRUST' THEN '03_07'
        WHEN c.name = 'ソニー株式会社' THEN '03_08'
        WHEN c.name = 'チームラボ' THEN '03_09'
        WHEN c.name = '株式会社hacomono' THEN '03_10'
        WHEN c.name = 'SODA inc.' THEN '03_11'
        WHEN c.name = '株式会社MIXI' THEN '04_01'
        WHEN c.name = 'スタディプラス株式会社' THEN '04_02'
        WHEN c.name = '株式会社ギークニア' THEN '04_03'
        WHEN c.name = 'Sentry' THEN '04_04'
        WHEN c.name = 'パイオニア株式会社' THEN '04_05'
        WHEN c.name = '株式会社メドレー' THEN '04_06'
        WHEN c.name = 'Hamee株式会社' THEN '04_07'
        WHEN c.name = '株式会社アイビス' THEN '04_08'
        WHEN c.name = '株式会社LayerX' THEN '04_09'
        WHEN c.name = 'NTTレゾナントテクノロジー株式会社' THEN '04_10'
        WHEN c.name = '株式会社IBJ' THEN '04_11'
        WHEN c.name = '株式会社メンバーズ' THEN '04_12'
        WHEN c.name = '株式会社TRUSTDOCK' THEN '04_13'
        WHEN c.name = 'GMOコネクト株式会社' THEN '04_14'
        WHEN c.name = '株式会社Leafea' THEN '04_15'
        WHEN c.name = '東急株式会社' THEN '04_16'
        WHEN c.name = '株式会社UPSIDER' THEN '04_17'
    END,
    ts
FROM
    public.companies c
    CROSS JOIN timestamp
WHERE
    c.name IN (
        '株式会社ゆめみ',
        '株式会社出前館',
        '株式会社アサイン',
        'RevenueCat, Inc.',
        'Flutter',
        '株式会社サイバーエージェント',
        '株式会社iiba',
        'シンプレクス株式会社',
        'Codemagic',
        '株式会社MagicPod',
        '株式会社ZOZO',
        '株式会社GENDA',
        'エムスリー株式会社',
        '株式会社Linc''well',
        '株式会社ディー・エヌ・エー',
        'CodeRabbit',
        '株式会社YOUTRUST',
        'ソニー株式会社',
        'チームラボ',
        '株式会社hacomono',
        'SODA inc.',
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
        '株式会社IBJ',
        '株式会社メンバーズ',
        '株式会社TRUSTDOCK',
        'GMOコネクト株式会社',
        '株式会社Leafea',
        '東急株式会社',
        '株式会社UPSIDER'
    );

-- ツールスポンサーのプランを設定
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.sponsor_companies (company_id, sponsor_type, display_order, created_at)
SELECT
    c.id,
    'tool'::public.company_sponsor_type,
    CASE
        WHEN c.name = 'Kibela' THEN '05_01'
    END,
    ts
FROM
    public.companies c
    CROSS JOIN timestamp
WHERE
    c.name IN ('Kibela');

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
        WHEN c.name = 'RevenueCat, Inc.' THEN 'platinum'::public.basic_plan_type
        WHEN c.name = 'Flutter' THEN 'platinum'::public.basic_plan_type
        WHEN c.name = '株式会社サイバーエージェント' THEN 'gold'::public.basic_plan_type
        WHEN c.name = '株式会社iiba' THEN 'gold'::public.basic_plan_type
        WHEN c.name = 'シンプレクス株式会社' THEN 'gold'::public.basic_plan_type
        WHEN c.name = 'Codemagic' THEN 'gold'::public.basic_plan_type
        WHEN c.name = '株式会社MagicPod' THEN 'gold'::public.basic_plan_type
        WHEN c.name = '株式会社ZOZO' THEN 'silver'::public.basic_plan_type
        WHEN c.name = '株式会社GENDA' THEN 'silver'::public.basic_plan_type
        WHEN c.name = 'エムスリー株式会社' THEN 'silver'::public.basic_plan_type
        WHEN c.name = '株式会社Linc''well' THEN 'silver'::public.basic_plan_type
        WHEN c.name = '株式会社ディー・エヌ・エー' THEN 'silver'::public.basic_plan_type
        WHEN c.name = 'CodeRabbit' THEN 'silver'::public.basic_plan_type
        WHEN c.name = '株式会社YOUTRUST' THEN 'silver'::public.basic_plan_type
        WHEN c.name = 'ソニー株式会社' THEN 'silver'::public.basic_plan_type
        WHEN c.name = 'チームラボ' THEN 'silver'::public.basic_plan_type
        WHEN c.name = '株式会社hacomono' THEN 'silver'::public.basic_plan_type
        WHEN c.name = 'SODA inc.' THEN 'silver'::public.basic_plan_type
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
        WHEN c.name = '株式会社メンバーズ' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = '株式会社TRUSTDOCK' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = 'GMOコネクト株式会社' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = '株式会社Leafea' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = '東急株式会社' THEN 'bronze'::public.basic_plan_type
        WHEN c.name = '株式会社UPSIDER' THEN 'bronze'::public.basic_plan_type
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
        'RevenueCat, Inc.',
        'Flutter',
        '株式会社サイバーエージェント',
        '株式会社iiba',
        'シンプレクス株式会社',
        'Codemagic',
        '株式会社MagicPod',
        '株式会社ZOZO',
        '株式会社GENDA',
        'エムスリー株式会社',
        '株式会社Linc''well',
        '株式会社ディー・エヌ・エー',
        'CodeRabbit',
        '株式会社YOUTRUST',
        'ソニー株式会社',
        'チームラボ',
        '株式会社hacomono',
        'SODA inc.',
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
        '株式会社IBJ',
        '株式会社メンバーズ',
        '株式会社TRUSTDOCK',
        'GMOコネクト株式会社',
        '株式会社Leafea',
        '東急株式会社',
        '株式会社UPSIDER'
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
    AND c.name IN ('株式会社アサイン', 'RevenueCat, Inc.');

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
WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.sponsor_company_options (sponsor_company_id, option_plan_type, created_at)
SELECT
    sc.id,
    'lunch'::public.option_plan_type,
    ts
FROM
    public.sponsor_companies sc
    JOIN public.companies c ON sc.company_id = c.id
    CROSS JOIN timestamp
WHERE
    sc.sponsor_type = 'basic'
    AND c.name IN ('株式会社TRUSTDOCK');

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
