import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'api_service.g.dart';

@Riverpod(keepAlive: true)
ApiService apiService(Ref ref) => ApiService();

class ApiService {
  @Route.get('/')
  Future<Response> _getIndex(Request request) async {
    return Response.ok(
      'Hello! I am FlutterKaigi 2025 BFF.\n'
      'Requested at: ${DateTime.now().toIso8601String()}',
    );
  }

  Router get router => _$ApiServiceRouter(this);

}
