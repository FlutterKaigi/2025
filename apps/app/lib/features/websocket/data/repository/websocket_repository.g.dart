// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'websocket_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(websocketRepository)
const websocketRepositoryProvider = WebsocketRepositoryProvider._();

final class WebsocketRepositoryProvider
    extends
        $FunctionalProvider<
          WebsocketRepository,
          WebsocketRepository,
          WebsocketRepository
        >
    with $Provider<WebsocketRepository> {
  const WebsocketRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'websocketRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$websocketRepositoryHash();

  @$internal
  @override
  $ProviderElement<WebsocketRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WebsocketRepository create(Ref ref) {
    return websocketRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WebsocketRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WebsocketRepository>(value),
    );
  }
}

String _$websocketRepositoryHash() =>
    r'6bb409cd39d2e4a113ea11ff24f09f61e1588c05';
