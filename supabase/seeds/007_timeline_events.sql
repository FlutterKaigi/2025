-- DELETE FROM timeline_events;

-- Insert timeline events data
-- venue IDs: Room A = 'e1a11efe-b1eb-43e1-ae60-9d2233e5dfe7', Room B = '0505c447-b699-4803-aab9-9cbdf9452c1b'
INSERT INTO timeline_events (title, starts_at, ends_at, venue_id, url) VALUES
    -- 開場 (no venue)
    ('開場', '2025-11-13 09:00:00+09', NULL, NULL, NULL),

    -- 挨拶 (Room A)
    ('挨拶', '2025-11-13 10:00:00+09', '2025-11-13 10:15:00+09', 'e1a11efe-b1eb-43e1-ae60-9d2233e5dfe7', NULL),

    -- 挨拶（サテライト） (Room B)
    ('挨拶（サテライト）', '2025-11-13 10:00:00+09', '2025-11-13 10:15:00+09', '0505c447-b699-4803-aab9-9cbdf9452c1b', NULL),

    -- キーノートはセッションとして管理されるため、timeline_eventsから削除
    -- ('The Flutter Effect', '2025-11-13 10:15:00+09', '2025-11-13 10:30:00+09', 'e1a11efe-b1eb-43e1-ae60-9d2233e5dfe7', NULL),
    -- ('The Flutter Effect（サテライト）', '2025-11-13 10:15:00+09', '2025-11-13 10:30:00+09', '0505c447-b699-4803-aab9-9cbdf9452c1b', NULL),

    -- ランチ (no venue)
    ('ランチ', '2025-11-13 12:00:00+09', '2025-11-13 13:30:00+09', NULL, NULL),

    -- 懇親会 (Room A)
    ('懇親会', '2025-11-13 18:30:00+09', NULL, 'e1a11efe-b1eb-43e1-ae60-9d2233e5dfe7', NULL),

    -- 懇親会 (Room B)
    ('懇親会', '2025-11-13 18:30:00+09', NULL, '0505c447-b699-4803-aab9-9cbdf9452c1b', NULL);
