// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'sponsor_api_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$SponsorApiServiceRouter(SponsorApiService service) {
  final router = Router();
  router.add('GET', r'/sponsors', service._getSponsors);
  router.add('GET', r'/sponsors/companies', service._getCompanySponsors);
  router.add('GET', r'/sponsors/individuals', service._getIndividualSponsors);
  return router;
}
