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
export const oneTimeTokenTypeInAuth = auth.enum("one_time_token_type", [
	"confirmation_token",
	"reauthentication_token",
	"recovery_token",
	"email_change_token_new",
	"email_change_token_current",
	"phone_change_token",
]);
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

export const schemaMigrationsInAuth = auth.table("schema_migrations", {
	version: varchar({ length: 255 }).primaryKey().notNull(),
});

export const instancesInAuth = auth.table("instances", {
	id: uuid().primaryKey().notNull(),
	uuid: uuid(),
	rawBaseConfig: text("raw_base_config"),
	createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
	updatedAt: timestamp("updated_at", { withTimezone: true, mode: "string" }),
});

export const usersInAuth = auth.table(
	"users",
	{
		instanceId: uuid("instance_id"),
		id: uuid().primaryKey().notNull(),
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
		phoneChange: text("phone_change").default(""),
		phoneChangeToken: varchar("phone_change_token", { length: 255 }).default(
			"",
		),
		phoneChangeSentAt: timestamp("phone_change_sent_at", {
			withTimezone: true,
			mode: "string",
		}),
		confirmedAt: timestamp("confirmed_at", {
			withTimezone: true,
			mode: "string",
		}).generatedAlwaysAs(sql`LEAST(email_confirmed_at, phone_confirmed_at)`),
		emailChangeTokenCurrent: varchar("email_change_token_current", {
			length: 255,
		}).default(""),
		emailChangeConfirmStatus: smallint("email_change_confirm_status").default(
			0,
		),
		bannedUntil: timestamp("banned_until", {
			withTimezone: true,
			mode: "string",
		}),
		reauthenticationToken: varchar("reauthentication_token", {
			length: 255,
		}).default(""),
		reauthenticationSentAt: timestamp("reauthentication_sent_at", {
			withTimezone: true,
			mode: "string",
		}),
		isSsoUser: boolean("is_sso_user").default(false).notNull(),
		deletedAt: timestamp("deleted_at", { withTimezone: true, mode: "string" }),
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
		unique("users_phone_key").on(table.phone),
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
		id: uuid().primaryKey().notNull(),
		payload: json(),
		createdAt: timestamp("created_at", { withTimezone: true, mode: "string" }),
		ipAddress: varchar("ip_address", { length: 64 }).default("").notNull(),
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
		id: uuid().primaryKey().notNull(),
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
			columns: [table.ssoProviderId],
			foreignColumns: [ssoProvidersInAuth.id],
			name: "saml_relay_states_sso_provider_id_fkey",
		}).onDelete("cascade"),
		foreignKey({
			columns: [table.flowStateId],
			foreignColumns: [flowStateInAuth.id],
			name: "saml_relay_states_flow_state_id_fkey",
		}).onDelete("cascade"),
		check("request_id not empty", sql`char_length(request_id) > 0`),
	],
);

export const refreshTokensInAuth = auth.table(
	"refresh_tokens",
	{
		instanceId: uuid("instance_id"),
		id: bigserial({ mode: "bigint" }).primaryKey().notNull(),
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
		unique("refresh_tokens_token_unique").on(table.token),
	],
);

export const sessionsInAuth = auth.table(
	"sessions",
	{
		id: uuid().primaryKey().notNull(),
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
	},
	(table) => [
		index("sessions_not_after_idx").using(
			"btree",
			table.notAfter.desc().nullsFirst().op("timestamptz_ops"),
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
			columns: [table.userId],
			foreignColumns: [usersInAuth.id],
			name: "sessions_user_id_fkey",
		}).onDelete("cascade"),
	],
);

export const ssoDomainsInAuth = auth.table(
	"sso_domains",
	{
		id: uuid().primaryKey().notNull(),
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
		id: uuid().primaryKey().notNull(),
	},
	(table) => [
		foreignKey({
			columns: [table.sessionId],
			foreignColumns: [sessionsInAuth.id],
			name: "mfa_amr_claims_session_id_fkey",
		}).onDelete("cascade"),
		unique("mfa_amr_claims_session_id_authentication_method_pkey").on(
			table.sessionId,
			table.authenticationMethod,
		),
	],
);

export const samlProvidersInAuth = auth.table(
	"saml_providers",
	{
		id: uuid().primaryKey().notNull(),
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
		unique("saml_providers_entity_id_key").on(table.entityId),
		check("metadata_xml not empty", sql`char_length(metadata_xml) > 0`),
		check(
			"metadata_url not empty",
			sql`(metadata_url = NULL::text) OR (char_length(metadata_url) > 0)`,
		),
		check("entity_id not empty", sql`char_length(entity_id) > 0`),
	],
);

export const flowStateInAuth = auth.table(
	"flow_state",
	{
		id: uuid().primaryKey().notNull(),
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
		id: uuid().defaultRandom().primaryKey().notNull(),
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
		unique("identities_provider_id_provider_unique").on(
			table.providerId,
			table.provider,
		),
	],
);

export const oneTimeTokensInAuth = auth.table(
	"one_time_tokens",
	{
		id: uuid().primaryKey().notNull(),
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
		id: uuid().primaryKey().notNull(),
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
		unique("mfa_factors_last_challenged_at_key").on(table.lastChallengedAt),
	],
);

