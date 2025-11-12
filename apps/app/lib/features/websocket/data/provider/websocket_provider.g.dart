// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'websocket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(websocketPayloadStream)
const websocketPayloadStreamProvider = WebsocketPayloadStreamProvider._();

final class WebsocketPayloadStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserWebsocketPayload>,
          UserWebsocketPayload,
          Stream<UserWebsocketPayload>
        >
    with
        $FutureModifier<UserWebsocketPayload>,
        $StreamProvider<UserWebsocketPayload> {
  const WebsocketPayloadStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'websocketPayloadStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$websocketPayloadStreamHash();

  @$internal
  @override
  $StreamProviderElement<UserWebsocketPayload> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<UserWebsocketPayload> create(Ref ref) {
    return websocketPayloadStream(ref);
  }
}

String _$websocketPayloadStreamHash() =>
    r'c928aa21f2b785da28755d77ebe01661cd1670a5';

@ProviderFor(websocketStream)
const websocketStreamProvider = WebsocketStreamProvider._();

final class WebsocketStreamProvider
    extends $FunctionalProvider<AsyncValue<String>, String, Stream<String>>
    with $FutureModifier<String>, $StreamProvider<String> {
  const WebsocketStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'websocketStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$websocketStreamHash();

  @$internal
  @override
  $StreamProviderElement<String> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<String> create(Ref ref) {
    return websocketStream(ref);
  }
}

String _$websocketStreamHash() => r'be460e997887c9bc1052af2d7f2be7c7275fe8d3';

@ProviderFor(websocketChannel)
const websocketChannelProvider = WebsocketChannelProvider._();

final class WebsocketChannelProvider
    extends
        $FunctionalProvider<
          AsyncValue<WebSocketChannel>,
          WebSocketChannel,
          FutureOr<WebSocketChannel>
        >
    with $FutureModifier<WebSocketChannel>, $FutureProvider<WebSocketChannel> {
  const WebsocketChannelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'websocketChannelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$websocketChannelHash();

  @$internal
  @override
  $FutureProviderElement<WebSocketChannel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WebSocketChannel> create(Ref ref) {
    return websocketChannel(ref);
  }
}

String _$websocketChannelHash() => r'3a5d8ebd72df5af9ef23b211acc69fda88d6e573';
