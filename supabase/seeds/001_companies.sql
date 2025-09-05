WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.companies (name, logo_name, created_at, updated_at)
SELECT
    name,
    logo_name,
    ts,
    ts
FROM
    (
        VALUES
            ('株式会社ゆめみ', '1faeb563-9e1c-4f56-96ab-32d45bab81d0.webp'),
            ('株式会社出前館', 'd1c33512-f3dc-4f53-b099-3193fa495df0.webp'),
            ('株式会社アサイン', 'ecc75bda-1dda-4693-81c3-fee61f8c9d8d.webp'),
            ('RevenueCat, Inc.', 'bacfba76-0a04-4a02-b67a-7e05245efeeb.webp'),
            ('Flutter', '79c925a9-40c3-4d6a-9c99-0fe0ccfc5f2b.webp'),
            ('株式会社サイバーエージェント', 'e9f3db7b-3742-4763-b8ff-9bc6a34050a2.webp'),
            ('株式会社iiba', '5e66a21e-0539-4eb7-8546-7077d2b91ace.webp'),
            ('シンプレクス株式会社', '37531bac-96ce-41da-a1a0-93b948e16440.webp'),
            ('Codemagic', 'fe7aef86-b75f-46fc-ba97-3c47095bc68d.webp'),
            ('株式会社MagicPod', '4b5f8de2-a2fd-413f-8785-47ee0096cec1.webp'),
            ('株式会社ZOZO', '1081d25c-46d3-4620-bc9b-66ee70a356bb.webp'),
            ('株式会社GENDA', '44a6529b-c7fd-4e34-8c65-07cfab1143f8.webp'),
            ('エムスリー株式会社', '18518903-01a8-43e8-857a-56cb8d478ef8.webp'),
            ('株式会社Linc''well', 'afae8fe0-b0d8-43c9-85e3-aa82ef30d001.webp'),
            ('株式会社ディー・エヌ・エー', '04feaac2-4660-4260-b66c-e5d8a071d219.webp'),
            ('CodeRabbit', '6ebbd536-cc3d-43a3-9138-1294f7b2088e.webp'),
            ('株式会社YOUTRUST', '9a5aabf0-1268-478d-9811-dee1ee483ac0.webp'),
            ('ソニー株式会社', '31303bcb-0fe0-42d2-a870-3d7fcf0d1ac3.webp'),
            ('チームラボ', '505e878e-3372-43e7-b3be-7c790258428f.webp'),
            ('株式会社hacomono', '3c10e94c-c7bb-458a-a7a3-4fdfa5e5bbe6.webp'),
            ('SODA inc.', '2bdfe925-6d50-47c9-bbfc-9f44e89d9ccc.webp'),
            ('株式会社MIXI', '53366548-10d0-4272-8bb6-462321f51e4d.webp'),
            ('スタディプラス株式会社', '95fc9aaa-38d1-482b-ac8f-fe9bdb9db0a7.webp'),
            ('株式会社ギークニア', '47c20891-cb0b-48b0-8f32-aec3856a2a4e.webp'),
            ('Sentry', '424643b3-4119-45e2-bb58-bdad2cd4ee48.webp'),
            ('パイオニア株式会社', 'e1a96c10-fa3f-4036-aad2-4da3aa063b86.webp'),
            ('株式会社メドレー', '1c402e3a-eaa9-4a45-b87b-6547b156ee49.webp'),
            ('Hamee株式会社', 'ea8c5639-f5fb-4674-9381-bca60d900b84.webp'),
            ('株式会社アイビス', '2c34b7ee-dedf-46fb-b242-4d9af76aa789.webp'),
            ('株式会社LayerX', 'f9a4166a-fe62-4c06-b299-716adf12feb4.webp'),
            ('NTTレゾナントテクノロジー株式会社', '26972169-bf9c-4995-bb1f-4d58bd9a5eb0.webp'),
            ('株式会社IBJ', '503729ef-f6bf-479d-8f28-cd0e8c86770b.webp'),
            ('株式会社メンバーズ', '5d4ed5e9-3094-4af1-b416-3f7a66e4571d.webp'),
            ('株式会社TRUSTDOCK', '0aeb866e-87c0-4ff8-804f-e211d7be569e.webp'),
            ('GMOコネクト株式会社', 'aa5de3ec-e1fb-484c-92e1-0062ddf2f3af.webp'),
            ('株式会社Leafea', '53ed94d7-7e82-4e91-bdc5-c935da1c4bb2.webp'),
            ('東急株式会社', 'e3838530-1cf0-4ba6-832b-a3aaefcc4cc0.webp'),
            ('株式会社UPSIDER', '325a5575-b92b-44b9-9f15-0f7ff4c2ff95.webp'),
            ('Kibela', '6baf4450-7dd1-4f37-9480-207748abd562.webp')
    ) AS companies (name, logo_name)
    CROSS JOIN timestamp;
