-- Add deleted_at column to users table for logical deletion
ALTER TABLE public.users ADD COLUMN deleted_at timestamp DEFAULT NULL;

-- Create index for better performance when filtering out deleted users
CREATE INDEX idx_users_deleted_at ON public.users(deleted_at);

-- Create index for better performance when querying active users
CREATE INDEX idx_users_active ON public.users(id) WHERE deleted_at IS NULL;
