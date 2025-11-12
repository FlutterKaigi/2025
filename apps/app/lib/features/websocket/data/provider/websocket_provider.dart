import 'dart:async';
import 'dart:convert';

import 'package:app/core/debug/talker.dart';
import 'package:app/core/provider/app_lifecycle_provider.dart';
import 'package:app/features/websocket/data/repository/websocket_repository.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_provider.g.dart';

@riverpod
Stream<UserWebsocketPayload> websocketPayloadStream(Ref ref) async* {
  final controller = StreamController<UserWebsocketPayload>();

  ref.listen(websocketStreamProvider, (_, next) {
    if (next case AsyncData(value: final value)) {
      talker.logCustom(
        WebsocketEventLog(
          value,
        ),
      );
      if (value == 'pong') {
        return;
      }
      final json = jsonDecode(value);
      if (json is Map<String, dynamic>) {
        final payload = UserWebsocketPayload.fromJson(json);
        controller.add(payload);
      }
    }
  });

  ref.onDispose(controller.close);

  yield* controller.stream;
}

@riverpod
Stream<String> websocketStream(Ref ref) async* {
  final channel = await ref.watch(websocketChannelProvider.future);

  yield* channel.stream
      .where(
        (event) => event is String,
      )
      .cast<String>();
}

@riverpod
Future<WebSocketChannel> websocketChannel(Ref ref) async {
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

  ref.listen(appLifecycleProvider, (_, next) {
    if (next.value == AppLifecycleState.resumed) {
      ref.invalidateSelf();
    }
  });
  ref.onDispose(() async {
    timer.cancel();
    await channel.sink.close();
  });
  return channel;
}

class WebsocketEventLog extends TalkerLog {
  WebsocketEventLog(super.message);
}
