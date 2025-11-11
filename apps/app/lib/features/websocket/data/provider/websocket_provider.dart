import 'dart:async';
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
  final stream = websocketChannel.stream
      .map(
        (event) {
          talker.logCustom(
            WebsocketEventLog(
              event.toString(),
            ),
          );
          if (event == 'pong') {
            return null;
          }
          if (event is String) {
            final json = jsonDecode(event);
            if (json is Map<String, dynamic>) {
              return UserWebsocketPayload.fromJson(json);
            }
            throw Exception('Invalid event: $event');
          }
        },
      )
      .where(
        (event) => event != null,
      )
      .cast<UserWebsocketPayload>();
  yield* stream;
}

@riverpod
Future<WebSocketChannel> _websocketChannel(Ref ref) async {
  final websocketRepository = ref.watch(websocketRepositoryProvider);
  final startUrl = await websocketRepository.getStartUrl();
  final channel = WebSocketChannel.connect(startUrl);
  final timer = Timer.periodic(
    const Duration(seconds: 15),
    (_) {
      channel.sink.add('ping');
      if (channel.closeCode != null) {
        talker.logCustom(
          WebsocketEventLog(
            'WebSocket closed: ${channel.closeCode}',
          ),
        );
        ref.invalidateSelf();
      }
    },
  );
  ref.onDispose(timer.cancel);
  return channel;
}

class WebsocketEventLog extends TalkerLog {
  WebsocketEventLog(super.message);
}
