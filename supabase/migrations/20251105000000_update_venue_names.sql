-- Update venue names to sponsor/room names
-- Hall A → ASSIGN Hall
-- Hall B → RevenueCat Hall
-- Room A → Skia
-- Room B → Impeller

UPDATE "public"."session_venues"
SET "name" = 'ASSIGN Hall'
WHERE "name" = 'Hall A';

UPDATE "public"."session_venues"
SET "name" = 'RevenueCat Hall'
WHERE "name" = 'Hall B';

UPDATE "public"."session_venues"
SET "name" = 'Skia'
WHERE "name" = 'Room A';

UPDATE "public"."session_venues"
SET "name" = 'Impeller'
WHERE "name" = 'Room B';
