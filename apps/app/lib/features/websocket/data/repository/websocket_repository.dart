import 'package:app/core/api/api_exception.dart';
import 'package:bff_client/bff_client.dart';

class WebsocketRepository {
  WebsocketRepository({
    required WebsocketApiClient websocketApiClient,
  }) : _websocketApiClient = websocketApiClient;

  final WebsocketApiClient _websocketApiClient;

  Future<Uri> getStartUrl() async {
    final websocketToken = await ApiException.transform(
      () async => _websocketApiClient.startUserWebsocket(),
    );
    return Uri.parse(websocketToken.url);
  }

  Stream<String> startConnection({
    required Uri startUrl,
  }) async* {
    final ws = WebSocket.connect(startUrl.toString());
  }
}
