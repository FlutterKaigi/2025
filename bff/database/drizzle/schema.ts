import { sql } from "drizzle-orm";
import {
	bigserial,
	boolean,
	check,
	foreignKey,
	index,
	inet,
	integer,
	json,
	jsonb,
	pgEnum,
	pgPolicy,
	pgSchema,
	pgTable,
	pgView,
	primaryKey,
	smallint,
	text,
	timestamp,
	unique,
	uniqueIndex,
	uuid,
	varchar,
} from "drizzle-orm/pg-core";

export const auth = pgSchema("auth");
export const aalLevelInAuth = auth.enum("aal_level", ["aal1", "aal2", "aal3"]);
export const codeChallengeMethodInAuth = auth.enum("code_challenge_method", [
	"s256",
	"plain",
]);
export const factorStatusInAuth = auth.enum("factor_status", [
	"unverified",
	"verified",
]);
export const factorTypeInAuth = auth.enum("factor_type", [
	"totp",
	"webauthn",
	"phone",
]);
export const oauthAuthorizationStatusInAuth = auth.enum(
	"oauth_authorization_status",
	["pending", "approved", "denied", "expired"],
);
export const oauthClientTypeInAuth = auth.enum("oauth_client_type", [
	"public",
	"confidential",
]);
export const oauthRegistrationTypeInAuth = auth.enum(
	"oauth_registration_type",
	["dynamic", "manual"],
);
export const oauthResponseTypeInAuth = auth.enum("oauth_response_type", [
	"code",
]);
export const oneTimeTokenTypeInAuth = auth.enum("one_time_token_type", [
	"confirmation_token",
	"reauthentication_token",
	"recovery_token",
	"email_change_token_new",
	"email_change_token_current",
	"phone_change_token",
]);
export const apnsLiveActivityTokenType = pgEnum(
	"apns_live_activity_token_type",
	["start", "update"],
);
export const basicPlanType = pgEnum("basic_plan_type", [
	"platinum",
	"gold",
	"silver",
	"bronze",
]);
export const companySponsorType = pgEnum("company_sponsor_type", [
	"basic",
	"community",
	"tool",
	"none",
]);
export const deviceType = pgEnum("device_type", ["ios", "android", "web"]);
export const optionPlanType = pgEnum("option_plan_type", [
	"naming_rights_hall",
	"naming_rights_room",
	"nameplate",
	"lunch",
	"scholarship",
]);
export const role = pgEnum("role", [
	"admin",
	"staff",
	"sponsor",
	"speaker",
	"viewer",
	"attendee",
]);
export const snsType = pgEnum("sns_type", [
	"github",
	"x",
	"discord",
	"medium",
	"qiita",
	"zenn",
	"note",
	"other",
]);
export const ticketCheckoutStatus = pgEnum("ticket_checkout_status", [
	"pending",
	"completed",
	"expired",
]);
export const ticketPurchaseStatus = pgEnum("ticket_purchase_status", [
	"completed",
	"refunded",
]);

export const ssoDomainsInAuth = auth.table(
	"sso_domains",
	{
		id: uuid().notNull(),
		ssoProviderId: uuid("sso_provider_id").notNull(),
		domain: text().notNull(),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
		updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" }),
	},
	(table) => [
		uniqueIndex("sso_domains_domain_idx").using("btree", sql`lower(domain)`),
		index("sso_domains_sso_provider_id_idx").using(
			"btree",
			table.ssoProviderId.asc().nullsLast().op("uuid_ops"),
		),
		foreignKey({
			columns: [table.ssoProviderId],
			foreignColumns: [ssoProvidersInAuth.id],
			name: "sso_domains_sso_provider_id_fkey",
		}).onDelete("cascade"),
		check("domain not empty", sql`char_length(domain) > 0`),
	],
);

export const mfaAmrClaimsInAuth = auth.table(
	"mfa_amr_claims",
	{
		sessionId: uuid("session_id").notNull(),
		createdAt: timestamp("created_at", {
			withTimezone: true,
			mode: "string",
		}).notNull(),
		updatedAt: timestamp("updated_at", {
			withTimezone: true,
			mode: "string",
		}).notNull(),
		authenticationMethod: text("authentication_method").notNull(),
		id: uuid().notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.sessionId],
			foreignColumns: [sessionsInAuth.id],
			name: "mfa_amr_claims_session_id_fkey",
		}).onDelete("cascade"),
	],
);

export const ssoProvidersInAuth = auth.table(
	"sso_providers",
	{
		id: uuid().notNull(),
		resourceId: text("resource_id"),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
		updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" }),
		disabled: boolean(),
	},
	(table) => [
		uniqueIndex("sso_providers_resource_id_idx").using(
			"btree",
			sql`lower(resource_id)`,
		),
		index("sso_providers_resource_id_pattern_idx").using(
			"btree",
			table.resourceId.asc().nullsLast().op("text_pattern_ops"),
		),
		check(
			"resource_id not empty",
			sql`(resource_id = NULL::text) OR (char_length(resource_id) > 0)`,
		),
	],
);

export const users = pgTable(
	"users",
	{
		id: uuid().primaryKey().notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		deletedAt: timestamp("deleted_at", { mode: "string" }),
	},
	(table) => [
		foreignKey({
			columns: [table.id],
			foreignColumns: [table.id],
			name: "users_id_fkey",
		}).onDelete("cascade"),
	],
);

export const instancesInAuth = auth.table("instances", {
	id: uuid().notNull(),
	uuid: uuid(),
	rawBaseConfig: text("raw_base_config"),
	createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
	updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" }),
});

export const usersInAuth = auth.table(
	"users",
	{
		instanceId: uuid("instance_id"),
		id: uuid().notNull(),
		aud: varchar({ length: 255 }),
		role: varchar({ length: 255 }),
		email: varchar({ length: 255 }),
		encryptedPassword: varchar("encrypted_password", { length: 255 }),
		emailConfirmedAt: timestamp("email_confirmed_at", {
			withTimezone: true,
			mode: "string",
		}),
		invitedAt: timestamp("invited_at", { withTimezone: true, mode: "string" }),
		confirmationToken: varchar("confirmation_token", { length: 255 }),
		confirmationSentAt: timestamp("confirmation_sent_at", {
			withTimezone: true,
			mode: "string",
		}),
		recoveryToken: varchar("recovery_token", { length: 255 }),
		recoverySentAt: timestamp("recovery_sent_at", {
			withTimezone: true,
			mode: "string",
		}),
		emailChangeTokenNew: varchar("email_change_token_new", { length: 255 }),
		emailChange: varchar("email_change", { length: 255 }),
		emailChangeSentAt: timestamp("email_change_sent_at", {
			withTimezone: true,
			mode: "string",
		}),
		lastSignInAt: timestamp("last_sign_in_at", {
			withTimezone: true,
			mode: "string",
		}),
		rawAppMetaData: jsonb("raw_app_meta_data"),
		rawUserMetaData: jsonb("raw_user_meta_data"),
		isSuperAdmin: boolean("is_super_admin"),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
		updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" }),
		phone: text().default(sql`NULL`),
		phoneConfirmedAt: timestamp("phone_confirmed_at", {
			withTimezone: true,
			mode: "string",
		}),
		phoneChange: text("phone_change").default(''),
	phoneChangeToken: varchar("phone_change_token", { length: 255 }).default(''),
	phoneChangeSentAt: timestamp("phone_change_sent_at", { withTimezone: true, mode: 'string' }),
	confirmedAt: timestamp("confirmed_at", { withTimezone: true, mode: 'string' }).generatedAlwaysAs(sql`LEAST(email_confirmed_at, phone_confirmed_at)`),
	emailChangeTokenCurrent: varchar("email_change_token_current", { length: 255 }).default(''),
	emailChangeConfirmStatus: smallint("email_change_confirm_status").default(0),
	bannedUntil: timestamp("banned_until", { withTimezone: true, mode: 'string' }),
	reauthenticationToken: varchar("reauthentication_token", { length: 255 }).default(''),
	reauthenticationSentAt: timestamp("reauthentication_sent_at", { withTimezone: true, mode: 'string' }),
	isSsoUser: boolean("is_sso_user").default(false).notNull(),
	deletedAt: timestamp("deleted_at", { withTimezone: true, mode: 'string' }),
	isAnonymous: boolean("is_anonymous").default(false).notNull(),
	},
	(table) => [
		uniqueIndex("confirmation_token_idx")
			.using("btree", table.confirmationToken.asc().nullsLast().op("text_ops"))
			.where(sql`((confirmation_token)::text !~ '^[0-9 ]*$'::text)`),
		uniqueIndex("email_change_token_current_idx")
			.using(
				"btree",
				table.emailChangeTokenCurrent.asc().nullsLast().op("text_ops"),
			)
			.where(sql`((email_change_token_current)::text !~ '^[0-9 ]*$'::text)`),
		uniqueIndex("email_change_token_new_idx")
			.using(
				"btree",
				table.emailChangeTokenNew.asc().nullsLast().op("text_ops"),
			)
			.where(sql`((email_change_token_new)::text !~ '^[0-9 ]*$'::text)`),
		uniqueIndex("reauthentication_token_idx")
			.using(
				"btree",
				table.reauthenticationToken.asc().nullsLast().op("text_ops"),
			)
			.where(sql`((reauthentication_token)::text !~ '^[0-9 ]*$'::text)`),
		uniqueIndex("recovery_token_idx")
			.using("btree", table.recoveryToken.asc().nullsLast().op("text_ops"))
			.where(sql`((recovery_token)::text !~ '^[0-9 ]*$'::text)`),
		uniqueIndex("users_email_partial_key")
			.using("btree", table.email.asc().nullsLast().op("text_ops"))
			.where(sql`(is_sso_user = false)`),
		index("users_instance_id_email_idx").using(
			"btree",
			sql`instance_id`,
			sql`lower((email)::text)`,
		),
		index("users_instance_id_idx").using(
			"btree",
			table.instanceId.asc().nullsLast().op("uuid_ops"),
		),
		index("users_is_anonymous_idx").using(
			"btree",
			table.isAnonymous.asc().nullsLast().op("bool_ops"),
		),
		check(
			"users_email_change_confirm_status_check",
			sql`(email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)`,
		),
	],
);

