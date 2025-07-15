import { pgTable, foreignKey, uuid, timestamp, smallint, index, unique, integer, text, boolean, jsonb, check, primaryKey, pgEnum } from "drizzle-orm/pg-core"
import { sql } from "drizzle-orm"

export const role = pgEnum("role", ['admin', 'staff', 'sponsor', 'speaker', 'viewer', 'attendee'])
export const ticketCheckoutStatus = pgEnum("ticket_checkout_status", ['pending', 'completed'])
export const ticketPurchaseStatus = pgEnum("ticket_purchase_status", ['completed', 'refunded'])


export const users = pgTable("users", {
	id: uuid().primaryKey().notNull(),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	deletedAt: timestamp("deleted_at", { mode: 'string' }),
}, (table) => [
	foreignKey({
			columns: [table.id],
			foreignColumns: [table.id],
			name: "users_id_fkey"
		}).onDelete("cascade"),
]);

export const companies = pgTable("companies", {
	id: smallint().primaryKey().generatedAlwaysAsIdentity({ name: "companies_id_seq", startWith: 1, increment: 1, minValue: 1, maxValue: 32767, cache: 1 }),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: 'string' }).defaultNow().notNull(),
});

export const stripeWebhookLogs = pgTable("stripe_webhook_logs", {
	id: integer().primaryKey().generatedAlwaysAsIdentity({ name: "stripe_webhook_logs_id_seq", startWith: 1, increment: 1, minValue: 1, maxValue: 2147483647, cache: 1 }),
	stripeEventId: text("stripe_event_id").notNull(),
	eventType: text("event_type").notNull(),
	paymentIntentId: text("payment_intent_id"),
	processed: boolean().default(false),
	errorMessage: text("error_message"),
	rawData: jsonb("raw_data").notNull(),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	index("idx_stripe_webhook_logs_processed").using("btree", table.processed.asc().nullsLast().op("bool_ops")),
	index("idx_stripe_webhook_logs_stripe_event_id").using("btree", table.stripeEventId.asc().nullsLast().op("text_ops")),
	unique("stripe_webhook_logs_stripe_event_id_key").on(table.stripeEventId),
]);

export const ticketOptions = pgTable("ticket_options", {
	id: text().primaryKey().notNull(),
	ticketTypeId: text("ticket_type_id").notNull(),
	name: text().notNull(),
	description: text(),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.ticketTypeId],
			foreignColumns: [ticketTypes.id],
			name: "ticket_options_ticket_type_id_fkey"
		}).onDelete("cascade"),
]);

export const ticketPurchaseOptions = pgTable("ticket_purchase_options", {
	id: uuid().default(sql`uuid_generate_v7()`).primaryKey().notNull(),
	ticketPurchaseId: uuid("ticket_purchase_id").notNull(),
	ticketOptionId: text("ticket_option_id").notNull(),
	optionValue: text("option_value"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	index("idx_ticket_purchase_options_ticket_purchase_id").using("btree", table.ticketPurchaseId.asc().nullsLast().op("uuid_ops")),
	foreignKey({
			columns: [table.ticketOptionId],
			foreignColumns: [ticketOptions.id],
			name: "ticket_purchase_options_ticket_option_id_fkey"
		}).onDelete("cascade"),
	foreignKey({
			columns: [table.ticketPurchaseId],
			foreignColumns: [ticketPurchases.id],
			name: "ticket_purchase_options_ticket_purchase_id_fkey"
		}).onDelete("cascade"),
	unique("ticket_purchase_options_ticket_purchase_id_ticket_option_id_key").on(table.ticketPurchaseId, table.ticketOptionId),
]);

export const individuals = pgTable("individuals", {
	id: integer().primaryKey().generatedAlwaysAsIdentity({ name: "individuals_id_seq", startWith: 1, increment: 1, minValue: 1, maxValue: 2147483647, cache: 1 }),
	userId: uuid("user_id"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.userId],
			foreignColumns: [users.id],
			name: "individuals_user_id_fkey"
		}).onDelete("cascade"),
	unique("individuals_user_id_key").on(table.userId),
]);

