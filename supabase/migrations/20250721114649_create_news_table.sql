-- Create news table
create table "public"."news" (
    "id" integer generated always as identity not null,
    "title" text not null,
    "url" text not null,
    "published_at" timestamp without time zone,
    "unpublished_at" timestamp without time zone,
    "created_at" timestamp without time zone not null default now(),
    "updated_at" timestamp without time zone not null default now()
);

alter table "public"."news" enable row level security;

-- Add primary key constraint
alter table "public"."news" add constraint "news_pkey" primary key ("id");

-- Add check constraint to ensure published_at is before unpublished_at if both are set
alter table "public"."news" add constraint "news_published_unpublished_check" 
check (
    (published_at is null or unpublished_at is null) or 
    (published_at < unpublished_at)
);

-- Create updated_at trigger
create or replace function update_news_updated_at()
returns trigger as $$
begin
    new.updated_at = now();
    return new;
end;
$$ language plpgsql;

create trigger news_updated_at_trigger
    before update on "public"."news"
    for each row
    execute function update_news_updated_at();

-- Create RLS policies
-- Allow read access to published news for everyone
create policy "Allow read access to published news" on "public"."news"
for select using (
    (published_at is null or published_at <= now()) and 
    (unpublished_at is null or unpublished_at > now())
);

-- Allow full access for admins (we'll handle admin check in the application layer)
create policy "Allow full access for admins" on "public"."news"
for all using (true) with check (true);

-- Create index for efficient querying of published news
create index idx_news_published on "public"."news" (published_at, unpublished_at) 
where published_at is not null;