export const auditLogEntriesInAuth = auth.table(
	"audit_log_entries",
	{
		instanceId: uuid("instance_id"),
		id: uuid().notNull(),
		payload: json(),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
		ipAddress: varchar("ip_address", { length: 64 }).default('').notNull(),
	},
	(table) => [
		index("audit_logs_instance_id_idx").using(
			"btree",
			table.instanceId.asc().nullsLast().op("uuid_ops"),
		),
	],
);

export const samlRelayStatesInAuth = auth.table(
	"saml_relay_states",
	{
		id: uuid().notNull(),
		ssoProviderId: uuid("sso_provider_id").notNull(),
		requestId: text("request_id").notNull(),
		forEmail: text("for_email"),
		redirectTo: text("redirect_to"),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
		updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" }),
		flowStateId: uuid("flow_state_id"),
	},
	(table) => [
		index("saml_relay_states_created_at_idx").using(
			"btree",
			table.createdAt.desc().nullsFirst().op("timestamptz_ops"),
		),
		index("saml_relay_states_for_email_idx").using(
			"btree",
			table.forEmail.asc().nullsLast().op("text_ops"),
		),
		index("saml_relay_states_sso_provider_id_idx").using(
			"btree",
			table.ssoProviderId.asc().nullsLast().op("uuid_ops"),
		),
		foreignKey({
			columns: [table.flowStateId],
			foreignColumns: [flowStateInAuth.id],
			name: "saml_relay_states_flow_state_id_fkey",
		}).onDelete("cascade"),
		foreignKey({
			columns: [table.ssoProviderId],
			foreignColumns: [ssoProvidersInAuth.id],
			name: "saml_relay_states_sso_provider_id_fkey",
		}).onDelete("cascade"),
		check("request_id not empty", sql`char_length(request_id) > 0`),
	],
);

export const refreshTokensInAuth = auth.table(
	"refresh_tokens",
	{
		instanceId: uuid("instance_id"),
		id: bigserial({ mode: "bigint" }).notNull(),
		token: varchar({ length: 255 }),
		userId: varchar("user_id", { length: 255 }),
		revoked: boolean(),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
		updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" }),
		parent: varchar({ length: 255 }),
		sessionId: uuid("session_id"),
	},
	(table) => [
		index("refresh_tokens_instance_id_idx").using(
			"btree",
			table.instanceId.asc().nullsLast().op("uuid_ops"),
		),
		index("refresh_tokens_instance_id_user_id_idx").using(
			"btree",
			table.instanceId.asc().nullsLast().op("text_ops"),
			table.userId.asc().nullsLast().op("text_ops"),
		),
		index("refresh_tokens_parent_idx").using(
			"btree",
			table.parent.asc().nullsLast().op("text_ops"),
		),
		index("refresh_tokens_session_id_revoked_idx").using(
			"btree",
			table.sessionId.asc().nullsLast().op("bool_ops"),
			table.revoked.asc().nullsLast().op("bool_ops"),
		),
		index("refresh_tokens_updated_at_idx").using(
			"btree",
			table.updatedAt.desc().nullsFirst().op("timestamptz_ops"),
		),
		foreignKey({
			columns: [table.sessionId],
			foreignColumns: [sessionsInAuth.id],
			name: "refresh_tokens_session_id_fkey",
		}).onDelete("cascade"),
	],
);

export const samlProvidersInAuth = auth.table(
	"saml_providers",
	{
		id: uuid().notNull(),
		ssoProviderId: uuid("sso_provider_id").notNull(),
		entityId: text("entity_id").notNull(),
		metadataXml: text("metadata_xml").notNull(),
		metadataUrl: text("metadata_url"),
		attributeMapping: jsonb("attribute_mapping"),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
		updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" }),
		nameIdFormat: text("name_id_format"),
	},
	(table) => [
		index("saml_providers_sso_provider_id_idx").using(
			"btree",
			table.ssoProviderId.asc().nullsLast().op("uuid_ops"),
		),
		foreignKey({
			columns: [table.ssoProviderId],
			foreignColumns: [ssoProvidersInAuth.id],
			name: "saml_providers_sso_provider_id_fkey",
		}).onDelete("cascade"),
		check("entity_id not empty", sql`char_length(entity_id) > 0`),
		check(
			"metadata_url not empty",
			sql`(metadata_url = NULL::text) OR (char_length(metadata_url) > 0)`,
		),
		check("metadata_xml not empty", sql`char_length(metadata_xml) > 0`),
	],
);

export const flowStateInAuth = auth.table(
	"flow_state",
	{
		id: uuid().notNull(),
		userId: uuid("user_id"),
		authCode: text("auth_code").notNull(),
		codeChallengeMethod: codeChallengeMethodInAuth(
			"code_challenge_method",
		).notNull(),
		codeChallenge: text("code_challenge").notNull(),
		providerType: text("provider_type").notNull(),
		providerAccessToken: text("provider_access_token"),
		providerRefreshToken: text("provider_refresh_token"),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
		updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" }),
		authenticationMethod: text("authentication_method").notNull(),
		authCodeIssuedAt: timestamp("auth_code_issued_at", {
			withTimezone: true,
			mode: "string",
		}),
	},
	(table) => [
		index("flow_state_created_at_idx").using(
			"btree",
			table.createdAt.desc().nullsFirst().op("timestamptz_ops"),
		),
		index("idx_auth_code").using(
			"btree",
			table.authCode.asc().nullsLast().op("text_ops"),
		),
		index("idx_user_id_auth_method").using(
			"btree",
			table.userId.asc().nullsLast().op("uuid_ops"),
			table.authenticationMethod.asc().nullsLast().op("uuid_ops"),
		),
	],
);

