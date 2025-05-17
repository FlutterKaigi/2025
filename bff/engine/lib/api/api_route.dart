import 'package:bff_client/bff_client.dart';
import 'package:engine/api/v1_api_route.dart';
import 'package:engine/main.dart';
import 'package:engine/util/json_response.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'api_route.g.dart';

@Riverpod(keepAlive: true)
ApiRoute apiRoute(Ref ref) => ApiRoute();

class ApiRoute {
  @Route.get('/')
  Future<Response> _getIndex(Request request) async {
    return jsonResponse(() async => {'message': 'FlutterKaigi 2025 BFF.'});
  }

  /// サーバの生存確認用のエンドポイント
  @Route.get('/health')
  Future<Response> _getHealth(Request request) async =>
      jsonResponse(() async => {'status': 'ok'});

  @Route.mount('/v1')
  Router get _v1Router => container.read(v1ApiRouteProvider).router;

  @Route.all('/<ignored|.*>')
  Future<Response> _notFound(Request request) async {
    const errorCode = ErrorCode.routeNotFound;
    final response = ErrorResponse.errorCode(
      code: errorCode,
      detail:
          'You requested ${request.requestedUri} '
          "which doesn't exist in this API.",
    );
    return jsonResponse(() async => response.toJson());
  }

  Router get router => _$ApiRouteRouter(this);
}
