// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'websocket_ticket_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(websocketTicketRepository)
const websocketTicketRepositoryProvider = WebsocketTicketRepositoryProvider._();

final class WebsocketTicketRepositoryProvider
    extends
        $FunctionalProvider<
          WebsocketTicketRepository,
          WebsocketTicketRepository,
          WebsocketTicketRepository
        >
    with $Provider<WebsocketTicketRepository> {
  const WebsocketTicketRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'websocketTicketRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$websocketTicketRepositoryHash();

  @$internal
  @override
  $ProviderElement<WebsocketTicketRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WebsocketTicketRepository create(Ref ref) {
    return websocketTicketRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WebsocketTicketRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WebsocketTicketRepository>(value),
    );
  }
}

String _$websocketTicketRepositoryHash() =>
    r'dd47ceab02d1595b67022c88de55be53cd5c9081';
