-- Update session times and descriptions based on seed file changes

-- Update Keynote sessions (both Room A and Room B)
UPDATE sessions
SET
    description = 'このセッションThe "Flutter" Effect では、私の人生を大きく変えたFlutterとの出会いと、その影響についてお話しします。Flutterを学び始めた当初は、ただのモバイル開発フレームワークの一つとして触れていました。しかし、次第にその表現力と開発体験の楽しさに魅了され、Flutterを通じて自分の夢を形にすることができるようになりました。

Flutterでアプリを作り、発表を行い、記事を書く中で多くの人々とつながり、最終的にはGoogle Developer Expert(GDE)として活動する機会を得ました。このトークでは、その過程で得た学びや転機、そしてFlutterコミュニティへの感謝を共有します。

また、今年一年のFlutterの進化を振り返りながら、技術面・コミュニティ面の両方からFlutterがどのように成長してきたかを紹介します。Flutterが私に与えた影響と、これからFlutterがもたらす新しい可能性を一緒に感じていただければ幸いです。',
    starts_at = '2025-11-13 10:15:00+09',
    ends_at = '2025-11-13 10:45:00+09'
WHERE id IN ('c1d2e3f4-a5b6-c7d8-e9f0-1a2b3c4d5e6f', 'b8b1bb5e-cce5-5963-b94f-5e8fe75b72fb');

-- Update session times for sessions starting at 10:45 -> 11:00
UPDATE sessions
SET
    starts_at = '2025-11-13 11:00:00+09',
    ends_at = '2025-11-13 11:30:00+09'
WHERE id IN ('39ac68d6-23a9-4a4a-86c5-bb824d4b49ef', '5310edf0-8c3c-487f-bb4c-fb9a5c279a44');

-- Update session times for sessions starting at 11:30 -> 11:45
UPDATE sessions
SET
    starts_at = '2025-11-13 11:45:00+09',
    ends_at = '2025-11-13 12:15:00+09'
WHERE id IN ('fa66b859-460e-40f6-9869-9b43e258fed9', '23460014-6c50-481c-89dd-4d0edac5da67', '326b9576-1ce5-4521-9f2d-c237f3022d5d');

-- Update session times for sessions starting at 13:15 -> 13:30
UPDATE sessions
SET
    starts_at = '2025-11-13 13:30:00+09',
    ends_at = '2025-11-13 14:00:00+09'
WHERE id IN ('e308ec24-8f92-4ab1-a140-5c2e401bc465', '1f46ce6d-44f1-45ee-9738-17da3ebafa8b');

-- Update lightning talk session times
UPDATE sessions
SET
    starts_at = '2025-11-13 13:30:00+09',
    ends_at = '2025-11-13 13:35:00+09'
WHERE id = '4b65280a-17bb-4024-917f-c085c175a442';

UPDATE sessions
SET
    starts_at = '2025-11-13 13:35:00+09',
    ends_at = '2025-11-13 13:40:00+09'
WHERE id = '50df4571-171e-4bfc-81a0-f184d3d0645d';

UPDATE sessions
SET
    starts_at = '2025-11-13 13:40:00+09',
    ends_at = '2025-11-13 13:45:00+09'
WHERE id = '9be0af37-7db2-40ed-aec8-738dae9071da';

UPDATE sessions
SET
    starts_at = '2025-11-13 13:45:00+09',
    ends_at = '2025-11-13 13:50:00+09'
WHERE id = 'c0036d43-21be-4a6e-8fd5-3cb66fe8a183';

UPDATE sessions
SET
    starts_at = '2025-11-13 13:50:00+09',
    ends_at = '2025-11-13 13:55:00+09'
WHERE id = '06c860df-22a2-463a-91ea-0c5c1cd29a12';

-- Update session times for sessions starting at 14:00 -> 14:15
UPDATE sessions
SET
    starts_at = '2025-11-13 14:15:00+09',
    ends_at = '2025-11-13 14:45:00+09'
WHERE id IN ('c2a5915f-a849-4cb1-8718-99f56140d6d7', 'c5207df1-3c97-47f1-aa44-5d64586301fd', '102f0e36-8839-4c4c-85a9-a94082af1692');

-- Update session title for MCP session
UPDATE sessions
SET title = 'Dart and Flutter MCP serverで実現するAI駆動E2Eテスト整備と自動操作'
WHERE id = '102f0e36-8839-4c4c-85a9-a94082af1692';

-- Update session times for sessions starting at 15:00 -> 15:15
UPDATE sessions
SET
    starts_at = '2025-11-13 15:15:00+09',
    ends_at = '2025-11-13 15:45:00+09'
WHERE id IN ('4b6a22a1-7d3c-41c5-8a54-15ff13f349ca', '72de2ac4-5cad-408d-bc56-1919daf00f87', '8eaddaa9-b501-4c7e-8713-9b537a7475a3');

-- Update hands-on session end time (13:30 -> 16:00)
UPDATE sessions
SET ends_at = '2025-11-13 16:00:00+09'
WHERE id = '8821b3b8-f10d-4211-9ea5-ca1da325eac3';

-- Add student support timeline event (only if venue exists)
INSERT INTO timeline_events (title, starts_at, ends_at, venue_id, url)
SELECT '学生支援', '2025-11-13 10:45:00+09', '2025-11-13 12:15:00+09', '98807fe6-b381-40a7-8c33-30a024b9ca4f', NULL
WHERE EXISTS (SELECT 1 FROM session_venues WHERE id = '98807fe6-b381-40a7-8c33-30a024b9ca4f')
ON CONFLICT DO NOTHING;