export const identitiesInAuth = auth.table(
	"identities",
	{
		providerId: text("provider_id").notNull(),
		userId: uuid("user_id").notNull(),
		identityData: jsonb("identity_data").notNull(),
		provider: text().notNull(),
		lastSignInAt: timestamp("last_sign_in_at", {
			withTimezone: true,
			mode: "string",
		}),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
		updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" }),
		email: text().generatedAlwaysAs(
			sql`lower((identity_data ->> 'email'::text))`,
		),
		id: uuid().defaultRandom().notNull(),
	},
	(table) => [
		index("identities_email_idx").using(
			"btree",
			table.email.asc().nullsLast().op("text_pattern_ops"),
		),
		index("identities_user_id_idx").using(
			"btree",
			table.userId.asc().nullsLast().op("uuid_ops"),
		),
		foreignKey({
			columns: [table.userId],
			foreignColumns: [usersInAuth.id],
			name: "identities_user_id_fkey",
		}).onDelete("cascade"),
	],
);

export const oneTimeTokensInAuth = auth.table(
	"one_time_tokens",
	{
		id: uuid().notNull(),
		userId: uuid("user_id").notNull(),
		tokenType: oneTimeTokenTypeInAuth("token_type").notNull(),
		tokenHash: text("token_hash").notNull(),
		relatesTo: text("relates_to").notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		index("one_time_tokens_relates_to_hash_idx").using(
			"hash",
			table.relatesTo.asc().nullsLast().op("text_ops"),
		),
		index("one_time_tokens_token_hash_hash_idx").using(
			"hash",
			table.tokenHash.asc().nullsLast().op("text_ops"),
		),
		uniqueIndex("one_time_tokens_user_id_token_type_key").using(
			"btree",
			table.userId.asc().nullsLast().op("uuid_ops"),
			table.tokenType.asc().nullsLast().op("uuid_ops"),
		),
		foreignKey({
			columns: [table.userId],
			foreignColumns: [usersInAuth.id],
			name: "one_time_tokens_user_id_fkey",
		}).onDelete("cascade"),
		check("one_time_tokens_token_hash_check", sql`char_length(token_hash) > 0`),
	],
);

export const mfaFactorsInAuth = auth.table(
	"mfa_factors",
	{
		id: uuid().notNull(),
		userId: uuid("user_id").notNull(),
		friendlyName: text("friendly_name"),
		factorType: factorTypeInAuth("factor_type").notNull(),
		status: factorStatusInAuth().notNull(),
		createdAt: timestamp("created_at", {
			withTimezone: true,
			mode: "string",
		}).notNull(),
		updatedAt: timestamp("updated_at", {
			withTimezone: true,
			mode: "string",
		}).notNull(),
		secret: text(),
		phone: text(),
		lastChallengedAt: timestamp("last_challenged_at", {
			withTimezone: true,
			mode: "string",
		}),
		webAuthnCredential: jsonb("web_authn_credential"),
		webAuthnAaguid: uuid("web_authn_aaguid"),
	},
	(table) => [
		index("factor_id_created_at_idx").using(
			"btree",
			table.userId.asc().nullsLast().op("timestamptz_ops"),
			table.createdAt.asc().nullsLast().op("uuid_ops"),
		),
		uniqueIndex("mfa_factors_user_friendly_name_unique")
			.using(
				"btree",
				table.friendlyName.asc().nullsLast().op("text_ops"),
				table.userId.asc().nullsLast().op("uuid_ops"),
			)
			.where(sql`(TRIM(BOTH FROM friendly_name) <> ''::text)`),
		index("mfa_factors_user_id_idx").using(
			"btree",
			table.userId.asc().nullsLast().op("uuid_ops"),
		),
		uniqueIndex("unique_phone_factor_per_user").using(
			"btree",
			table.userId.asc().nullsLast().op("text_ops"),
			table.phone.asc().nullsLast().op("text_ops"),
		),
		foreignKey({
			columns: [table.userId],
			foreignColumns: [usersInAuth.id],
			name: "mfa_factors_user_id_fkey",
		}).onDelete("cascade"),
	],
);

export const mfaChallengesInAuth = auth.table(
	"mfa_challenges",
	{
		id: uuid().notNull(),
		factorId: uuid("factor_id").notNull(),
		createdAt: timestamp("created_at", {
			withTimezone: true,
			mode: "string",
		}).notNull(),
		verifiedAt: timestamp("verified_at", {
			withTimezone: true,
			mode: "string",
		}),
		ipAddress: inet("ip_address").notNull(),
		otpCode: text("otp_code"),
		webAuthnSessionData: jsonb("web_authn_session_data"),
	},
	(table) => [
		index("mfa_challenge_created_at_idx").using(
			"btree",
			table.createdAt.desc().nullsFirst().op("timestamptz_ops"),
		),
		foreignKey({
			columns: [table.factorId],
			foreignColumns: [mfaFactorsInAuth.id],
			name: "mfa_challenges_auth_factor_id_fkey",
		}).onDelete("cascade"),
	],
);

export const schemaMigrationsInAuth = auth.table("schema_migrations", {
	version: varchar({ length: 255 }).notNull(),
});

export const sessionsInAuth = auth.table(
	"sessions",
	{
		id: uuid().notNull(),
		userId: uuid("user_id").notNull(),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
		updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" }),
		factorId: uuid("factor_id"),
		aal: aalLevelInAuth(),
		notAfter: timestamp("not_after", { withTimezone: true, mode: "string" }),
		refreshedAt: timestamp("refreshed_at", { mode: "string" }),
		userAgent: text("user_agent"),
		ip: inet(),
		tag: text(),
		oauthClientId: uuid("oauth_client_id"),
	},
	(table) => [
		index("sessions_not_after_idx").using(
			"btree",
			table.notAfter.desc().nullsFirst().op("timestamptz_ops"),
		),
		index("sessions_oauth_client_id_idx").using(
			"btree",
			table.oauthClientId.asc().nullsLast().op("uuid_ops"),
		),
		index("sessions_user_id_idx").using(
			"btree",
			table.userId.asc().nullsLast().op("uuid_ops"),
		),
		index("user_id_created_at_idx").using(
			"btree",
			table.userId.asc().nullsLast().op("uuid_ops"),
			table.createdAt.asc().nullsLast().op("timestamptz_ops"),
		),
		foreignKey({
			columns: [table.oauthClientId],
			foreignColumns: [oauthClientsInAuth.id],
			name: "sessions_oauth_client_id_fkey",
		}).onDelete("cascade"),
		foreignKey({
			columns: [table.userId],
			foreignColumns: [usersInAuth.id],
			name: "sessions_user_id_fkey",
		}).onDelete("cascade"),
	],
);

export const stripeWebhookLogs = pgTable(
	"stripe_webhook_logs",
	{
		id: integer()
			.primaryKey()
			.generatedAlwaysAsIdentity({
				name: "stripe_webhook_logs_id_seq",
				startWith: 1,
				increment: 1,
				minValue: 1,
				maxValue: 2147483647,
				cache: 1,
			}),
		stripeEventId: text("stripe_event_id").notNull(),
		eventType: text("event_type").notNull(),
		paymentIntentId: text("payment_intent_id"),
		processed: boolean().default(false),
		errorMessage: text("error_message"),
		rawData: jsonb("raw_data").notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		index("idx_stripe_webhook_logs_processed").using(
			"btree",
			table.processed.asc().nullsLast().op("bool_ops"),
		),
		index("idx_stripe_webhook_logs_stripe_event_id").using(
			"btree",
			table.stripeEventId.asc().nullsLast().op("text_ops"),
		),
		unique("stripe_webhook_logs_stripe_event_id_key").on(table.stripeEventId),
	],
);

export const companies = pgTable(
	"companies",
	{
		id: smallint()
			.primaryKey()
			.generatedAlwaysAsIdentity({
				name: "companies_id_seq",
				startWith: 1,
				increment: 1,
				minValue: 1,
				maxValue: 32767,
				cache: 1,
			}),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		logoName: text("logo_name").notNull(),
		name: text().notNull(),
	},
	(table) => [
		check("companies_logo_name_check", sql`logo_name <> ''::text`),
		check("companies_name_check", sql`name <> ''::text`),
	],
);

