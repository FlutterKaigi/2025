import 'package:engine/api/v1/user_api_route.dart';
import 'package:engine/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf_router/shelf_router.dart';

part 'v1_api_route.g.dart';

@Riverpod(keepAlive: true)
V1ApiRoute v1ApiRoute(Ref ref) => V1ApiRoute();

class V1ApiRoute {
  @Route.mount('/users')
  Router get _usersRouter => container.read(userApiRouteProvider).router;

  Router get router => _$V1ApiRouteRouter(this);
}
