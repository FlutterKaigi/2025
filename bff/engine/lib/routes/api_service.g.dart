// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$ApiServiceRouter(ApiService service) {
  final router = Router();
  router.add('GET', r'/health', service._health);
  router.all(r'/<ignored|.*>', service._notFound);
  return router;
}
