// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'user_api_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$UserApiServiceRouter(UserApiService service) {
  final router = Router();
  router.add('GET', r'/me', service._getUserMe);
  router.add('GET', r'/list', service._getUserList);
  router.add('GET', r'/<userId>', service._getUser);
  router.add('PUT', r'/<userId>/roles', service._putUserRoles);
  router.add('DELETE', r'/<userId>', service._deleteUser);
  router.add('POST', r'/<userId>/restore', service._restoreUser);
  router.add('GET', r'/deleted', service._getDeletedUsers);
  router.add('GET', r'/stats', service._getUserStats);
  return router;
}
