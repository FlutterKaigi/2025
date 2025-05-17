import 'dart:convert';
import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:engine/main.dart';
import 'package:engine/service/v1_api_service.dart';
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
      jsonEncode({'message': 'Hello! I am FlutterKaigi 2025 BFF.'}),
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
    );
  }

  @Route.mount('/v1')
  Router get _v1Router => container.read(v1ApiServiceProvider).router;

  @Route.all('/<ignored|.*>')
  Response _notFound(Request request) {
    const errorCode = ErrorCode.routeNotFound;
    final response = ErrorResponse.errorCode(
      code: errorCode,
      detail:
          'You requested ${request.requestedUri} '
          "which doesn't exist in this API.",
    );
    return Response(
      errorCode.statusCode,
      body: jsonEncode(response.toJson()),
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
    );
  }

  Router get router => _$ApiServiceRouter(this);
}
