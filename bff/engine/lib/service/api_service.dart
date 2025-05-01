import 'dart:convert';

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
      jsonEncode({
        'message': 'Hello! I am FlutterKaigi 2025 BFF.',
        'requested_at': DateTime.now().toIso8601String(),
        'request_headers': request.headers,
        'request_url': request.requestedUri.toString(),
      }),
    );
  }

  Router get router => _$ApiServiceRouter(this);
}
