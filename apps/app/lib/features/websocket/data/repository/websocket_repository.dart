import 'package:app/core/api/api_exception.dart';
import 'package:app/core/provider/bff_client.dart';
import 'package:bff_client/bff_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'websocket_repository.g.dart';

@Riverpod(keepAlive: true)
WebsocketRepository websocketRepository(Ref ref) => WebsocketRepository(
  websocketApiClient: ref.read(bffClientProvider).v1.websocket,
);

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
}