export const ticketOptions = pgTable(
	"ticket_options",
	{
		id: text().primaryKey().notNull(),
		ticketTypeId: text("ticket_type_id").notNull(),
		name: text().notNull(),
		description: text(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		maxQuantity: integer("max_quantity"),
	},
	(table) => [
		foreignKey({
			columns: [table.ticketTypeId],
			foreignColumns: [ticketTypes.id],
			name: "ticket_options_ticket_type_id_fkey",
		}).onDelete("cascade"),
	],
);

export const oauthClientsInAuth = auth.table(
	"oauth_clients",
	{
		id: uuid().notNull(),
		clientSecretHash: text("client_secret_hash"),
		registrationType:
			oauthRegistrationTypeInAuth("registration_type").notNull(),
		redirectUris: text("redirect_uris").notNull(),
		grantTypes: text("grant_types").notNull(),
		clientName: text("client_name"),
		clientUri: text("client_uri"),
		logoUri: text("logo_uri"),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" })
			.defaultNow()
			.notNull(),
		deletedAt: timestamp("deleted_at", { withTimezone: true, mode: "string" }),
		clientType: oauthClientTypeInAuth("client_type")
			.default("confidential")
			.notNull(),
	},
	(table) => [
		index("oauth_clients_deleted_at_idx").using(
			"btree",
			table.deletedAt.asc().nullsLast().op("timestamptz_ops"),
		),
		check(
			"oauth_clients_client_name_length",
			sql`char_length(client_name) <= 1024`,
		),
		check(
			"oauth_clients_client_uri_length",
			sql`char_length(client_uri) <= 2048`,
		),
		check("oauth_clients_logo_uri_length", sql`char_length(logo_uri) <= 2048`),
	],
);

export const ticketPurchaseOptions = pgTable(
	"ticket_purchase_options",
	{
		id: uuid().default(sql`uuid_generate_v7()`).primaryKey().notNull(),
		ticketPurchaseId: uuid("ticket_purchase_id").notNull(),
		ticketOptionId: text("ticket_option_id").notNull(),
		optionValue: text("option_value"),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		index("idx_ticket_purchase_options_ticket_purchase_id").using(
			"btree",
			table.ticketPurchaseId.asc().nullsLast().op("uuid_ops"),
		),
		foreignKey({
			columns: [table.ticketOptionId],
			foreignColumns: [ticketOptions.id],
			name: "ticket_purchase_options_ticket_option_id_fkey",
		}).onDelete("cascade"),
		foreignKey({
			columns: [table.ticketPurchaseId],
			foreignColumns: [ticketPurchases.id],
			name: "ticket_purchase_options_ticket_purchase_id_fkey",
		}).onDelete("cascade"),
		unique(
			"ticket_purchase_options_ticket_purchase_id_ticket_option_id_key",
		).on(table.ticketPurchaseId, table.ticketOptionId),
	],
);

export const ticketPurchases = pgTable(
	"ticket_purchases",
	{
		id: uuid().default(sql`uuid_generate_v7()`).primaryKey().notNull(),
		userId: uuid("user_id").notNull(),
		ticketTypeId: text("ticket_type_id").notNull(),
		status: ticketPurchaseStatus().default("completed").notNull(),
		stripePaymentIntentId: text("stripe_payment_intent_id"),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		nameplateId: text("nameplate_id"),
	},
	(table) => [
		index("idx_ticket_purchases_status").using(
			"btree",
			table.status.asc().nullsLast().op("enum_ops"),
		),
		index("idx_ticket_purchases_stripe_payment_intent_id").using(
			"btree",
			table.stripePaymentIntentId.asc().nullsLast().op("text_ops"),
		),
		index("idx_ticket_purchases_ticket_type_id").using(
			"btree",
			table.ticketTypeId.asc().nullsLast().op("text_ops"),
		),
		index("idx_ticket_purchases_user_id").using(
			"btree",
			table.userId.asc().nullsLast().op("uuid_ops"),
		),
		foreignKey({
			columns: [table.ticketTypeId],
			foreignColumns: [ticketTypes.id],
			name: "ticket_purchases_ticket_type_id_fkey",
		}).onDelete("cascade"),
		foreignKey({
			columns: [table.userId],
			foreignColumns: [users.id],
			name: "ticket_purchases_user_id_fkey",
		}).onDelete("cascade"),
		unique("ticket_purchases_user_id_ticket_type_id_key").on(
			table.userId,
			table.ticketTypeId,
		),
		unique("ticket_purchases_stripe_payment_intent_id_key").on(
			table.stripePaymentIntentId,
		),
	],
);

export const individuals = pgTable(
	"individuals",
	{
		id: integer()
			.primaryKey()
			.generatedAlwaysAsIdentity({
				name: "individuals_id_seq",
				startWith: 1,
				increment: 1,
				minValue: 1,
				maxValue: 2147483647,
				cache: 1,
			}),
		userId: uuid("user_id"),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.userId],
			foreignColumns: [users.id],
			name: "individuals_user_id_fkey",
		}).onDelete("cascade"),
		unique("individuals_user_id_key").on(table.userId),
	],
);

export const jobBoards = pgTable(
	"job_boards",
	{
		id: smallint().primaryKey().notNull(),
		url: text().notNull(),
		altText: text("alt_text").notNull(),
		imageName: text("image_name").notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.id],
			foreignColumns: [companies.id],
			name: "job_boards_id_fkey",
		}).onDelete("cascade"),
		unique("job_boards_url_key").on(table.url),
		check("job_boards_alt_text_check", sql`alt_text <> ''::text`),
		check("job_boards_image_name_check", sql`image_name <> ''::text`),
		check("job_boards_url_check", sql`url ~* '^https?://'::text`),
	],
);

export const ticketTypes = pgTable(
	"ticket_types",
	{
		id: text().primaryKey().notNull(),
		name: text().notNull(),
		price: integer().notNull(),
		maxQuantity: integer("max_quantity"),
		description: text(),
		isActive: boolean("is_active").default(true),
		saleStartsAt: timestamp("sale_starts_at", {
			withTimezone: true,
			mode: "string",
		}),
		saleEndsAt: timestamp("sale_ends_at", {
			withTimezone: true,
			mode: "string",
		}),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		stripePriceId: text("stripe_price_id").notNull(),
		isEntryAllowed: boolean("is_entry_allowed").default(true).notNull(),
	},
	(table) => [unique("ticket_types_name_key").on(table.name)],
);

export const companyDraftApprovals = pgTable(
	"company_draft_approvals",
	{
		id: integer()
			.primaryKey()
			.generatedAlwaysAsIdentity({
				name: "company_draft_approvals_id_seq",
				startWith: 1,
				increment: 1,
				minValue: 1,
				maxValue: 2147483647,
				cache: 1,
			}),
		companyDraftId: smallint("company_draft_id"),
		approvedBy: uuid("approved_by"),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.approvedBy],
			foreignColumns: [users.id],
			name: "company_draft_approvals_approved_by_fkey",
		}).onDelete("set null"),
		foreignKey({
			columns: [table.companyDraftId],
			foreignColumns: [companyDrafts.id],
			name: "company_draft_approvals_company_draft_id_fkey",
		}).onDelete("cascade"),
	],
);

export const basicSponsorCompanies = pgTable(
	"basic_sponsor_companies",
	{
		id: smallint()
			.primaryKey()
			.generatedAlwaysAsIdentity({
				name: "basic_sponsor_companies_id_seq",
				startWith: 1,
				increment: 1,
				minValue: 1,
				maxValue: 32767,
				cache: 1,
			}),
		sponsorCompanyId: smallint("sponsor_company_id"),
		basicPlanType: basicPlanType("basic_plan_type").notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.sponsorCompanyId],
			foreignColumns: [sponsorCompanies.id],
			name: "basic_sponsor_companies_sponsor_company_id_fkey",
		}).onDelete("cascade"),
		unique("basic_sponsor_companies_sponsor_company_id_key").on(
			table.sponsorCompanyId,
		),
	],
);

