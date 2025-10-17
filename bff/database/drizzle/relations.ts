import { relations } from "drizzle-orm/relations";
import {
  basicSponsorCompanies,
  companies,
  companyDraftApprovals,
  companyDrafts,
  companyInvitation,
  companyMembers,
  deviceApnsLiveActivityTokens,
  deviceApnsTokens,
  deviceFcmTokens,
  devices,
  flowStateInAuth,
  identitiesInAuth,
  individualDraftApprovals,
  individualDrafts,
  individuals,
  jobBoards,
  mfaAmrClaimsInAuth,
  mfaChallengesInAuth,
  mfaFactorsInAuth,
  oauthAuthorizationsInAuth,
  oauthClientsInAuth,
  oauthConsentsInAuth,
  oneTimeTokensInAuth,
  profileShare,
  profiles,
  refreshTokensInAuth,
  samlProvidersInAuth,
  samlRelayStatesInAuth,
  sessionSpeakers,
  sessions,
  sessionsInAuth,
  sessionVenues,
  speakers,
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

export const ssoDomainsInAuthRelations = relations(
  ssoDomainsInAuth,
  ({ one }) => ({
    ssoProvidersInAuth: one(ssoProvidersInAuth, {
      fields: [ssoDomainsInAuth.ssoProviderId],
      references: [ssoProvidersInAuth.id],
    }),
  })
);

export const ssoProvidersInAuthRelations = relations(
  ssoProvidersInAuth,
  ({ many }) => ({
    ssoDomainsInAuths: many(ssoDomainsInAuth),
    samlRelayStatesInAuths: many(samlRelayStatesInAuth),
    samlProvidersInAuths: many(samlProvidersInAuth),
  })
);

export const mfaAmrClaimsInAuthRelations = relations(
  mfaAmrClaimsInAuth,
  ({ one }) => ({
    sessionsInAuth: one(sessionsInAuth, {
      fields: [mfaAmrClaimsInAuth.sessionId],
      references: [sessionsInAuth.id],
    }),
  })
);

export const sessionsInAuthRelations = relations(
  sessionsInAuth,
  ({ one, many }) => ({
    mfaAmrClaimsInAuths: many(mfaAmrClaimsInAuth),
    refreshTokensInAuths: many(refreshTokensInAuth),
    oauthClientsInAuth: one(oauthClientsInAuth, {
      fields: [sessionsInAuth.oauthClientId],
      references: [oauthClientsInAuth.id],
    }),
    usersInAuth: one(usersInAuth, {
      fields: [sessionsInAuth.userId],
      references: [usersInAuth.id],
    }),
  })
);

export const usersRelations = relations(users, ({ one, many }) => ({
  usersInAuth: one(usersInAuth, {
    fields: [users.id],
    references: [usersInAuth.id],
  }),
  ticketPurchases: many(ticketPurchases),
  individuals: many(individuals),
  companyDraftApprovals: many(companyDraftApprovals),
  ticketCheckoutSessions: many(ticketCheckoutSessions),
  individualDraftApprovals: many(individualDraftApprovals),
  userRoles: many(userRoles),
  companyMembers: many(companyMembers),
}));

export const usersInAuthRelations = relations(usersInAuth, ({ many }) => ({
  users: many(users),
  identitiesInAuths: many(identitiesInAuth),
  oneTimeTokensInAuths: many(oneTimeTokensInAuth),
  mfaFactorsInAuths: many(mfaFactorsInAuth),
  sessionsInAuths: many(sessionsInAuth),
  profiles: many(profiles),
  devices: many(devices),
  userSnsLinks: many(userSnsLinks),
  oauthAuthorizationsInAuths: many(oauthAuthorizationsInAuth),
  oauthConsentsInAuths: many(oauthConsentsInAuth),
}));

export const samlRelayStatesInAuthRelations = relations(
  samlRelayStatesInAuth,
  ({ one }) => ({
    flowStateInAuth: one(flowStateInAuth, {
      fields: [samlRelayStatesInAuth.flowStateId],
      references: [flowStateInAuth.id],
    }),
    ssoProvidersInAuth: one(ssoProvidersInAuth, {
      fields: [samlRelayStatesInAuth.ssoProviderId],
      references: [ssoProvidersInAuth.id],
    }),
  })
);

export const flowStateInAuthRelations = relations(
  flowStateInAuth,
  ({ many }) => ({
    samlRelayStatesInAuths: many(samlRelayStatesInAuth),
  })
);

export const refreshTokensInAuthRelations = relations(
  refreshTokensInAuth,
  ({ one }) => ({
    sessionsInAuth: one(sessionsInAuth, {
      fields: [refreshTokensInAuth.sessionId],
      references: [sessionsInAuth.id],
    }),
  })
);

export const samlProvidersInAuthRelations = relations(
  samlProvidersInAuth,
  ({ one }) => ({
    ssoProvidersInAuth: one(ssoProvidersInAuth, {
      fields: [samlProvidersInAuth.ssoProviderId],
      references: [ssoProvidersInAuth.id],
    }),
  })
);

export const identitiesInAuthRelations = relations(
  identitiesInAuth,
  ({ one }) => ({
    usersInAuth: one(usersInAuth, {
      fields: [identitiesInAuth.userId],
      references: [usersInAuth.id],
    }),
  })
);

export const oneTimeTokensInAuthRelations = relations(
  oneTimeTokensInAuth,
  ({ one }) => ({
    usersInAuth: one(usersInAuth, {
      fields: [oneTimeTokensInAuth.userId],
      references: [usersInAuth.id],
    }),
  })
);

export const mfaFactorsInAuthRelations = relations(
  mfaFactorsInAuth,
  ({ one, many }) => ({
    usersInAuth: one(usersInAuth, {
      fields: [mfaFactorsInAuth.userId],
      references: [usersInAuth.id],
    }),
    mfaChallengesInAuths: many(mfaChallengesInAuth),
  })
);

export const mfaChallengesInAuthRelations = relations(
  mfaChallengesInAuth,
  ({ one }) => ({
    mfaFactorsInAuth: one(mfaFactorsInAuth, {
      fields: [mfaChallengesInAuth.factorId],
      references: [mfaFactorsInAuth.id],
    }),
  })
);

export const oauthClientsInAuthRelations = relations(
  oauthClientsInAuth,
  ({ many }) => ({
    sessionsInAuths: many(sessionsInAuth),
    oauthAuthorizationsInAuths: many(oauthAuthorizationsInAuth),
    oauthConsentsInAuths: many(oauthConsentsInAuth),
  })
);

export const ticketOptionsRelations = relations(
  ticketOptions,
  ({ one, many }) => ({
    ticketType: one(ticketTypes, {
      fields: [ticketOptions.ticketTypeId],
      references: [ticketTypes.id],
    }),
    ticketPurchaseOptions: many(ticketPurchaseOptions),
    ticketCheckoutOptions: many(ticketCheckoutOptions),
  })
);

export const ticketTypesRelations = relations(ticketTypes, ({ many }) => ({
  ticketOptions: many(ticketOptions),
  ticketPurchases: many(ticketPurchases),
  ticketCheckoutSessions: many(ticketCheckoutSessions),
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
  })
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
  })
);

