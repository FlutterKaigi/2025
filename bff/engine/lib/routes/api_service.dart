import 'dart:convert';
import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'api_service.g.dart';

class ApiService {
  @Route.get('/health')
  Response _health(Request request) => Response.ok(
    jsonEncode(
      {
        'status': 'ok',
        'container': {
          'id': Platform.environment['CF_VERSION_METADATA_ID'],
          'started_at': Platform.environment['CF_VERSION_METADATA_TIMESTAMP'],
          'version': Platform.version,
          'operating_system': Platform.operatingSystem,
        },
      },
    ),
    headers: {'Content-Type': 'application/json'},
  );

  @Route.all('/<ignored|.*>')
  Response _notFound(Request request) => Response.notFound(
    jsonEncode(
      ErrorResponse.errorCode(
        code: ErrorCode.routeNotFound,
        detail: 'route: ${request.requestedUri} not found',
      ).toJson(),
    ),
    headers: {'Content-Type': 'application/json'},
  );

  Handler get handler => _$ApiServiceRouter(this).call;
}