export const deviceApnsTokens = pgTable(
	"device_apns_tokens",
	{
		id: uuid().default(sql`uuid_generate_v7()`).primaryKey().notNull(),
		deviceId: varchar("device_id", { length: 64 }).notNull(),
		token: text().notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.deviceId],
			foreignColumns: [devices.id],
			name: "device_apns_tokens_device_id_fkey",
		}).onDelete("cascade"),
		unique("device_apns_tokens_device_id_key").on(table.deviceId),
		check("device_apns_tokens_token_check", sql`char_length(token) <= 1024`),
	],
);

export const companyInvitation = pgTable(
	"company_invitation",
	{
		companyId: smallint("company_id"),
		key: text().notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		disabledAt: timestamp("disabled_at", { mode: "string" }),
	},
	(table) => [
		foreignKey({
			columns: [table.companyId],
			foreignColumns: [companies.id],
			name: "company_invitation_company_id_fkey",
		}).onDelete("cascade"),
		unique("company_invitation_key_key").on(table.key),
		check("company_invitation_key_check", sql`key <> ''::text`),
	],
);

export const news = pgTable("news", {
	id: integer()
		.primaryKey()
		.generatedAlwaysAsIdentity({
			name: "news_id_seq",
			startWith: 1,
			increment: 1,
			minValue: 1,
			maxValue: 2147483647,
			cache: 1,
		}),
	title: text().notNull(),
	url: text(),
	startsAt: timestamp("starts_at", { mode: "string" }).notNull(),
	endsAt: timestamp("ends_at", { mode: "string" }),
	createdAt: timestamp("created_at", { mode: "string" }).defaultNow().notNull(),
	updatedAt: timestamp("updated_at", { mode: "string" }).defaultNow().notNull(),
});

export const ticketCheckoutSessions = pgTable(
	"ticket_checkout_sessions",
	{
		id: uuid().default(sql`uuid_generate_v7()`).primaryKey().notNull(),
		userId: uuid("user_id").notNull(),
		ticketTypeId: text("ticket_type_id").notNull(),
		status: ticketCheckoutStatus().default("pending").notNull(),
		stripeCheckoutSessionId: text("stripe_checkout_session_id").notNull(),
		expiresAt: timestamp("expires_at", { withTimezone: true, mode: "string" })
			.default(sql`(now() + '00:10:00'::interval)`)
			.notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		stripeCheckoutUrl: text("stripe_checkout_url").notNull(),
		ticketCheckoutWorkflowId: text("ticket_checkout_workflow_id"),
	},
	(table) => [
		index("idx_ticket_checkout_sessions_expires_at").using(
			"btree",
			table.expiresAt.asc().nullsLast().op("timestamptz_ops"),
		),
		index("idx_ticket_checkout_sessions_status").using(
			"btree",
			table.status.asc().nullsLast().op("enum_ops"),
		),
		index("idx_ticket_checkout_sessions_user_id").using(
			"btree",
			table.userId.asc().nullsLast().op("uuid_ops"),
		),
		foreignKey({
			columns: [table.ticketTypeId],
			foreignColumns: [ticketTypes.id],
			name: "ticket_checkout_sessions_ticket_type_id_fkey",
		}).onDelete("cascade"),
		foreignKey({
			columns: [table.userId],
			foreignColumns: [users.id],
			name: "ticket_checkout_sessions_user_id_fkey",
		}).onDelete("cascade"),
		unique("ticket_checkout_sessions_stripe_checkout_session_id_key").on(
			table.stripeCheckoutSessionId,
		),
	],
);

export const sponsorCompanies = pgTable(
	"sponsor_companies",
	{
		id: smallint()
			.primaryKey()
			.generatedAlwaysAsIdentity({
				name: "sponsor_companies_id_seq",
				startWith: 1,
				increment: 1,
				minValue: 1,
				maxValue: 32767,
				cache: 1,
			}),
		companyId: smallint("company_id"),
		sponsorType: companySponsorType("sponsor_type").notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		displayOrder: text("display_order").notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.companyId],
			foreignColumns: [companies.id],
			name: "sponsor_companies_company_id_fkey",
		}).onDelete("cascade"),
	],
);

export const ticketCheckoutOptions = pgTable(
	"ticket_checkout_options",
	{
		id: uuid().default(sql`uuid_generate_v7()`).primaryKey().notNull(),
		checkoutSessionId: uuid("checkout_session_id").notNull(),
		ticketOptionId: text("ticket_option_id").notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		index("idx_ticket_checkout_options_checkout_session_id").using(
			"btree",
			table.checkoutSessionId.asc().nullsLast().op("uuid_ops"),
		),
		foreignKey({
			columns: [table.checkoutSessionId],
			foreignColumns: [ticketCheckoutSessions.id],
			name: "ticket_checkout_options_checkout_session_id_fkey",
		}).onDelete("cascade"),
		foreignKey({
			columns: [table.ticketOptionId],
			foreignColumns: [ticketOptions.id],
			name: "ticket_checkout_options_ticket_option_id_fkey",
		}).onDelete("cascade"),
		unique(
			"ticket_checkout_options_checkout_session_id_ticket_option_i_key",
		).on(table.checkoutSessionId, table.ticketOptionId),
	],
);

export const companyDrafts = pgTable(
	"company_drafts",
	{
		id: smallint()
			.primaryKey()
			.generatedAlwaysAsIdentity({
				name: "company_drafts_id_seq",
				startWith: 1,
				increment: 1,
				minValue: 1,
				maxValue: 32767,
				cache: 1,
			}),
		companyId: smallint("company_id"),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		slug: text().notNull(),
		websiteUrl: text("website_url").notNull(),
		xAccount: text("x_account"),
		prText: text("pr_text").notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.companyId],
			foreignColumns: [companies.id],
			name: "company_drafts_company_id_fkey",
		}).onDelete("cascade"),
		unique("company_drafts_slug_key").on(table.slug),
		check("company_drafts_pr_text_check", sql`pr_text <> ''::text`),
		check("company_drafts_slug_check", sql`slug <> ''::text`),
		check("company_drafts_website_url_check", sql`website_url <> ''::text`),
		check("company_drafts_x_account_check", sql`x_account <> ''::text`),
	],
);

export const sessionVenues = pgTable(
	"session_venues",
	{
		id: uuid().default(sql`uuid_generate_v4()`).primaryKey().notNull(),
		name: text().notNull(),
	},
	(table) => [
		pgPolicy("session_venues_admin_write", {
			as: "permissive",
			for: "all",
			to: ["authenticated"],
			using: sql`(EXISTS ( SELECT 1
   FROM user_roles
  WHERE ((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::role))))`,
		}),
		pgPolicy("session_venues_read_all", {
			as: "permissive",
			for: "select",
			to: ["public"],
		}),
	],
);

export const sponsorCompanyOptions = pgTable(
	"sponsor_company_options",
	{
		id: smallint()
			.primaryKey()
			.generatedAlwaysAsIdentity({
				name: "sponsor_company_options_id_seq",
				startWith: 1,
				increment: 1,
				minValue: 1,
				maxValue: 32767,
				cache: 1,
			}),
		sponsorCompanyId: smallint("sponsor_company_id"),
		optionPlanType: optionPlanType("option_plan_type").notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.sponsorCompanyId],
			foreignColumns: [sponsorCompanies.id],
			name: "sponsor_company_options_sponsor_company_id_fkey",
		}).onDelete("cascade"),
		unique(
			"sponsor_company_options_sponsor_company_id_option_plan_type_key",
		).on(table.sponsorCompanyId, table.optionPlanType),
	],
);

export const deviceFcmTokens = pgTable(
	"device_fcm_tokens",
	{
		deviceId: varchar("device_id", { length: 64 }).primaryKey().notNull(),
		token: text().notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.deviceId],
			foreignColumns: [devices.id],
			name: "device_fcm_tokens_device_id_fkey",
		}).onDelete("cascade"),
		check("device_fcm_tokens_token_check", sql`char_length(token) <= 1024`),
	],
);