export const individualsRelations = relations(individuals, ({ one, many }) => ({
  user: one(users, {
    fields: [individuals.userId],
    references: [users.id],
  }),
  individualDrafts: many(individualDrafts),
  sponsorIndividuals: many(sponsorIndividuals),
}));

export const jobBoardsRelations = relations(jobBoards, ({ one }) => ({
  company: one(companies, {
    fields: [jobBoards.id],
    references: [companies.id],
  }),
}));

export const companiesRelations = relations(companies, ({ many }) => ({
  jobBoards: many(jobBoards),
  companyInvitations: many(companyInvitation),
  sponsorCompanies: many(sponsorCompanies),
  companyDrafts: many(companyDrafts),
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
  })
);

export const companyDraftsRelations = relations(
  companyDrafts,
  ({ one, many }) => ({
    companyDraftApprovals: many(companyDraftApprovals),
    company: one(companies, {
      fields: [companyDrafts.companyId],
      references: [companies.id],
    }),
  })
);

export const basicSponsorCompaniesRelations = relations(
  basicSponsorCompanies,
  ({ one }) => ({
    sponsorCompany: one(sponsorCompanies, {
      fields: [basicSponsorCompanies.sponsorCompanyId],
      references: [sponsorCompanies.id],
    }),
  })
);

export const sponsorCompaniesRelations = relations(
  sponsorCompanies,
  ({ one, many }) => ({
    basicSponsorCompanies: many(basicSponsorCompanies),
    company: one(companies, {
      fields: [sponsorCompanies.companyId],
      references: [companies.id],
    }),
    sponsorCompanyOptions: many(sponsorCompanyOptions),
    sessions: many(sessions),
  })
);

export const deviceApnsTokensRelations = relations(
  deviceApnsTokens,
  ({ one }) => ({
    device: one(devices, {
      fields: [deviceApnsTokens.deviceId],
      references: [devices.id],
    }),
  })
);

export const devicesRelations = relations(devices, ({ one, many }) => ({
  deviceApnsTokens: many(deviceApnsTokens),
  deviceFcmTokens: many(deviceFcmTokens),
  usersInAuth: one(usersInAuth, {
    fields: [devices.userId],
    references: [usersInAuth.id],
  }),
  deviceApnsLiveActivityTokens: many(deviceApnsLiveActivityTokens),
}));

export const companyInvitationRelations = relations(
  companyInvitation,
  ({ one }) => ({
    company: one(companies, {
      fields: [companyInvitation.companyId],
      references: [companies.id],
    }),
  })
);

