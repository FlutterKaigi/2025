import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'api_service.g.dart';

class ApiService {
  @Route.get('/health')
  Future<Response> _health(Request request) async => jsonResponse(
    () async {
      final database = await container.read(
        dbClientProvider.future,
      );

      return {
        'status': 'ok',
        'database': database.isOpen ? 'ok' : 'ng',
        'container': {
          'id': Platform.environment['CF_VERSION_METADATA_ID'],
          'started_at': Platform.environment['CF_VERSION_METADATA_TIMESTAMP'],
          'operating_system': Platform.operatingSystem,
          'dart_version': Platform.version,
        },
      };
    },
  );

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

  Handler get handler => _$ApiServiceRouter(this).call;
}