export const speakers = pgTable(
	"speakers",
	{
		id: uuid().default(sql`uuid_generate_v4()`).primaryKey().notNull(),
		name: text().notNull(),
		avatarUrl: text("avatar_url"),
		xId: text("x_id"),
	},
	(table) => [
		pgPolicy("speakers_admin_write", {
			as: "permissive",
			for: "all",
			to: ["authenticated"],
			using: sql`(EXISTS ( SELECT 1
   FROM user_roles
  WHERE ((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::role))))`,
		}),
		pgPolicy("speakers_read_all", {
			as: "permissive",
			for: "select",
			to: ["public"],
		}),
	],
);

export const profiles = pgTable(
	"profiles",
	{
		id: uuid().primaryKey().notNull(),
		name: text().notNull(),
		comment: text().notNull(),
		isAdult: boolean("is_adult").default(false).notNull(),
		avatarKey: text("avatar_key"),
		createdAt: timestamp("created_at", { mode: "string" })
			.default(sql`CURRENT_TIMESTAMP`)
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.default(sql`CURRENT_TIMESTAMP`)
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.id],
			foreignColumns: [usersInAuth.id],
			name: "profiles_id_fkey",
		}).onDelete("cascade"),
		check("profiles_comment_check", sql`char_length(comment) <= 100`),
	],
);

export const individualDraftApprovals = pgTable(
	"individual_draft_approvals",
	{
		id: integer()
			.primaryKey()
			.generatedAlwaysAsIdentity({
				name: "individual_draft_approvals_id_seq",
				startWith: 1,
				increment: 1,
				minValue: 1,
				maxValue: 2147483647,
				cache: 1,
			}),
		individualDraftId: integer("individual_draft_id"),
		approvedBy: uuid("approved_by"),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.approvedBy],
			foreignColumns: [users.id],
			name: "individual_draft_approvals_approved_by_fkey",
		}).onDelete("set null"),
		foreignKey({
			columns: [table.individualDraftId],
			foreignColumns: [individualDrafts.id],
			name: "individual_draft_approvals_individual_draft_id_fkey",
		}).onDelete("cascade"),
	],
);

export const devices = pgTable(
	"devices",
	{
		id: varchar({ length: 64 }).primaryKey().notNull(),
		userId: uuid("user_id").notNull(),
		type: deviceType().notNull(),
		name: text().notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.userId],
			foreignColumns: [usersInAuth.id],
			name: "devices_user_id_fkey",
		}).onDelete("cascade"),
		check("devices_name_check", sql`char_length(name) <= 255`),
	],
);

export const sessions = pgTable(
	"sessions",
	{
		id: uuid().default(sql`uuid_generate_v4()`).primaryKey().notNull(),
		title: text().notNull(),
		description: text().notNull(),
		startsAt: timestamp("starts_at", {
			withTimezone: true,
			mode: "string",
		}).notNull(),
		endsAt: timestamp("ends_at", {
			withTimezone: true,
			mode: "string",
		}).notNull(),
		venueId: uuid("venue_id").notNull(),
		sponsorId: smallint("sponsor_id"),
		isLightningTalk: boolean("is_lightning_talk").default(false).notNull(),
		isBeginnersLightningTalk: boolean("is_beginners_lightning_talk")
			.default(false)
			.notNull(),
		isHandsOn: boolean("is_hands_on").default(false).notNull(),
		videoUrl: text("video_url"),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.sponsorId],
			foreignColumns: [sponsorCompanies.id],
			name: "sessions_sponsor_id_fkey",
		}),
		foreignKey({
			columns: [table.venueId],
			foreignColumns: [sessionVenues.id],
			name: "sessions_venue_id_fkey",
		}),
		pgPolicy("sessions_admin_write", {
			as: "permissive",
			for: "all",
			to: ["authenticated"],
			using: sql`(EXISTS ( SELECT 1
   FROM user_roles
  WHERE ((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::role))))`,
		}),
		pgPolicy("sessions_read_all", {
			as: "permissive",
			for: "select",
			to: ["public"],
		}),
	],
);

export const individualDrafts = pgTable(
	"individual_drafts",
	{
		id: integer()
			.primaryKey()
			.generatedAlwaysAsIdentity({
				name: "individual_drafts_id_seq",
				startWith: 1,
				increment: 1,
				minValue: 1,
				maxValue: 2147483647,
				cache: 1,
			}),
		individualId: integer("individual_id"),
		name: text().notNull(),
		logoName: text("logo_name"),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		slug: text().notNull(),
		enthusiasm: text(),
		xAccount: text("x_account"),
	},
	(table) => [
		foreignKey({
			columns: [table.individualId],
			foreignColumns: [individuals.id],
			name: "individual_drafts_individual_id_fkey",
		}).onDelete("cascade"),
		unique("individual_drafts_slug_key").on(table.slug),
		check("individual_drafts_enthusiasm_check", sql`enthusiasm <> ''::text`),
		check("individual_drafts_name_check", sql`name <> ''::text`),
		check("individual_drafts_slug_check", sql`slug <> ''::text`),
		check("individual_drafts_x_account_check", sql`x_account <> ''::text`),
	],
);

export const userSnsLinks = pgTable(
	"user_sns_links",
	{
		id: uuid().default(sql`uuid_generate_v7()`).primaryKey().notNull(),
		userId: uuid("user_id").notNull(),
		snsType: snsType("sns_type").notNull(),
		value: text().notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.default(sql`CURRENT_TIMESTAMP`)
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.default(sql`CURRENT_TIMESTAMP`)
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.userId],
			foreignColumns: [usersInAuth.id],
			name: "user_sns_links_user_id_fkey",
		}).onDelete("cascade"),
		unique("user_sns_links_user_id_sns_type_key").on(
			table.userId,
			table.snsType,
		),
		check(
			"user_sns_links_value_check",
			sql`char_length(TRIM(BOTH FROM value)) > 0`,
		),
	],
);

export const sponsorIndividuals = pgTable(
	"sponsor_individuals",
	{
		id: smallint()
			.primaryKey()
			.generatedAlwaysAsIdentity({
				name: "sponsor_individuals_id_seq",
				startWith: 1,
				increment: 1,
				minValue: 1,
				maxValue: 32767,
				cache: 1,
			}),
		individualId: smallint("individual_id"),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.individualId],
			foreignColumns: [individuals.id],
			name: "sponsor_individuals_individual_id_fkey",
		}).onDelete("cascade"),
	],
);

export const oauthAuthorizationsInAuth = auth.table(
	"oauth_authorizations",
	{
		id: uuid().notNull(),
		authorizationId: text("authorization_id").notNull(),
		clientId: uuid("client_id").notNull(),
		userId: uuid("user_id"),
		redirectUri: text("redirect_uri").notNull(),
		scope: text().notNull(),
		state: text(),
		resource: text(),
		codeChallenge: text("code_challenge"),
		codeChallengeMethod: codeChallengeMethodInAuth("code_challenge_method"),
		responseType: oauthResponseTypeInAuth("response_type")
			.default("code")
			.notNull(),
		status: oauthAuthorizationStatusInAuth().default("pending").notNull(),
		authorizationCode: text("authorization_code"),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" })
			.defaultNow()
			.notNull(),
		expiresAt: timestamp("expires_at", { withTimezone: true, mode: "string" })
			.default(sql`(now() + '00:03:00'::interval)`)
			.notNull(),
		approvedAt: timestamp("approved_at", {
			withTimezone: true,
			mode: "string",
		}),
	},
	(table) => [
		index("oauth_auth_pending_exp_idx")
			.using("btree", table.expiresAt.asc().nullsLast().op("timestamptz_ops"))
			.where(sql`(status = 'pending'::auth.oauth_authorization_status)`),
		foreignKey({
			columns: [table.clientId],
			foreignColumns: [oauthClientsInAuth.id],
			name: "oauth_authorizations_client_id_fkey",
		}).onDelete("cascade"),
		foreignKey({
			columns: [table.userId],
			foreignColumns: [usersInAuth.id],
			name: "oauth_authorizations_user_id_fkey",
		}).onDelete("cascade"),
		check(
			"oauth_authorizations_authorization_code_length",
			sql`char_length(authorization_code) <= 255`,
		),
		check(
			"oauth_authorizations_code_challenge_length",
			sql`char_length(code_challenge) <= 128`,
		),
		check(
			"oauth_authorizations_expires_at_future",
			sql`expires_at > created_at`,
		),
		check(
			"oauth_authorizations_redirect_uri_length",
			sql`char_length(redirect_uri) <= 2048`,
		),
		check(
			"oauth_authorizations_resource_length",
			sql`char_length(resource) <= 2048`,
		),
		check("oauth_authorizations_scope_length", sql`char_length(scope) <= 4096`),
		check("oauth_authorizations_state_length", sql`char_length(state) <= 4096`),
	],
);