export const ticketPurchases = pgTable("ticket_purchases", {
	id: uuid().default(sql`uuid_generate_v7()`).primaryKey().notNull(),
	userId: uuid("user_id").notNull(),
	ticketTypeId: text("ticket_type_id").notNull(),
	status: ticketPurchaseStatus().default('completed').notNull(),
	stripePaymentIntentId: text("stripe_payment_intent_id"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	index("idx_ticket_purchases_status").using("btree", table.status.asc().nullsLast().op("enum_ops")),
	index("idx_ticket_purchases_stripe_payment_intent_id").using("btree", table.stripePaymentIntentId.asc().nullsLast().op("text_ops")),
	index("idx_ticket_purchases_ticket_type_id").using("btree", table.ticketTypeId.asc().nullsLast().op("text_ops")),
	index("idx_ticket_purchases_user_id").using("btree", table.userId.asc().nullsLast().op("uuid_ops")),
	foreignKey({
			columns: [table.ticketTypeId],
			foreignColumns: [ticketTypes.id],
			name: "ticket_purchases_ticket_type_id_fkey"
		}).onDelete("cascade"),
	foreignKey({
			columns: [table.userId],
			foreignColumns: [users.id],
			name: "ticket_purchases_user_id_fkey"
		}).onDelete("cascade"),
	unique("ticket_purchases_user_id_ticket_type_id_key").on(table.userId, table.ticketTypeId),
]);

export const ticketTypes = pgTable("ticket_types", {
	id: text().primaryKey().notNull(),
	name: text().notNull(),
	price: integer().notNull(),
	maxQuantity: integer("max_quantity"),
	description: text(),
	isActive: boolean("is_active").default(true),
	saleStartsAt: timestamp("sale_starts_at", { withTimezone: true, mode: 'string' }),
	saleEndsAt: timestamp("sale_ends_at", { withTimezone: true, mode: 'string' }),
	url: text(),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	unique("ticket_types_name_key").on(table.name),
]);

export const companyDraftApprovals = pgTable("company_draft_approvals", {
	id: integer().primaryKey().generatedAlwaysAsIdentity({ name: "company_draft_approvals_id_seq", startWith: 1, increment: 1, minValue: 1, maxValue: 2147483647, cache: 1 }),
	companyDraftId: smallint("company_draft_id"),
	approvedBy: uuid("approved_by"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.approvedBy],
			foreignColumns: [users.id],
			name: "company_draft_approvals_approved_by_fkey"
		}).onDelete("set null"),
	foreignKey({
			columns: [table.companyDraftId],
			foreignColumns: [companyDrafts.id],
			name: "company_draft_approvals_company_draft_id_fkey"
		}).onDelete("cascade"),
]);

export const companyInvitation = pgTable("company_invitation", {
	companyId: smallint("company_id"),
	key: text().notNull(),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: 'string' }).defaultNow().notNull(),
	disabledAt: timestamp("disabled_at", { mode: 'string' }),
}, (table) => [
	foreignKey({
			columns: [table.companyId],
			foreignColumns: [companies.id],
			name: "company_invitation_company_id_fkey"
		}).onDelete("cascade"),
	unique("company_invitation_key_key").on(table.key),
	check("company_invitation_key_check", sql`key <> ''::text`),
]);

export const companyDrafts = pgTable("company_drafts", {
	id: smallint().primaryKey().generatedAlwaysAsIdentity({ name: "company_drafts_id_seq", startWith: 1, increment: 1, minValue: 1, maxValue: 32767, cache: 1 }),
	companyId: smallint("company_id"),
	name: text().notNull(),
	logoName: text("logo_name"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: 'string' }).defaultNow().notNull(),
	slug: text().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.companyId],
			foreignColumns: [companies.id],
			name: "company_drafts_company_id_fkey"
		}).onDelete("cascade"),
	unique("company_drafts_slug_key").on(table.slug),
	check("company_drafts_name_check", sql`name <> ''::text`),
	check("company_drafts_slug_check", sql`slug <> ''::text`),
]);

