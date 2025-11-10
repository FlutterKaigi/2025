import 'dart:convert';

import 'package:app/core/debug/talker.dart';
import 'package:app/features/websocket/data/repository/websocket_repository.dart';
import 'package:bff_client/bff_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<UserWebsocketPayload> websocketStream(Ref ref) async* {
  final websocketChannel = await ref.watch(_websocketChannelProvider.future);
  yield* websocketChannel.stream.map(
    (event) {
      talker.logCustom(
        WebsocketEventLog(
          event.toString(),
        ),
      );
      if (event is String) {
        final json = jsonDecode(event);
        if (json is Map<String, dynamic>) {
          return UserWebsocketPayload.fromJson(json);
        }
        throw Exception('Invalid event: $event');
      }
      throw Exception('Invalid event: $event');
    },
  );
}

@riverpod
Future<WebSocketChannel> _websocketChannel(Ref ref) async {
  final websocketRepository = ref.watch(websocketRepositoryProvider);
  final startUrl = await websocketRepository.getStartUrl();
  return WebSocketChannel.connect(startUrl);
}

class WebsocketEventLog extends TalkerLog {
  WebsocketEventLog(super.message);
}
