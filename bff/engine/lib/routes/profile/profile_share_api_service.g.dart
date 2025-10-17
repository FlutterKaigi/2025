// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'profile_share_api_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$ProfileShareApiServiceRouter(ProfileShareApiService service) {
  final router = Router();
  router.add('GET', r'/me', service._getProfileShareList);
  router.add('GET', r'/count', service._getTotalSharedProfilesCount);
  router.add('PUT', r'/me/{profileId}', service._putProfileShare);
  router.add('DELETE', r'/me/{profileId}', service._deleteProfileShare);
  return router;
}
