import 'package:engine/service/api_service.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf.dart';

part 'handler.g.dart';

@Riverpod(keepAlive: true)
Handler handler(Ref ref) {
  final service = ref.watch(apiServiceProvider);
  final router = service.router;

  return const Pipeline().addMiddleware(logRequests()).addHandler(router.call);
}
