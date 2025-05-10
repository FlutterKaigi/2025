import 'package:engine/main.dart';
import 'package:engine/service/v1/user_api_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf_router/shelf_router.dart';

part 'v1_api_service.g.dart';


@Riverpod(keepAlive: true)
V1ApiService v1ApiService(Ref ref) => V1ApiService();

class V1ApiService {
  @Route.mount('/users')
  Router get _usersRouter => container.read(userApiServiceProvider).router;

  Router get router => _$V1ApiServiceRouter(this);
}
