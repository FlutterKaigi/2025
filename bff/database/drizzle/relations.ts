import { relations } from "drizzle-orm/relations";
import {
	basicSponsorCompanies,
	companies,
	companyDraftApprovals,
	companyDrafts,
	companyInvitation,
	companyMembers,
	flowStateInAuth,
	identitiesInAuth,
	individualDraftApprovals,
	individualDrafts,
	individuals,
	jobBoards,
	mfaAmrClaimsInAuth,
	mfaChallengesInAuth,
	mfaFactorsInAuth,
	oneTimeTokensInAuth,
	profiles,
	refreshTokensInAuth,
	samlProvidersInAuth,
	samlRelayStatesInAuth,
	sessionsInAuth,
	sponsorCompanies,
	sponsorCompanyOptions,
	sponsorIndividuals,
	ssoDomainsInAuth,
	ssoProvidersInAuth,
	ticketCheckoutOptions,
	ticketCheckoutSessions,
	ticketOptions,
	ticketPurchaseOptions,
	ticketPurchases,
	ticketTypes,
	userRoles,
	userSnsLinks,
	users,
	usersInAuth,
} from "./schema";

export const samlRelayStatesInAuthRelations = relations(
	samlRelayStatesInAuth,
	({ one }) => ({
		ssoProvidersInAuth: one(ssoProvidersInAuth, {
			fields: [samlRelayStatesInAuth.ssoProviderId],
			references: [ssoProvidersInAuth.id],
		}),
		flowStateInAuth: one(flowStateInAuth, {
			fields: [samlRelayStatesInAuth.flowStateId],
			references: [flowStateInAuth.id],
		}),
	}),
);

export const ssoProvidersInAuthRelations = relations(
	ssoProvidersInAuth,
	({ many }) => ({
		samlRelayStatesInAuths: many(samlRelayStatesInAuth),
		ssoDomainsInAuths: many(ssoDomainsInAuth),
		samlProvidersInAuths: many(samlProvidersInAuth),
	}),
);

export const flowStateInAuthRelations = relations(
	flowStateInAuth,
	({ many }) => ({
		samlRelayStatesInAuths: many(samlRelayStatesInAuth),
	}),
);

export const refreshTokensInAuthRelations = relations(
	refreshTokensInAuth,
	({ one }) => ({
		sessionsInAuth: one(sessionsInAuth, {
			fields: [refreshTokensInAuth.sessionId],
			references: [sessionsInAuth.id],
		}),
	}),
);

export const sessionsInAuthRelations = relations(
	sessionsInAuth,
	({ one, many }) => ({
		refreshTokensInAuths: many(refreshTokensInAuth),
		usersInAuth: one(usersInAuth, {
			fields: [sessionsInAuth.userId],
			references: [usersInAuth.id],
		}),
		mfaAmrClaimsInAuths: many(mfaAmrClaimsInAuth),
	}),
);

export const usersInAuthRelations = relations(usersInAuth, ({ many }) => ({
	sessionsInAuths: many(sessionsInAuth),
	identitiesInAuths: many(identitiesInAuth),
	oneTimeTokensInAuths: many(oneTimeTokensInAuth),
	mfaFactorsInAuths: many(mfaFactorsInAuth),
	users: many(users),
	profiles: many(profiles),
	userSnsLinks: many(userSnsLinks),
}));

export const ssoDomainsInAuthRelations = relations(
	ssoDomainsInAuth,
	({ one }) => ({
		ssoProvidersInAuth: one(ssoProvidersInAuth, {
			fields: [ssoDomainsInAuth.ssoProviderId],
			references: [ssoProvidersInAuth.id],
		}),
	}),
);

export const mfaAmrClaimsInAuthRelations = relations(
	mfaAmrClaimsInAuth,
	({ one }) => ({
		sessionsInAuth: one(sessionsInAuth, {
			fields: [mfaAmrClaimsInAuth.sessionId],
			references: [sessionsInAuth.id],
		}),
	}),
);

export const samlProvidersInAuthRelations = relations(
	samlProvidersInAuth,
	({ one }) => ({
		ssoProvidersInAuth: one(ssoProvidersInAuth, {
			fields: [samlProvidersInAuth.ssoProviderId],
			references: [ssoProvidersInAuth.id],
		}),
	}),
);