export const ticketCheckoutOptions = pgTable("ticket_checkout_options", {
	id: uuid().default(sql`uuid_generate_v7()`).primaryKey().notNull(),
	checkoutSessionId: uuid("checkout_session_id").notNull(),
	ticketOptionId: text("ticket_option_id").notNull(),
	optionValue: text("option_value"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	index("idx_ticket_checkout_options_checkout_session_id").using("btree", table.checkoutSessionId.asc().nullsLast().op("uuid_ops")),
	foreignKey({
			columns: [table.checkoutSessionId],
			foreignColumns: [ticketCheckoutSessions.id],
			name: "ticket_checkout_options_checkout_session_id_fkey"
		}).onDelete("cascade"),
	foreignKey({
			columns: [table.ticketOptionId],
			foreignColumns: [ticketOptions.id],
			name: "ticket_checkout_options_ticket_option_id_fkey"
		}).onDelete("cascade"),
	unique("ticket_checkout_options_checkout_session_id_ticket_option_i_key").on(table.checkoutSessionId, table.ticketOptionId),
]);

export const ticketCheckoutSessions = pgTable("ticket_checkout_sessions", {
	id: uuid().default(sql`uuid_generate_v7()`).primaryKey().notNull(),
	userId: uuid("user_id").notNull(),
	ticketTypeId: text("ticket_type_id").notNull(),
	status: ticketCheckoutStatus().default('pending').notNull(),
	stripePaymentIntentId: text("stripe_payment_intent_id"),
	stripeCheckoutSessionId: text("stripe_checkout_session_id"),
	totalAmount: integer("total_amount").notNull(),
	expiresAt: timestamp("expires_at", { withTimezone: true, mode: 'string' }).default(sql`(now() + '00:30:00'::interval)`).notNull(),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	index("idx_ticket_checkout_sessions_expires_at").using("btree", table.expiresAt.asc().nullsLast().op("timestamptz_ops")),
	index("idx_ticket_checkout_sessions_status").using("btree", table.status.asc().nullsLast().op("enum_ops")),
	index("idx_ticket_checkout_sessions_stripe_payment_intent_id").using("btree", table.stripePaymentIntentId.asc().nullsLast().op("text_ops")),
	index("idx_ticket_checkout_sessions_user_id").using("btree", table.userId.asc().nullsLast().op("uuid_ops")),
	foreignKey({
			columns: [table.ticketTypeId],
			foreignColumns: [ticketTypes.id],
			name: "ticket_checkout_sessions_ticket_type_id_fkey"
		}).onDelete("cascade"),
	foreignKey({
			columns: [table.userId],
			foreignColumns: [users.id],
			name: "ticket_checkout_sessions_user_id_fkey"
		}).onDelete("cascade"),
	unique("ticket_checkout_sessions_user_id_ticket_type_id_status_key").on(table.userId, table.ticketTypeId, table.status),
]);

export const individualDraftApprovals = pgTable("individual_draft_approvals", {
	id: integer().primaryKey().generatedAlwaysAsIdentity({ name: "individual_draft_approvals_id_seq", startWith: 1, increment: 1, minValue: 1, maxValue: 2147483647, cache: 1 }),
	individualDraftId: integer("individual_draft_id"),
	approvedBy: uuid("approved_by"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.approvedBy],
			foreignColumns: [users.id],
			name: "individual_draft_approvals_approved_by_fkey"
		}).onDelete("set null"),
	foreignKey({
			columns: [table.individualDraftId],
			foreignColumns: [individualDrafts.id],
			name: "individual_draft_approvals_individual_draft_id_fkey"
		}).onDelete("cascade"),
]);

