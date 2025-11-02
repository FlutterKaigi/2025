-- Add display_order column to session_venues table
ALTER TABLE "public"."session_venues"
ADD COLUMN "display_order" integer NOT NULL DEFAULT 0;

-- Add index for efficient ordering
CREATE INDEX session_venues_display_order_idx ON public.session_venues USING btree (display_order);
