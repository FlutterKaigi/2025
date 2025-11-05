-- Add url column to sessions table for session detail page URL
ALTER TABLE "public"."sessions"
ADD COLUMN "url" text;

-- Add url column to timeline_events table for event detail page URL
ALTER TABLE "public"."timeline_events"
ADD COLUMN "url" text;