export const identitiesInAuthRelations = relations(
	identitiesInAuth,
	({ one }) => ({
		usersInAuth: one(usersInAuth, {
			fields: [identitiesInAuth.userId],
			references: [usersInAuth.id],
		}),
	}),
);

export const oneTimeTokensInAuthRelations = relations(
	oneTimeTokensInAuth,
	({ one }) => ({
		usersInAuth: one(usersInAuth, {
			fields: [oneTimeTokensInAuth.userId],
			references: [usersInAuth.id],
		}),
	}),
);

export const mfaFactorsInAuthRelations = relations(
	mfaFactorsInAuth,
	({ one, many }) => ({
		usersInAuth: one(usersInAuth, {
			fields: [mfaFactorsInAuth.userId],
			references: [usersInAuth.id],
		}),
		mfaChallengesInAuths: many(mfaChallengesInAuth),
	}),
);

export const mfaChallengesInAuthRelations = relations(
	mfaChallengesInAuth,
	({ one }) => ({
		mfaFactorsInAuth: one(mfaFactorsInAuth, {
			fields: [mfaChallengesInAuth.factorId],
			references: [mfaFactorsInAuth.id],
		}),
	}),
);

export const individualsRelations = relations(individuals, ({ one, many }) => ({
	user: one(users, {
		fields: [individuals.userId],
		references: [users.id],
	}),
	sponsorIndividuals: many(sponsorIndividuals),
	individualDrafts: many(individualDrafts),
}));

export const usersRelations = relations(users, ({ one, many }) => ({
	individuals: many(individuals),
	companyDraftApprovals: many(companyDraftApprovals),
	individualDraftApprovals: many(individualDraftApprovals),
	usersInAuth: one(usersInAuth, {
		fields: [users.id],
		references: [usersInAuth.id],
	}),
	ticketPurchases: many(ticketPurchases),
	ticketCheckoutSessions: many(ticketCheckoutSessions),
	userRoles: many(userRoles),
	companyMembers: many(companyMembers),
}));

export const companyDraftApprovalsRelations = relations(
	companyDraftApprovals,
	({ one }) => ({
		user: one(users, {
			fields: [companyDraftApprovals.approvedBy],
			references: [users.id],
		}),
		companyDraft: one(companyDrafts, {
			fields: [companyDraftApprovals.companyDraftId],
			references: [companyDrafts.id],
		}),
	}),
);

export const companyDraftsRelations = relations(
	companyDrafts,
	({ one, many }) => ({
		companyDraftApprovals: many(companyDraftApprovals),
		company: one(companies, {
			fields: [companyDrafts.companyId],
			references: [companies.id],
		}),
	}),
);

export const individualDraftApprovalsRelations = relations(
	individualDraftApprovals,
	({ one }) => ({
		user: one(users, {
			fields: [individualDraftApprovals.approvedBy],
			references: [users.id],
		}),
		individualDraft: one(individualDrafts, {
			fields: [individualDraftApprovals.individualDraftId],
			references: [individualDrafts.id],
		}),
	}),
);

export const individualDraftsRelations = relations(
	individualDrafts,
	({ one, many }) => ({
		individualDraftApprovals: many(individualDraftApprovals),
		individual: one(individuals, {
			fields: [individualDrafts.individualId],
			references: [individuals.id],
		}),
	}),
);

export const sponsorIndividualsRelations = relations(
	sponsorIndividuals,
	({ one }) => ({
		individual: one(individuals, {
			fields: [sponsorIndividuals.individualId],
			references: [individuals.id],
		}),
	}),
);

export const companyInvitationRelations = relations(
	companyInvitation,
	({ one }) => ({
		company: one(companies, {
			fields: [companyInvitation.companyId],
			references: [companies.id],
		}),
	}),
);

export const companiesRelations = relations(companies, ({ many }) => ({
	companyInvitations: many(companyInvitation),
	jobBoards: many(jobBoards),
	companyDrafts: many(companyDrafts),
	sponsorCompanies: many(sponsorCompanies),
	companyMembers: many(companyMembers),
}));

