// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'api_service.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$ApiServiceRouter(ApiService service) {
  final router = Router();
  router.add('GET', r'/health', service._health);
  router.mount(r'/v1/users', service._userApiService.call);
  router.mount(r'/v1', service._newsApiService.call);
  router.mount(r'/v1/tickets', service._ticketApiService.call);
  router.all(r'/<ignored|.*>', service._notFound);
  return router;
}
