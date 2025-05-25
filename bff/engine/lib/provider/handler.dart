import 'package:engine/api/api_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf.dart';

part 'handler.g.dart';

@Riverpod(keepAlive: true)
Handler handler(Ref ref) {
  final route = ref.watch(apiRouteProvider);
  final router = route.router;

  return const Pipeline().addMiddleware(logRequests()).addHandler(router.call);
}
