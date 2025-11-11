// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'websocket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(websocketStream)
const websocketStreamProvider = WebsocketStreamProvider._();

final class WebsocketStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserWebsocketPayload>,
          UserWebsocketPayload,
          Stream<UserWebsocketPayload>
        >
    with
        $FutureModifier<UserWebsocketPayload>,
        $StreamProvider<UserWebsocketPayload> {
  const WebsocketStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'websocketStreamProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$websocketStreamHash();

  @$internal
  @override
  $StreamProviderElement<UserWebsocketPayload> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<UserWebsocketPayload> create(Ref ref) {
    return websocketStream(ref);
  }
}

String _$websocketStreamHash() => r'e1dc35b4b62c2bb04c23e091621ac9bd94b56df1';

@ProviderFor(_websocketChannel)
const _websocketChannelProvider = _WebsocketChannelProvider._();

final class _WebsocketChannelProvider
    extends
        $FunctionalProvider<
          AsyncValue<WebSocketChannel>,
          WebSocketChannel,
          FutureOr<WebSocketChannel>
        >
    with $FutureModifier<WebSocketChannel>, $FutureProvider<WebSocketChannel> {
  const _WebsocketChannelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_websocketChannelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_websocketChannelHash();

  @$internal
  @override
  $FutureProviderElement<WebSocketChannel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WebSocketChannel> create(Ref ref) {
    return _websocketChannel(ref);
  }
}

String _$_websocketChannelHash() => r'05065658e1f2200e91cf4b1ec3098e1e4b0cd16b';
