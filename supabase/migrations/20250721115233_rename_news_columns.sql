-- Rename columns in news table for better clarity
ALTER TABLE "public"."news" 
RENAME COLUMN "published_at" TO "starts_at";

ALTER TABLE "public"."news" 
RENAME COLUMN "unpublished_at" TO "ends_at";

-- Update the check constraint to use new column names
ALTER TABLE "public"."news" 
DROP CONSTRAINT "news_published_unpublished_check";

ALTER TABLE "public"."news" 
ADD CONSTRAINT "news_starts_ends_check" 
CHECK (
    (starts_at is null or ends_at is null) or 
    (starts_at < ends_at)
);

-- Drop and recreate the index with new column names
DROP INDEX idx_news_published;

CREATE INDEX idx_news_published ON "public"."news" (starts_at, ends_at) 
WHERE starts_at is not null;

-- Update RLS policies with new column names
DROP POLICY "Allow read access to published news" ON "public"."news";

CREATE POLICY "Allow read access to published news" ON "public"."news"
FOR SELECT USING (
    (starts_at is null or starts_at <= now()) and 
    (ends_at is null or ends_at > now())
);