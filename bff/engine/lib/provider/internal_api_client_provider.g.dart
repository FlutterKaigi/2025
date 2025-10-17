// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'internal_api_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(internalApiClient)
const internalApiClientProvider = InternalApiClientProvider._();

final class InternalApiClientProvider
    extends
        $FunctionalProvider<
          InternalApiClient,
          InternalApiClient,
          InternalApiClient
        >
    with $Provider<InternalApiClient> {
  const InternalApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'internalApiClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$internalApiClientHash();

  @$internal
  @override
  $ProviderElement<InternalApiClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InternalApiClient create(Ref ref) {
    return internalApiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InternalApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InternalApiClient>(value),
    );
  }
}

String _$internalApiClientHash() => r'caa5cd8a7f636a4f84f6168f5c282ed11a626ceb';

@ProviderFor(internalApiDio)
const internalApiDioProvider = InternalApiDioProvider._();

final class InternalApiDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const InternalApiDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'internalApiDioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$internalApiDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return internalApiDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$internalApiDioHash() => r'c56bc408ceb637a8ce11d968dd7a5201abad44b0';
