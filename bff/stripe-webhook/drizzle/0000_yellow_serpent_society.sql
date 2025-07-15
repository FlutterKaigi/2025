-- Current sql file was generated after introspecting the database
-- If you want to run this migration please uncomment this code before executing migrations
/*
CREATE TYPE "public"."role" AS ENUM('admin', 'staff', 'sponsor', 'speaker', 'viewer', 'attendee');--> statement-breakpoint
CREATE TYPE "public"."ticket_checkout_status" AS ENUM('pending', 'completed');--> statement-breakpoint
CREATE TYPE "public"."ticket_purchase_status" AS ENUM('completed', 'refunded');--> statement-breakpoint
CREATE TABLE "users" (
	"id" uuid PRIMARY KEY NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"deleted_at" timestamp
);
--> statement-breakpoint
ALTER TABLE "users" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "companies" (
	"id" smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "companies_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 32767 START WITH 1 CACHE 1),
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "companies" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "stripe_webhook_logs" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "stripe_webhook_logs_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"stripe_event_id" text NOT NULL,
	"event_type" text NOT NULL,
	"payment_intent_id" text,
	"processed" boolean DEFAULT false,
	"error_message" text,
	"raw_data" jsonb NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "stripe_webhook_logs_stripe_event_id_key" UNIQUE("stripe_event_id")
);
--> statement-breakpoint
ALTER TABLE "stripe_webhook_logs" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "ticket_options" (
	"id" text PRIMARY KEY NOT NULL,
	"ticket_type_id" text NOT NULL,
	"name" text NOT NULL,
	"description" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "ticket_options" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "ticket_purchase_options" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v7() NOT NULL,
	"ticket_purchase_id" uuid NOT NULL,
	"ticket_option_id" text NOT NULL,
	"option_value" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "ticket_purchase_options_ticket_purchase_id_ticket_option_id_key" UNIQUE("ticket_purchase_id","ticket_option_id")
);
--> statement-breakpoint
ALTER TABLE "ticket_purchase_options" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "individuals" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "individuals_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"user_id" uuid,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "individuals_user_id_key" UNIQUE("user_id")
);
--> statement-breakpoint
ALTER TABLE "individuals" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "ticket_purchases" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v7() NOT NULL,
	"user_id" uuid NOT NULL,
	"ticket_type_id" text NOT NULL,
	"status" "ticket_purchase_status" DEFAULT 'completed' NOT NULL,
	"stripe_payment_intent_id" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "ticket_purchases_user_id_ticket_type_id_key" UNIQUE("user_id","ticket_type_id")
);
--> statement-breakpoint
ALTER TABLE "ticket_purchases" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "ticket_types" (
	"id" text PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"price" integer NOT NULL,
	"max_quantity" integer,
	"description" text,
	"is_active" boolean DEFAULT true,
	"sale_starts_at" timestamp with time zone,
	"sale_ends_at" timestamp with time zone,
	"url" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "ticket_types_name_key" UNIQUE("name")
);
--> statement-breakpoint
ALTER TABLE "ticket_types" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "company_draft_approvals" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "company_draft_approvals_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"company_draft_id" smallint,
	"approved_by" uuid,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "company_draft_approvals" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "company_invitation" (
	"company_id" smallint,
	"key" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	"disabled_at" timestamp,
	CONSTRAINT "company_invitation_key_key" UNIQUE("key"),
	CONSTRAINT "company_invitation_key_check" CHECK (key <> ''::text)
);
--> statement-breakpoint
ALTER TABLE "company_invitation" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "company_drafts" (
	"id" smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "company_drafts_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 32767 START WITH 1 CACHE 1),
	"company_id" smallint,
	"name" text NOT NULL,
	"logo_name" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	"slug" text NOT NULL,
	CONSTRAINT "company_drafts_slug_key" UNIQUE("slug"),
	CONSTRAINT "company_drafts_name_check" CHECK (name <> ''::text),
	CONSTRAINT "company_drafts_slug_check" CHECK (slug <> ''::text)
);
--> statement-breakpoint
ALTER TABLE "company_drafts" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "ticket_checkout_options" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v7() NOT NULL,
	"checkout_session_id" uuid NOT NULL,
	"ticket_option_id" text NOT NULL,
	"option_value" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "ticket_checkout_options_checkout_session_id_ticket_option_i_key" UNIQUE("checkout_session_id","ticket_option_id")
);
--> statement-breakpoint
ALTER TABLE "ticket_checkout_options" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "ticket_checkout_sessions" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v7() NOT NULL,
	"user_id" uuid NOT NULL,
	"ticket_type_id" text NOT NULL,
	"status" "ticket_checkout_status" DEFAULT 'pending' NOT NULL,
	"stripe_payment_intent_id" text,
	"stripe_checkout_session_id" text,
	"total_amount" integer NOT NULL,
	"expires_at" timestamp with time zone DEFAULT (now() + '00:30:00'::interval) NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "ticket_checkout_sessions_user_id_ticket_type_id_status_key" UNIQUE("user_id","ticket_type_id","status")
);
--> statement-breakpoint
ALTER TABLE "ticket_checkout_sessions" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "individual_draft_approvals" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "individual_draft_approvals_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"individual_draft_id" integer,
	"approved_by" uuid,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "individual_draft_approvals" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "individual_drafts" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "individual_drafts_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"individual_id" integer,
	"name" text NOT NULL,
	"logo_name" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	"slug" text NOT NULL,
	CONSTRAINT "individual_drafts_slug_key" UNIQUE("slug"),
	CONSTRAINT "individual_drafts_name_check" CHECK (name <> ''::text),
	CONSTRAINT "individual_drafts_slug_check" CHECK (slug <> ''::text)
);
--> statement-breakpoint
ALTER TABLE "individual_drafts" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "sponsor_individuals" (
	"id" smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "sponsor_individuals_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 32767 START WITH 1 CACHE 1),
	"individual_id" smallint,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "sponsor_individuals" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "sponsor_lunch" (
	"id" smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "sponsor_lunch_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 32767 START WITH 1 CACHE 1),
	"company_id" smallint,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "sponsor_lunch" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "sponsor_nameplate" (
	"id" smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "sponsor_nameplate_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 32767 START WITH 1 CACHE 1),
	"company_id" smallint,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "sponsor_nameplate" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "sponsor_naming_rights" (
	"id" smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "sponsor_naming_rights_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 32767 START WITH 1 CACHE 1),
	"company_id" smallint,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "sponsor_naming_rights" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "sponsor_scholarship" (
	"id" smallint PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "sponsor_scholarship_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 32767 START WITH 1 CACHE 1),
	"company_id" smallint,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "sponsor_scholarship" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "user_roles" (
	"user_id" uuid NOT NULL,
	"role" "role" NOT NULL,
	"created_at" timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT "user_roles_pkey" PRIMARY KEY("user_id","role")
);
--> statement-breakpoint
ALTER TABLE "user_roles" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
CREATE TABLE "company_members" (
	"company_id" smallint NOT NULL,
	"user_id" uuid NOT NULL,
	"joined_at" timestamp DEFAULT now() NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "company_members_pkey" PRIMARY KEY("company_id","user_id")
);
--> statement-breakpoint
ALTER TABLE "company_members" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
ALTER TABLE "users" ADD CONSTRAINT "users_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "ticket_options" ADD CONSTRAINT "ticket_options_ticket_type_id_fkey" FOREIGN KEY ("ticket_type_id") REFERENCES "public"."ticket_types"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "ticket_purchase_options" ADD CONSTRAINT "ticket_purchase_options_ticket_option_id_fkey" FOREIGN KEY ("ticket_option_id") REFERENCES "public"."ticket_options"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "ticket_purchase_options" ADD CONSTRAINT "ticket_purchase_options_ticket_purchase_id_fkey" FOREIGN KEY ("ticket_purchase_id") REFERENCES "public"."ticket_purchases"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "individuals" ADD CONSTRAINT "individuals_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "ticket_purchases" ADD CONSTRAINT "ticket_purchases_ticket_type_id_fkey" FOREIGN KEY ("ticket_type_id") REFERENCES "public"."ticket_types"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "ticket_purchases" ADD CONSTRAINT "ticket_purchases_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "company_draft_approvals" ADD CONSTRAINT "company_draft_approvals_approved_by_fkey" FOREIGN KEY ("approved_by") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "company_draft_approvals" ADD CONSTRAINT "company_draft_approvals_company_draft_id_fkey" FOREIGN KEY ("company_draft_id") REFERENCES "public"."company_drafts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "company_invitation" ADD CONSTRAINT "company_invitation_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "company_drafts" ADD CONSTRAINT "company_drafts_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "ticket_checkout_options" ADD CONSTRAINT "ticket_checkout_options_checkout_session_id_fkey" FOREIGN KEY ("checkout_session_id") REFERENCES "public"."ticket_checkout_sessions"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "ticket_checkout_options" ADD CONSTRAINT "ticket_checkout_options_ticket_option_id_fkey" FOREIGN KEY ("ticket_option_id") REFERENCES "public"."ticket_options"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "ticket_checkout_sessions" ADD CONSTRAINT "ticket_checkout_sessions_ticket_type_id_fkey" FOREIGN KEY ("ticket_type_id") REFERENCES "public"."ticket_types"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "ticket_checkout_sessions" ADD CONSTRAINT "ticket_checkout_sessions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "individual_draft_approvals" ADD CONSTRAINT "individual_draft_approvals_approved_by_fkey" FOREIGN KEY ("approved_by") REFERENCES "public"."users"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "individual_draft_approvals" ADD CONSTRAINT "individual_draft_approvals_individual_draft_id_fkey" FOREIGN KEY ("individual_draft_id") REFERENCES "public"."individual_drafts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "individual_drafts" ADD CONSTRAINT "individual_drafts_individual_id_fkey" FOREIGN KEY ("individual_id") REFERENCES "public"."individuals"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "sponsor_individuals" ADD CONSTRAINT "sponsor_individuals_individual_id_fkey" FOREIGN KEY ("individual_id") REFERENCES "public"."individuals"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "sponsor_lunch" ADD CONSTRAINT "sponsor_lunch_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "sponsor_nameplate" ADD CONSTRAINT "sponsor_nameplate_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "sponsor_naming_rights" ADD CONSTRAINT "sponsor_naming_rights_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "sponsor_scholarship" ADD CONSTRAINT "sponsor_scholarship_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "user_roles" ADD CONSTRAINT "user_roles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "company_members" ADD CONSTRAINT "company_members_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."companies"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "company_members" ADD CONSTRAINT "company_members_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "idx_stripe_webhook_logs_processed" ON "stripe_webhook_logs" USING btree ("processed" bool_ops);--> statement-breakpoint
CREATE INDEX "idx_stripe_webhook_logs_stripe_event_id" ON "stripe_webhook_logs" USING btree ("stripe_event_id" text_ops);--> statement-breakpoint
CREATE INDEX "idx_ticket_purchase_options_ticket_purchase_id" ON "ticket_purchase_options" USING btree ("ticket_purchase_id" uuid_ops);--> statement-breakpoint
CREATE INDEX "idx_ticket_purchases_status" ON "ticket_purchases" USING btree ("status" enum_ops);--> statement-breakpoint
CREATE INDEX "idx_ticket_purchases_stripe_payment_intent_id" ON "ticket_purchases" USING btree ("stripe_payment_intent_id" text_ops);--> statement-breakpoint
CREATE INDEX "idx_ticket_purchases_ticket_type_id" ON "ticket_purchases" USING btree ("ticket_type_id" text_ops);--> statement-breakpoint
CREATE INDEX "idx_ticket_purchases_user_id" ON "ticket_purchases" USING btree ("user_id" uuid_ops);--> statement-breakpoint
CREATE INDEX "idx_ticket_checkout_options_checkout_session_id" ON "ticket_checkout_options" USING btree ("checkout_session_id" uuid_ops);--> statement-breakpoint
CREATE INDEX "idx_ticket_checkout_sessions_expires_at" ON "ticket_checkout_sessions" USING btree ("expires_at" timestamptz_ops);--> statement-breakpoint
CREATE INDEX "idx_ticket_checkout_sessions_status" ON "ticket_checkout_sessions" USING btree ("status" enum_ops);--> statement-breakpoint
CREATE INDEX "idx_ticket_checkout_sessions_stripe_payment_intent_id" ON "ticket_checkout_sessions" USING btree ("stripe_payment_intent_id" text_ops);--> statement-breakpoint
CREATE INDEX "idx_ticket_checkout_sessions_user_id" ON "ticket_checkout_sessions" USING btree ("user_id" uuid_ops);
*/