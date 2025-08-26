// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'profile_api_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$ProfileApiServiceRouter(ProfileApiService service) {
  final router = Router();
  router.add('GET', r'/me', service._getMyProfile);
  router.add('PUT', r'/me', service._updateMyProfile);
  router.add('DELETE', r'/me/avatar', service._deleteMyAvatar);
  return router;
}
