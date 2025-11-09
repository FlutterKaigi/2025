-- Create timeline_events table
CREATE TABLE "public"."timeline_events" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4 (),
  "title" text NOT NULL,
  "starts_at" TIMESTAMP WITH TIME ZONE NOT NULL,
  "ends_at" TIMESTAMP WITH TIME ZONE,
  "venue_id" uuid,
  "url" text,
  "created_at" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

ALTER TABLE "public"."timeline_events" enable ROW level security;

CREATE UNIQUE INDEX timeline_events_pkey ON public.timeline_events USING btree (id);

ALTER TABLE "public"."timeline_events"
ADD CONSTRAINT "timeline_events_pkey" PRIMARY KEY USING index "timeline_events_pkey";

ALTER TABLE "public"."timeline_events"
ADD CONSTRAINT "timeline_events_venue_id_fkey" FOREIGN key (venue_id) REFERENCES session_venues (id);
