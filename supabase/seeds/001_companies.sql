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
            ('株式会社サイバーエージェント', 'e9f3db7b-3742-4763-b8ff-9bc6a34050a2.webp'),
            ('株式会社ZOZO', '1081d25c-46d3-4620-bc9b-66ee70a356bb.webp'),
            ('株式会社GENDA', '44a6529b-c7fd-4e34-8c65-07cfab1143f8.webp'),
            ('エムスリー株式会社', '18518903-01a8-43e8-857a-56cb8d478ef8.webp'),
            ('株式会社Linc''well', 'afae8fe0-b0d8-43c9-85e3-aa82ef30d001.webp'),
            ('株式会社ディー・エヌ・エー', '04feaac2-4660-4260-b66c-e5d8a071d219.webp'),
            ('CodeRabbit', '6ebbd536-cc3d-43a3-9138-1294f7b2088e.webp'),
            ('ソニー株式会社', '31303bcb-0fe0-42d2-a870-3d7fcf0d1ac3.webp'),
            ('チームラボ', '505e878e-3372-43e7-b3be-7c790258428f.webp'),
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
            ('株式会社IBJ', '503729ef-f6bf-479d-8f28-cd0e8c86770b.webp')
    ) AS companies (name, logo_name)
    CROSS JOIN timestamp;