export const ticketCheckoutSessionsRelations = relations(
  ticketCheckoutSessions,
  ({ one, many }) => ({
    ticketType: one(ticketTypes, {
      fields: [ticketCheckoutSessions.ticketTypeId],
      references: [ticketTypes.id],
    }),
    user: one(users, {
      fields: [ticketCheckoutSessions.userId],
      references: [users.id],
    }),
    ticketCheckoutOptions: many(ticketCheckoutOptions),
  })
);

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
  })
);

export const sponsorCompanyOptionsRelations = relations(
  sponsorCompanyOptions,
  ({ one }) => ({
    sponsorCompany: one(sponsorCompanies, {
      fields: [sponsorCompanyOptions.sponsorCompanyId],
      references: [sponsorCompanies.id],
    }),
  })
);

export const deviceFcmTokensRelations = relations(
  deviceFcmTokens,
  ({ one }) => ({
    device: one(devices, {
      fields: [deviceFcmTokens.deviceId],
      references: [devices.id],
    }),
  })
);

export const profilesRelations = relations(profiles, ({ one, many }) => ({
  usersInAuth: one(usersInAuth, {
    fields: [profiles.id],
    references: [usersInAuth.id],
  }),
  profileShares_fromId: many(profileShare, {
    relationName: "profileShare_fromId_profiles_id",
  }),
  profileShares_toId: many(profileShare, {
    relationName: "profileShare_toId_profiles_id",
  }),
}));

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
  })
);

export const individualDraftsRelations = relations(
  individualDrafts,
  ({ one, many }) => ({
    individualDraftApprovals: many(individualDraftApprovals),
    individual: one(individuals, {
      fields: [individualDrafts.individualId],
      references: [individuals.id],
    }),
  })
);

export const sessionsRelations = relations(sessions, ({ one, many }) => ({
  sponsorCompany: one(sponsorCompanies, {
    fields: [sessions.sponsorId],
    references: [sponsorCompanies.id],
  }),
  sessionVenue: one(sessionVenues, {
    fields: [sessions.venueId],
    references: [sessionVenues.id],
  }),
  sessionSpeakers: many(sessionSpeakers),
}));

export const sessionVenuesRelations = relations(sessionVenues, ({ many }) => ({
  sessions: many(sessions),
}));

export const userSnsLinksRelations = relations(userSnsLinks, ({ one }) => ({
  usersInAuth: one(usersInAuth, {
    fields: [userSnsLinks.userId],
    references: [usersInAuth.id],
  }),
}));

export const sponsorIndividualsRelations = relations(
  sponsorIndividuals,
  ({ one }) => ({
    individual: one(individuals, {
      fields: [sponsorIndividuals.individualId],
      references: [individuals.id],
    }),
  })
);

export const oauthAuthorizationsInAuthRelations = relations(
  oauthAuthorizationsInAuth,
  ({ one }) => ({
    oauthClientsInAuth: one(oauthClientsInAuth, {
      fields: [oauthAuthorizationsInAuth.clientId],
      references: [oauthClientsInAuth.id],
    }),
    usersInAuth: one(usersInAuth, {
      fields: [oauthAuthorizationsInAuth.userId],
      references: [usersInAuth.id],
    }),
  })
);

export const oauthConsentsInAuthRelations = relations(
  oauthConsentsInAuth,
  ({ one }) => ({
    oauthClientsInAuth: one(oauthClientsInAuth, {
      fields: [oauthConsentsInAuth.clientId],
      references: [oauthClientsInAuth.id],
    }),
    usersInAuth: one(usersInAuth, {
      fields: [oauthConsentsInAuth.userId],
      references: [usersInAuth.id],
    }),
  })
);

export const profileShareRelations = relations(profileShare, ({ one }) => ({
  profile_fromId: one(profiles, {
    fields: [profileShare.fromId],
    references: [profiles.id],
    relationName: "profileShare_fromId_profiles_id",
  }),
  profile_toId: one(profiles, {
    fields: [profileShare.toId],
    references: [profiles.id],
    relationName: "profileShare_toId_profiles_id",
  }),
}));

export const sessionSpeakersRelations = relations(
  sessionSpeakers,
  ({ one }) => ({
    session: one(sessions, {
      fields: [sessionSpeakers.sessionId],
      references: [sessions.id],
    }),
    speaker: one(speakers, {
      fields: [sessionSpeakers.speakerId],
      references: [speakers.id],
    }),
  })
);

export const speakersRelations = relations(speakers, ({ many }) => ({
  sessionSpeakers: many(sessionSpeakers),
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

export const deviceApnsLiveActivityTokensRelations = relations(
  deviceApnsLiveActivityTokens,
  ({ one }) => ({
    device: one(devices, {
      fields: [deviceApnsLiveActivityTokens.deviceId],
      references: [devices.id],
    }),
  })
);
