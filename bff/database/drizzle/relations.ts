import { relations } from "drizzle-orm/relations";
import { ssoProvidersInAuth, ssoDomainsInAuth, sessionsInAuth, mfaAmrClaimsInAuth, usersInAuth, users, flowStateInAuth, samlRelayStatesInAuth, refreshTokensInAuth, samlProvidersInAuth, identitiesInAuth, oneTimeTokensInAuth, mfaFactorsInAuth, mfaChallengesInAuth, ticketTypes, ticketOptions, ticketPurchaseOptions, ticketPurchases, individuals, companyDraftApprovals, companyDrafts, companies, companyInvitation, ticketCheckoutSessions, ticketCheckoutOptions, individualDraftApprovals, individualDrafts, sponsorIndividuals, sponsorLunch, sponsorNameplate, sponsorNamingRights, sponsorScholarship, userRoles, companyMembers } from "./schema";

export const ssoDomainsInAuthRelations = relations(ssoDomainsInAuth, ({one}) => ({
	ssoProvidersInAuth: one(ssoProvidersInAuth, {
		fields: [ssoDomainsInAuth.ssoProviderId],
		references: [ssoProvidersInAuth.id]
	}),
}));

export const ssoProvidersInAuthRelations = relations(ssoProvidersInAuth, ({many}) => ({
	ssoDomainsInAuths: many(ssoDomainsInAuth),
	samlRelayStatesInAuths: many(samlRelayStatesInAuth),
	samlProvidersInAuths: many(samlProvidersInAuth),
}));

export const mfaAmrClaimsInAuthRelations = relations(mfaAmrClaimsInAuth, ({one}) => ({
	sessionsInAuth: one(sessionsInAuth, {
		fields: [mfaAmrClaimsInAuth.sessionId],
		references: [sessionsInAuth.id]
	}),
}));

export const sessionsInAuthRelations = relations(sessionsInAuth, ({one, many}) => ({
	mfaAmrClaimsInAuths: many(mfaAmrClaimsInAuth),
	refreshTokensInAuths: many(refreshTokensInAuth),
	usersInAuth: one(usersInAuth, {
		fields: [sessionsInAuth.userId],
		references: [usersInAuth.id]
	}),
}));

export const usersRelations = relations(users, ({one, many}) => ({
	usersInAuth: one(usersInAuth, {
		fields: [users.id],
		references: [usersInAuth.id]
	}),
	individuals: many(individuals),
	ticketPurchases: many(ticketPurchases),
	companyDraftApprovals: many(companyDraftApprovals),
	ticketCheckoutSessions: many(ticketCheckoutSessions),
	individualDraftApprovals: many(individualDraftApprovals),
	userRoles: many(userRoles),
	companyMembers: many(companyMembers),
}));

export const usersInAuthRelations = relations(usersInAuth, ({many}) => ({
	users: many(users),
	sessionsInAuths: many(sessionsInAuth),
	identitiesInAuths: many(identitiesInAuth),
	oneTimeTokensInAuths: many(oneTimeTokensInAuth),
	mfaFactorsInAuths: many(mfaFactorsInAuth),
}));

export const samlRelayStatesInAuthRelations = relations(samlRelayStatesInAuth, ({one}) => ({
	flowStateInAuth: one(flowStateInAuth, {
		fields: [samlRelayStatesInAuth.flowStateId],
		references: [flowStateInAuth.id]
	}),
	ssoProvidersInAuth: one(ssoProvidersInAuth, {
		fields: [samlRelayStatesInAuth.ssoProviderId],
		references: [ssoProvidersInAuth.id]
	}),
}));

export const flowStateInAuthRelations = relations(flowStateInAuth, ({many}) => ({
	samlRelayStatesInAuths: many(samlRelayStatesInAuth),
}));

export const refreshTokensInAuthRelations = relations(refreshTokensInAuth, ({one}) => ({
	sessionsInAuth: one(sessionsInAuth, {
		fields: [refreshTokensInAuth.sessionId],
		references: [sessionsInAuth.id]
	}),
}));

export const samlProvidersInAuthRelations = relations(samlProvidersInAuth, ({one}) => ({
	ssoProvidersInAuth: one(ssoProvidersInAuth, {
		fields: [samlProvidersInAuth.ssoProviderId],
		references: [ssoProvidersInAuth.id]
	}),
}));

export const identitiesInAuthRelations = relations(identitiesInAuth, ({one}) => ({
	usersInAuth: one(usersInAuth, {
		fields: [identitiesInAuth.userId],
		references: [usersInAuth.id]
	}),
}));

export const oneTimeTokensInAuthRelations = relations(oneTimeTokensInAuth, ({one}) => ({
	usersInAuth: one(usersInAuth, {
		fields: [oneTimeTokensInAuth.userId],
		references: [usersInAuth.id]
	}),
}));

export const mfaFactorsInAuthRelations = relations(mfaFactorsInAuth, ({one, many}) => ({
	usersInAuth: one(usersInAuth, {
		fields: [mfaFactorsInAuth.userId],
		references: [usersInAuth.id]
	}),
	mfaChallengesInAuths: many(mfaChallengesInAuth),
}));

export const mfaChallengesInAuthRelations = relations(mfaChallengesInAuth, ({one}) => ({
	mfaFactorsInAuth: one(mfaFactorsInAuth, {
		fields: [mfaChallengesInAuth.factorId],
		references: [mfaFactorsInAuth.id]
	}),
}));

export const ticketOptionsRelations = relations(ticketOptions, ({one, many}) => ({
	ticketType: one(ticketTypes, {
		fields: [ticketOptions.ticketTypeId],
		references: [ticketTypes.id]
	}),
	ticketPurchaseOptions: many(ticketPurchaseOptions),
	ticketCheckoutOptions: many(ticketCheckoutOptions),
}));