export const oauthConsentsInAuth = auth.table(
	"oauth_consents",
	{
		id: uuid().notNull(),
		userId: uuid("user_id").notNull(),
		clientId: uuid("client_id").notNull(),
		scopes: text().notNull(),
		grantedAt: timestamp("granted_at", { withTimezone: true, mode: "string" })
			.defaultNow()
			.notNull(),
		revokedAt: timestamp("revoked_at", { withTimezone: true, mode: "string" }),
	},
	(table) => [
		index("oauth_consents_active_client_idx")
			.using("btree", table.clientId.asc().nullsLast().op("uuid_ops"))
			.where(sql`(revoked_at IS NULL)`),
		index("oauth_consents_active_user_client_idx")
			.using(
				"btree",
				table.userId.asc().nullsLast().op("uuid_ops"),
				table.clientId.asc().nullsLast().op("uuid_ops"),
			)
			.where(sql`(revoked_at IS NULL)`),
		index("oauth_consents_user_order_idx").using(
			"btree",
			table.userId.asc().nullsLast().op("timestamptz_ops"),
			table.grantedAt.desc().nullsFirst().op("timestamptz_ops"),
		),
		foreignKey({
			columns: [table.clientId],
			foreignColumns: [oauthClientsInAuth.id],
			name: "oauth_consents_client_id_fkey",
		}).onDelete("cascade"),
		foreignKey({
			columns: [table.userId],
			foreignColumns: [usersInAuth.id],
			name: "oauth_consents_user_id_fkey",
		}).onDelete("cascade"),
		check(
			"oauth_consents_revoked_after_granted",
			sql`(revoked_at IS NULL) OR (revoked_at >= granted_at)`,
		),
		check("oauth_consents_scopes_length", sql`char_length(scopes) <= 2048`),
		check(
			"oauth_consents_scopes_not_empty",
			sql`char_length(TRIM(BOTH FROM scopes)) > 0`,
		),
	],
);

export const profileShare = pgTable(
	"profile_share",
	{
		id: uuid().default(sql`uuid_generate_v7()`).primaryKey().notNull(),
		fromId: uuid("from_id").notNull(),
		toId: uuid("to_id").notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.default(sql`CURRENT_TIMESTAMP`)
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.default(sql`CURRENT_TIMESTAMP`)
			.notNull(),
	},
	(table) => [
		index().using("btree", table.fromId.asc().nullsLast().op("uuid_ops")),
		index().using("btree", table.toId.asc().nullsLast().op("uuid_ops")),
		foreignKey({
			columns: [table.fromId],
			foreignColumns: [profiles.id],
			name: "profile_share_from_id_fkey",
		}).onDelete("cascade"),
		foreignKey({
			columns: [table.toId],
			foreignColumns: [profiles.id],
			name: "profile_share_to_id_fkey",
		}).onDelete("cascade"),
		unique("profile_share_from_id_to_id_key").on(table.fromId, table.toId),
		check("profile_share_check", sql`from_id <> to_id`),
	],
);

export const sessionSpeakers = pgTable(
	"session_speakers",
	{
		sessionId: uuid("session_id").notNull(),
		speakerId: uuid("speaker_id").notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.sessionId],
			foreignColumns: [sessions.id],
			name: "session_speakers_session_id_fkey",
		}).onDelete("cascade"),
		foreignKey({
			columns: [table.speakerId],
			foreignColumns: [speakers.id],
			name: "session_speakers_speaker_id_fkey",
		}).onDelete("cascade"),
		primaryKey({
			columns: [table.sessionId, table.speakerId],
			name: "session_speakers_pkey",
		}),
		pgPolicy("session_speakers_admin_write", {
			as: "permissive",
			for: "all",
			to: ["authenticated"],
			using: sql`(EXISTS ( SELECT 1
   FROM user_roles
  WHERE ((user_roles.user_id = auth.uid()) AND (user_roles.role = 'admin'::role))))`,
		}),
		pgPolicy("session_speakers_read_all", {
			as: "permissive",
			for: "select",
			to: ["public"],
		}),
	],
);

export const userRoles = pgTable(
	"user_roles",
	{
		userId: uuid("user_id").notNull(),
		role: role().notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.default(sql`CURRENT_TIMESTAMP`)
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.userId],
			foreignColumns: [users.id],
			name: "user_roles_user_id_fkey",
		}).onDelete("cascade"),
		primaryKey({
			columns: [table.userId, table.role],
			name: "user_roles_pkey",
		}),
	],
);

export const companyMembers = pgTable(
	"company_members",
	{
		companyId: smallint("company_id").notNull(),
		userId: uuid("user_id").notNull(),
		joinedAt: timestamp("joined_at", { mode: "string" }).defaultNow().notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.companyId],
			foreignColumns: [companies.id],
			name: "company_members_company_id_fkey",
		}).onDelete("cascade"),
		foreignKey({
			columns: [table.userId],
			foreignColumns: [users.id],
			name: "company_members_user_id_fkey",
		}).onDelete("cascade"),
		primaryKey({
			columns: [table.companyId, table.userId],
			name: "company_members_pkey",
		}),
	],
);

export const deviceApnsLiveActivityTokens = pgTable(
	"device_apns_live_activity_tokens",
	{
		deviceId: varchar("device_id", { length: 64 }).notNull(),
		token: text().notNull(),
		type: apnsLiveActivityTokenType().notNull(),
		topic: text().notNull(),
		createdAt: timestamp("created_at", { mode: "string" })
			.defaultNow()
			.notNull(),
		updatedAt: timestamp("updated_at", { mode: "string" })
			.defaultNow()
			.notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.deviceId],
			foreignColumns: [devices.id],
			name: "device_apns_live_activity_tokens_device_id_fkey",
		}).onDelete("cascade"),
		primaryKey({
			columns: [table.deviceId, table.type, table.topic],
			name: "device_apns_live_activity_tokens_pkey",
		}),
		check(
			"device_apns_live_activity_tokens_token_check",
			sql`char_length(token) <= 1024`,
		),
		check(
			"device_apns_live_activity_tokens_topic_check",
			sql`char_length(topic) <= 255`,
		),
	],
);
export const vTicketOptionCounts = pgView("v_ticket_option_counts", {
	ticketOptionId: text("ticket_option_id"),
	ticketTypeId: text("ticket_type_id"),
	soldCount: integer("sold_count"),
	reservedCount: integer("reserved_count"),
}).as(
	sql`SELECT topt.id AS ticket_option_id, topt.ticket_type_id, COALESCE(tpo_counts.sold_count, 0) AS sold_count, COALESCE(tco_counts.reserved_count, 0) AS reserved_count FROM ticket_options topt LEFT JOIN ( SELECT tpo.ticket_option_id, count(*)::integer AS sold_count FROM ticket_purchase_options tpo JOIN ticket_purchases tp ON tpo.ticket_purchase_id = tp.id GROUP BY tpo.ticket_option_id) tpo_counts ON topt.id = tpo_counts.ticket_option_id LEFT JOIN ( SELECT tco.ticket_option_id, count(*)::integer AS reserved_count FROM ticket_checkout_options tco JOIN ticket_checkout_sessions tcs ON tco.checkout_session_id = tcs.id WHERE tcs.status = 'pending'::ticket_checkout_status AND tcs.expires_at > now() GROUP BY tco.ticket_option_id) tco_counts ON topt.id = tco_counts.ticket_option_id`,
);

