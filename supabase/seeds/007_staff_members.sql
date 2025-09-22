WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.staff_members (name, icon_name, greeting, created_at, updated_at)
SELECT
    name,
    icon_name,
    greeting,
    ts,
    ts
FROM
    (
        VALUES
            ('FlutterKaigi', 'a7b2c8d4-3e5f-4a1b-9c2d-8f4e6a3b7c9d.webp', 'FlutterKaigi is a conference for Flutter developers.')
    ) AS staff_members (name, icon_name, greeting)
    CROSS JOIN timestamp;