export const ticketPurchaseOptionsRelations = relations(
	ticketPurchaseOptions,
	({ one }) => ({
		ticketOption: one(ticketOptions, {
			fields: [ticketPurchaseOptions.ticketOptionId],
			references: [ticketOptions.id],
		}),
		ticketPurchase: one(ticketPurchases, {
			fields: [ticketPurchaseOptions.ticketPurchaseId],
			references: [ticketPurchases.id],
		}),
	}),
);

export const ticketOptionsRelations = relations(
	ticketOptions,
	({ one, many }) => ({
		ticketPurchaseOptions: many(ticketPurchaseOptions),
		ticketCheckoutOptions: many(ticketCheckoutOptions),
		ticketType: one(ticketTypes, {
			fields: [ticketOptions.ticketTypeId],
			references: [ticketTypes.id],
		}),
	}),
);

export const ticketPurchasesRelations = relations(
	ticketPurchases,
	({ one, many }) => ({
		ticketPurchaseOptions: many(ticketPurchaseOptions),
		ticketType: one(ticketTypes, {
			fields: [ticketPurchases.ticketTypeId],
			references: [ticketTypes.id],
		}),
		user: one(users, {
			fields: [ticketPurchases.userId],
			references: [users.id],
		}),
	}),
);

export const ticketTypesRelations = relations(ticketTypes, ({ many }) => ({
	ticketPurchases: many(ticketPurchases),
	ticketCheckoutSessions: many(ticketCheckoutSessions),
	ticketOptions: many(ticketOptions),
}));

export const ticketCheckoutOptionsRelations = relations(
	ticketCheckoutOptions,
	({ one }) => ({
		ticketCheckoutSession: one(ticketCheckoutSessions, {
			fields: [ticketCheckoutOptions.checkoutSessionId],
			references: [ticketCheckoutSessions.id],
		}),
		ticketOption: one(ticketOptions, {
			fields: [ticketCheckoutOptions.ticketOptionId],
			references: [ticketOptions.id],
		}),
	}),
);

export const ticketCheckoutSessionsRelations = relations(
	ticketCheckoutSessions,
	({ one, many }) => ({
		ticketCheckoutOptions: many(ticketCheckoutOptions),
		ticketType: one(ticketTypes, {
			fields: [ticketCheckoutSessions.ticketTypeId],
			references: [ticketTypes.id],
		}),
		user: one(users, {
			fields: [ticketCheckoutSessions.userId],
			references: [users.id],
		}),
	}),
);

export const basicSponsorCompaniesRelations = relations(
	basicSponsorCompanies,
	({ one }) => ({
		sponsorCompany: one(sponsorCompanies, {
			fields: [basicSponsorCompanies.sponsorCompanyId],
			references: [sponsorCompanies.id],
		}),
	}),
);

export const sponsorCompaniesRelations = relations(
	sponsorCompanies,
	({ one, many }) => ({
		basicSponsorCompanies: many(basicSponsorCompanies),
		sponsorCompanyOptions: many(sponsorCompanyOptions),
		company: one(companies, {
			fields: [sponsorCompanies.companyId],
			references: [companies.id],
		}),
	}),
);

export const sponsorCompanyOptionsRelations = relations(
	sponsorCompanyOptions,
	({ one }) => ({
		sponsorCompany: one(sponsorCompanies, {
			fields: [sponsorCompanyOptions.sponsorCompanyId],
			references: [sponsorCompanies.id],
		}),
	}),
);

export const jobBoardsRelations = relations(jobBoards, ({ one }) => ({
	company: one(companies, {
		fields: [jobBoards.id],
		references: [companies.id],
	}),
}));

export const profilesRelations = relations(profiles, ({ one }) => ({
	usersInAuth: one(usersInAuth, {
		fields: [profiles.id],
		references: [usersInAuth.id],
	}),
}));

export const userSnsLinksRelations = relations(userSnsLinks, ({ one }) => ({
	usersInAuth: one(usersInAuth, {
		fields: [userSnsLinks.userId],
		references: [usersInAuth.id],
	}),
}));

export const userRolesRelations = relations(userRoles, ({ one }) => ({
	user: one(users, {
		fields: [userRoles.userId],
		references: [users.id],
	}),
}));

export const companyMembersRelations = relations(companyMembers, ({ one }) => ({
	company: one(companies, {
		fields: [companyMembers.companyId],
		references: [companies.id],
	}),
	user: one(users, {
		fields: [companyMembers.userId],
		references: [users.id],
	}),
}));