export const ticketTypesRelations = relations(ticketTypes, ({many}) => ({
	ticketOptions: many(ticketOptions),
	ticketPurchases: many(ticketPurchases),
	ticketCheckoutSessions: many(ticketCheckoutSessions),
}));

export const ticketPurchaseOptionsRelations = relations(ticketPurchaseOptions, ({one}) => ({
	ticketOption: one(ticketOptions, {
		fields: [ticketPurchaseOptions.ticketOptionId],
		references: [ticketOptions.id]
	}),
	ticketPurchase: one(ticketPurchases, {
		fields: [ticketPurchaseOptions.ticketPurchaseId],
		references: [ticketPurchases.id]
	}),
}));

export const ticketPurchasesRelations = relations(ticketPurchases, ({one, many}) => ({
	ticketPurchaseOptions: many(ticketPurchaseOptions),
	ticketType: one(ticketTypes, {
		fields: [ticketPurchases.ticketTypeId],
		references: [ticketTypes.id]
	}),
	user: one(users, {
		fields: [ticketPurchases.userId],
		references: [users.id]
	}),
}));

export const individualsRelations = relations(individuals, ({one, many}) => ({
	user: one(users, {
		fields: [individuals.userId],
		references: [users.id]
	}),
	individualDrafts: many(individualDrafts),
	sponsorIndividuals: many(sponsorIndividuals),
}));

export const companyDraftApprovalsRelations = relations(companyDraftApprovals, ({one}) => ({
	user: one(users, {
		fields: [companyDraftApprovals.approvedBy],
		references: [users.id]
	}),
	companyDraft: one(companyDrafts, {
		fields: [companyDraftApprovals.companyDraftId],
		references: [companyDrafts.id]
	}),
}));

export const companyDraftsRelations = relations(companyDrafts, ({one, many}) => ({
	companyDraftApprovals: many(companyDraftApprovals),
	company: one(companies, {
		fields: [companyDrafts.companyId],
		references: [companies.id]
	}),
}));

export const companyInvitationRelations = relations(companyInvitation, ({one}) => ({
	company: one(companies, {
		fields: [companyInvitation.companyId],
		references: [companies.id]
	}),
}));

export const companiesRelations = relations(companies, ({many}) => ({
	companyInvitations: many(companyInvitation),
	companyDrafts: many(companyDrafts),
	sponsorLunches: many(sponsorLunch),
	sponsorNameplates: many(sponsorNameplate),
	sponsorNamingRights: many(sponsorNamingRights),
	sponsorScholarships: many(sponsorScholarship),
	companyMembers: many(companyMembers),
}));

export const ticketCheckoutSessionsRelations = relations(ticketCheckoutSessions, ({one, many}) => ({
	ticketType: one(ticketTypes, {
		fields: [ticketCheckoutSessions.ticketTypeId],
		references: [ticketTypes.id]
	}),
	user: one(users, {
		fields: [ticketCheckoutSessions.userId],
		references: [users.id]
	}),
	ticketCheckoutOptions: many(ticketCheckoutOptions),
}));

export const ticketCheckoutOptionsRelations = relations(ticketCheckoutOptions, ({one}) => ({
	ticketCheckoutSession: one(ticketCheckoutSessions, {
		fields: [ticketCheckoutOptions.checkoutSessionId],
		references: [ticketCheckoutSessions.id]
	}),
	ticketOption: one(ticketOptions, {
		fields: [ticketCheckoutOptions.ticketOptionId],
		references: [ticketOptions.id]
	}),
}));

export const individualDraftApprovalsRelations = relations(individualDraftApprovals, ({one}) => ({
	user: one(users, {
		fields: [individualDraftApprovals.approvedBy],
		references: [users.id]
	}),
	individualDraft: one(individualDrafts, {
		fields: [individualDraftApprovals.individualDraftId],
		references: [individualDrafts.id]
	}),
}));

export const individualDraftsRelations = relations(individualDrafts, ({one, many}) => ({
	individualDraftApprovals: many(individualDraftApprovals),
	individual: one(individuals, {
		fields: [individualDrafts.individualId],
		references: [individuals.id]
	}),
}));

export const sponsorIndividualsRelations = relations(sponsorIndividuals, ({one}) => ({
	individual: one(individuals, {
		fields: [sponsorIndividuals.individualId],
		references: [individuals.id]
	}),
}));

export const sponsorLunchRelations = relations(sponsorLunch, ({one}) => ({
	company: one(companies, {
		fields: [sponsorLunch.companyId],
		references: [companies.id]
	}),
}));

export const sponsorNameplateRelations = relations(sponsorNameplate, ({one}) => ({
	company: one(companies, {
		fields: [sponsorNameplate.companyId],
		references: [companies.id]
	}),
}));

export const sponsorNamingRightsRelations = relations(sponsorNamingRights, ({one}) => ({
	company: one(companies, {
		fields: [sponsorNamingRights.companyId],
		references: [companies.id]
	}),
}));

export const sponsorScholarshipRelations = relations(sponsorScholarship, ({one}) => ({
	company: one(companies, {
		fields: [sponsorScholarship.companyId],
		references: [companies.id]
	}),
}));

export const userRolesRelations = relations(userRoles, ({one}) => ({
	user: one(users, {
		fields: [userRoles.userId],
		references: [users.id]
	}),
}));

export const companyMembersRelations = relations(companyMembers, ({one}) => ({
	company: one(companies, {
		fields: [companyMembers.companyId],
		references: [companies.id]
	}),
	user: one(users, {
		fields: [companyMembers.userId],
		references: [users.id]
	}),
}));