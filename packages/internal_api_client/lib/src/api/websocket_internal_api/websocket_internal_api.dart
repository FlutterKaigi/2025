import 'package:dio/dio.dart';
import 'package:internal_api_client/src/api/websocket_internal_api/websocket_internal_api_client.dart';

class WebsocketInternalApi {
  WebsocketInternalApi({required Dio dio})
      : _client = WebsocketInternalApiClient(dio);

  final WebsocketInternalApiClient _client;

  WebsocketInternalApiClient get client => _client;
}