export const vTicketCounts = pgView("v_ticket_counts", {
	ticketTypeId: text("ticket_type_id"),
	soldCount: integer("sold_count"),
	reservedCount: integer("reserved_count"),
}).as(
	sql`SELECT tt.id AS ticket_type_id, COALESCE(tp_counts.sold_count, 0) AS sold_count, COALESCE(tcs_counts.reserved_count, 0) AS reserved_count FROM ticket_types tt LEFT JOIN ( SELECT tp.ticket_type_id, count(*)::integer AS sold_count FROM ticket_purchases tp GROUP BY tp.ticket_type_id) tp_counts ON tt.id = tp_counts.ticket_type_id LEFT JOIN ( SELECT tcs.ticket_type_id, count(*)::integer AS reserved_count FROM ticket_checkout_sessions tcs WHERE tcs.status = 'pending'::ticket_checkout_status AND tcs.expires_at > now() GROUP BY tcs.ticket_type_id) tcs_counts ON tt.id = tcs_counts.ticket_type_id`,
);

export const sessionVenuesWithSessions = pgView(
	"session_venues_with_sessions",
	{ id: uuid(), name: text(), sessions: json() },
).as(
	sql`SELECT sv.id, sv.name, COALESCE(( SELECT json_agg(json_build_object('id', s.id, 'title', s.title, 'description', s.description, 'starts_at', s.starts_at, 'ends_at', s.ends_at, 'is_lightning_talk', s.is_lightning_talk, 'is_beginners_lightning_talk', s.is_beginners_lightning_talk, 'is_hands_on', s.is_hands_on, 'video_url', s.video_url, 'speakers', COALESCE(( SELECT json_agg(json_build_object('id', sp.id, 'name', sp.name, 'avatar_url', sp.avatar_url, 'x_id', sp.x_id)) AS json_agg FROM session_speakers ss JOIN speakers sp ON ss.speaker_id = sp.id WHERE ss.session_id = s.id), '[]'::json), 'sponsor', CASE WHEN s.sponsor_id IS NOT NULL THEN ( SELECT json_build_object('id', c.id, 'name', c.name, 'logo_url', c.logo_name, 'slug', cd.slug, 'pr_text', cd.pr_text, 'website_url', cd.website_url, 'sponsor_type', sc.sponsor_type, 'display_order', sc.display_order, 'basic_plan_type', bsc.basic_plan_type, 'option_plan_types', COALESCE(array_agg(sco.option_plan_type::text) FILTER (WHERE sco.option_plan_type IS NOT NULL), ARRAY[]::text[])) AS json_build_object FROM companies c JOIN sponsor_companies sc ON c.id = sc.company_id LEFT JOIN basic_sponsor_companies bsc ON sc.id = bsc.sponsor_company_id LEFT JOIN company_drafts cd ON c.id = cd.company_id LEFT JOIN company_draft_approvals cda ON cd.id = cda.company_draft_id LEFT JOIN sponsor_company_options sco ON sc.id = sco.sponsor_company_id WHERE sc.id = s.sponsor_id GROUP BY c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url, sc.sponsor_type, sc.display_order, bsc.basic_plan_type) ELSE NULL::json END) ORDER BY s.starts_at) AS json_agg FROM sessions s WHERE s.venue_id = sv.id), '[]'::json) AS sessions FROM session_venues sv ORDER BY sv.name`,
);

export const sponsorWithSessions = pgView("sponsor_with_sessions", {
	sponsor: json(),
	sessions: json(),
}).as(
	sql`SELECT json_build_object('id', c.id, 'name', c.name, 'logo_url', c.logo_name, 'slug', cd.slug, 'pr_text', cd.pr_text, 'website_url', cd.website_url, 'sponsor_type', sc.sponsor_type, 'display_order', sc.display_order, 'basic_plan_type', bsc.basic_plan_type, 'option_plan_types', COALESCE(array_agg(DISTINCT sco.option_plan_type::text) FILTER (WHERE sco.option_plan_type IS NOT NULL), ARRAY[]::text[])) AS sponsor, COALESCE(( SELECT json_agg(json_build_object('id', s.id, 'title', s.title, 'description', s.description, 'starts_at', s.starts_at, 'ends_at', s.ends_at, 'is_lightning_talk', s.is_lightning_talk, 'is_beginners_lightning_talk', s.is_beginners_lightning_talk, 'is_hands_on', s.is_hands_on, 'video_url', s.video_url, 'venue', json_build_object('id', sv.id, 'name', sv.name), 'speakers', COALESCE(( SELECT json_agg(json_build_object('id', sp.id, 'name', sp.name, 'avatar_url', sp.avatar_url, 'x_id', sp.x_id)) AS json_agg FROM session_speakers ss JOIN speakers sp ON ss.speaker_id = sp.id WHERE ss.session_id = s.id), '[]'::json)) ORDER BY s.starts_at) AS json_agg FROM sessions s JOIN session_venues sv ON s.venue_id = sv.id WHERE s.sponsor_id = sc.id), '[]'::json) AS sessions FROM sponsor_companies sc JOIN companies c ON sc.company_id = c.id LEFT JOIN basic_sponsor_companies bsc ON sc.id = bsc.sponsor_company_id LEFT JOIN company_drafts cd ON c.id = cd.company_id LEFT JOIN company_draft_approvals cda ON cd.id = cda.company_draft_id LEFT JOIN sponsor_company_options sco ON sc.id = sco.sponsor_company_id WHERE cda.id IS NOT NULL GROUP BY c.id, c.name, c.logo_name, cd.slug, cd.pr_text, cd.website_url, sc.sponsor_type, sc.display_order, bsc.basic_plan_type, sc.id HAVING (EXISTS ( SELECT 1 FROM sessions s WHERE s.sponsor_id = sc.id)) ORDER BY sc.display_order`,
);

export const vDeviceTokens = pgView("v_device_tokens", {
	deviceId: varchar("device_id", { length: 64 }),
	userId: uuid("user_id"),
	createdAt: timestamp("created_at", { mode: "string" }),
	device: json(),
	apnsToken: json("apns_token"),
	fcmToken: json("fcm_token"),
	apnsLiveActivityTokens: json("apns_live_activity_tokens"),
}).as(
	sql`SELECT d.id AS device_id, d.user_id, d.created_at, json_build_object('id', d.id, 'user_id', d.user_id, 'type', d.type::text, 'name', d.name, 'created_at', d.created_at, 'updated_at', d.updated_at) AS device, CASE WHEN dat.id IS NOT NULL THEN json_build_object('id', dat.id, 'device_id', dat.device_id, 'token', dat.token, 'created_at', dat.created_at, 'updated_at', dat.updated_at) ELSE NULL::json END AS apns_token, CASE WHEN dft.device_id IS NOT NULL THEN json_build_object('device_id', dft.device_id, 'token', dft.token, 'created_at', dft.created_at, 'updated_at', dft.updated_at) ELSE NULL::json END AS fcm_token, COALESCE(json_agg( CASE WHEN dalt.device_id IS NOT NULL THEN json_build_object('device_id', dalt.device_id, 'token', dalt.token, 'type', dalt.type::text, 'topic', dalt.topic, 'created_at', dalt.created_at, 'updated_at', dalt.updated_at) ELSE NULL::json END) FILTER (WHERE dalt.device_id IS NOT NULL), '[]'::json) AS apns_live_activity_tokens FROM devices d LEFT JOIN device_apns_tokens dat ON d.id::text = dat.device_id::text LEFT JOIN device_fcm_tokens dft ON d.id::text = dft.device_id::text LEFT JOIN device_apns_live_activity_tokens dalt ON d.id::text = dalt.device_id::text GROUP BY d.id, dat.id, dft.device_id`,
);
