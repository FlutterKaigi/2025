import 'package:bff_client/bff_client.dart';
import 'package:dio/dio.dart';
import 'package:internal_api_client/src/api/websocket_internal_api/model/send_websocket_response.dart';
import 'package:retrofit/retrofit.dart';

part 'websocket_internal_api_client.g.dart';

@RestApi()
abstract class WebsocketInternalApiClient {
  factory WebsocketInternalApiClient(Dio dio, {String baseUrl}) =
      _WebsocketInternalApiClient;

  @POST('/proxy/websocket-api/internal/user/{sub}')
  Future<HttpResponse<SendWebsocketResponse>> sendWebsocketMessage({
    @Path() required String sub,
    @Body() required UserWebsocketPayload payload,
  });
}

