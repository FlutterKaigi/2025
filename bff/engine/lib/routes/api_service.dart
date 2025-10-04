import 'dart:io';

import 'package:bff_client/bff_client.dart';
import 'package:db_client/db_client.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/provider/environments_provider.dart';
import 'package:engine/routes/app_version_api_service.dart';
import 'package:engine/routes/files_api_service.dart';
import 'package:engine/routes/news_api_service.dart';
import 'package:engine/routes/profile_api_service.dart';
import 'package:engine/routes/sponsor_api_service.dart';
import 'package:engine/routes/ticket_api_service.dart';
import 'package:engine/routes/user_api_service.dart';
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
      if (!database.isOpen) {
        throw DatabaseClosedException();
      }

      final environment = container.read(environmentsProvider);

      return {
        'status': 'ok',
        'database': 'ok',
        'container': {
          'id': environment.cfVersionMetadataId,
          'tag': environment.cfVersionMetadataTag,
          'build_timestamp': environment.cfVersionMetadataTimestamp,
          'operating_system':
              '${Platform.operatingSystem} ${Platform.operatingSystemVersion}',
          'dart_version': Platform.version,
        },
      };
    },
  );

  @Route.mount('/v1/users')
  Router get _userApiService => UserApiService().router;

  @Route.mount('/v1/profile')
  Router get _profileApiService => ProfileApiService().router;

  @Route.mount('/v1/files')
  Router get _filesApiService => FilesApiService().router;

  @Route.mount('/v1')
  Router get _newsApiService => NewsApiService().router;

  @Route.mount('/v1')
  Router get _sponsorApiService => SponsorApiService().router;

  @Route.mount('/v1/tickets')
  Router get _ticketApiService => TicketApiService().router;

  @Route.mount('/v1/app')
  Router get _appVersionApiService => AppVersionApiService().router;

  @Route.all('/<ignored|.*>')
  Future<Response> _notFound(Request request) async {
    const errorCode = ErrorCode.routeNotFound;
    final response = ErrorResponse.errorCode(
      code: errorCode,
      detail:
          'You requested ${request.requestedUri} '
          "which doesn't exist in this API.",
    );
    return jsonResponse(
      () async => response.toJson(),
      HttpStatus.notFound,
    );
  }

  Handler get handler => _$ApiServiceRouter(this).call;
}
