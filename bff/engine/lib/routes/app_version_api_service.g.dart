// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'app_version_api_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$AppVersionApiServiceRouter(AppVersionApiService service) {
  final router = Router();
  router.add('GET', r'/version', service.checkVersion);
  return router;
}