export const mfaChallengesInAuth = auth.table(
	"mfa_challenges",
	{
		id: uuid().primaryKey().notNull(),
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

export const ssoProvidersInAuth = auth.table(
	"sso_providers",
	{
		id: uuid().primaryKey().notNull(),
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

export const individuals = pgTable(
	"individuals",
	{
		id: integer().primaryKey().generatedAlwaysAsIdentity({
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

export const companyDraftApprovals = pgTable(
	"company_draft_approvals",
	{
		id: integer().primaryKey().generatedAlwaysAsIdentity({
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

export const individualDraftApprovals = pgTable(
	"individual_draft_approvals",
	{
		id: integer().primaryKey().generatedAlwaysAsIdentity({
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

export const sponsorIndividuals = pgTable(
	"sponsor_individuals",
	{
		id: smallint().primaryKey().generatedAlwaysAsIdentity({
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

export const stripeWebhookLogs = pgTable(
	"stripe_webhook_logs",
	{
		id: integer().primaryKey().generatedAlwaysAsIdentity({
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

export const companies = pgTable(
	"companies",
	{
		id: smallint().primaryKey().generatedAlwaysAsIdentity({
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
	() => [
		check("companies_name_check", sql`name <> ''::text`),
		check("companies_logo_name_check", sql`logo_name <> ''::text`),
	],
);

export const news = pgTable("news", {
	id: integer().primaryKey().generatedAlwaysAsIdentity({
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
	},
	(table) => [unique("ticket_types_name_key").on(table.name)],
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

export const basicSponsorCompanies = pgTable(
	"basic_sponsor_companies",
	{
		id: smallint().primaryKey().generatedAlwaysAsIdentity({
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

export const sponsorCompanyOptions = pgTable(
	"sponsor_company_options",
	{
		id: smallint().primaryKey().generatedAlwaysAsIdentity({
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

export const companyDrafts = pgTable(
	"company_drafts",
	{
		id: smallint().primaryKey().generatedAlwaysAsIdentity({
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
		check("company_drafts_slug_check", sql`slug <> ''::text`),
		check("company_drafts_website_url_check", sql`website_url <> ''::text`),
		check("company_drafts_x_account_check", sql`x_account <> ''::text`),
		check("company_drafts_pr_text_check", sql`pr_text <> ''::text`),
	],
);

export const individualDrafts = pgTable(
	"individual_drafts",
	{
		id: integer().primaryKey().generatedAlwaysAsIdentity({
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
		check("individual_drafts_name_check", sql`name <> ''::text`),
		check("individual_drafts_slug_check", sql`slug <> ''::text`),
		check("individual_drafts_enthusiasm_check", sql`enthusiasm <> ''::text`),
		check("individual_drafts_x_account_check", sql`x_account <> ''::text`),
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

export const sponsorCompanies = pgTable(
	"sponsor_companies",
	{
		id: smallint().primaryKey().generatedAlwaysAsIdentity({
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
export const vTicketCounts = pgView("v_ticket_counts", {
	ticketTypeId: text("ticket_type_id"),
	soldCount: integer("sold_count"),
	reservedCount: integer("reserved_count"),
}).as(
	sql`SELECT tt.id AS ticket_type_id, COALESCE(tp_counts.sold_count, 0) AS sold_count, COALESCE(tcs_counts.reserved_count, 0) AS reserved_count FROM ticket_types tt LEFT JOIN ( SELECT tp.ticket_type_id, count(*)::integer AS sold_count FROM ticket_purchases tp GROUP BY tp.ticket_type_id) tp_counts ON tt.id = tp_counts.ticket_type_id LEFT JOIN ( SELECT tcs.ticket_type_id, count(*)::integer AS reserved_count FROM ticket_checkout_sessions tcs WHERE tcs.status = 'pending'::ticket_checkout_status AND tcs.expires_at > now() GROUP BY tcs.ticket_type_id) tcs_counts ON tt.id = tcs_counts.ticket_type_id`,
);

export const vTicketOptionCounts = pgView("v_ticket_option_counts", {
	ticketOptionId: text("ticket_option_id"),
	ticketTypeId: text("ticket_type_id"),
	soldCount: integer("sold_count"),
	reservedCount: integer("reserved_count"),
}).as(
	sql`SELECT topt.id AS ticket_option_id, topt.ticket_type_id, COALESCE(tpo_counts.sold_count, 0) AS sold_count, COALESCE(tco_counts.reserved_count, 0) AS reserved_count FROM ticket_options topt LEFT JOIN ( SELECT tpo.ticket_option_id, count(*)::integer AS sold_count FROM ticket_purchase_options tpo JOIN ticket_purchases tp ON tpo.ticket_purchase_id = tp.id GROUP BY tpo.ticket_option_id) tpo_counts ON topt.id = tpo_counts.ticket_option_id LEFT JOIN ( SELECT tco.ticket_option_id, count(*)::integer AS reserved_count FROM ticket_checkout_options tco JOIN ticket_checkout_sessions tcs ON tco.checkout_session_id = tcs.id WHERE tcs.status = 'pending'::ticket_checkout_status AND tcs.expires_at > now() GROUP BY tco.ticket_option_id) tco_counts ON topt.id = tco_counts.ticket_option_id`,
);
