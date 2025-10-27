import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'websocket_api_client.g.dart';

@RestApi()
abstract class WebsocketApiClient {
  factory WebsocketApiClient(Dio dio, {String baseUrl}) = _WebsocketApiClient;

  @POST('/websocket/start/user')
  Future<UserWebsocketResponse> startUserWebsocket();
}