export const individualDrafts = pgTable("individual_drafts", {
	id: integer().primaryKey().generatedAlwaysAsIdentity({ name: "individual_drafts_id_seq", startWith: 1, increment: 1, minValue: 1, maxValue: 2147483647, cache: 1 }),
	individualId: integer("individual_id"),
	name: text().notNull(),
	logoName: text("logo_name"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: 'string' }).defaultNow().notNull(),
	slug: text().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.individualId],
			foreignColumns: [individuals.id],
			name: "individual_drafts_individual_id_fkey"
		}).onDelete("cascade"),
	unique("individual_drafts_slug_key").on(table.slug),
	check("individual_drafts_name_check", sql`name <> ''::text`),
	check("individual_drafts_slug_check", sql`slug <> ''::text`),
]);

export const sponsorIndividuals = pgTable("sponsor_individuals", {
	id: smallint().primaryKey().generatedAlwaysAsIdentity({ name: "sponsor_individuals_id_seq", startWith: 1, increment: 1, minValue: 1, maxValue: 32767, cache: 1 }),
	individualId: smallint("individual_id"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.individualId],
			foreignColumns: [individuals.id],
			name: "sponsor_individuals_individual_id_fkey"
		}).onDelete("cascade"),
]);

export const sponsorLunch = pgTable("sponsor_lunch", {
	id: smallint().primaryKey().generatedAlwaysAsIdentity({ name: "sponsor_lunch_id_seq", startWith: 1, increment: 1, minValue: 1, maxValue: 32767, cache: 1 }),
	companyId: smallint("company_id"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.companyId],
			foreignColumns: [companies.id],
			name: "sponsor_lunch_company_id_fkey"
		}).onDelete("cascade"),
]);

export const sponsorNameplate = pgTable("sponsor_nameplate", {
	id: smallint().primaryKey().generatedAlwaysAsIdentity({ name: "sponsor_nameplate_id_seq", startWith: 1, increment: 1, minValue: 1, maxValue: 32767, cache: 1 }),
	companyId: smallint("company_id"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.companyId],
			foreignColumns: [companies.id],
			name: "sponsor_nameplate_company_id_fkey"
		}).onDelete("cascade"),
]);

export const sponsorNamingRights = pgTable("sponsor_naming_rights", {
	id: smallint().primaryKey().generatedAlwaysAsIdentity({ name: "sponsor_naming_rights_id_seq", startWith: 1, increment: 1, minValue: 1, maxValue: 32767, cache: 1 }),
	companyId: smallint("company_id"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.companyId],
			foreignColumns: [companies.id],
			name: "sponsor_naming_rights_company_id_fkey"
		}).onDelete("cascade"),
]);

export const sponsorScholarship = pgTable("sponsor_scholarship", {
	id: smallint().primaryKey().generatedAlwaysAsIdentity({ name: "sponsor_scholarship_id_seq", startWith: 1, increment: 1, minValue: 1, maxValue: 32767, cache: 1 }),
	companyId: smallint("company_id"),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.companyId],
			foreignColumns: [companies.id],
			name: "sponsor_scholarship_company_id_fkey"
		}).onDelete("cascade"),
]);

export const userRoles = pgTable("user_roles", {
	userId: uuid("user_id").notNull(),
	role: role().notNull(),
	createdAt: timestamp("created_at", { mode: 'string' }).default(sql`CURRENT_TIMESTAMP`).notNull(),
}, (table) => [
	foreignKey({
			columns: [table.userId],
			foreignColumns: [users.id],
			name: "user_roles_user_id_fkey"
		}).onDelete("cascade"),
	primaryKey({ columns: [table.userId, table.role], name: "user_roles_pkey"}),
]);

export const companyMembers = pgTable("company_members", {
	companyId: smallint("company_id").notNull(),
	userId: uuid("user_id").notNull(),
	joinedAt: timestamp("joined_at", { mode: 'string' }).defaultNow().notNull(),
	createdAt: timestamp("created_at", { mode: 'string' }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: 'string' }).defaultNow().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.companyId],
			foreignColumns: [companies.id],
			name: "company_members_company_id_fkey"
		}).onDelete("cascade"),
	foreignKey({
			columns: [table.userId],
			foreignColumns: [users.id],
			name: "company_members_user_id_fkey"
		}).onDelete("cascade"),
	primaryKey({ columns: [table.companyId, table.userId], name: "company_members_pkey"}),
]);
