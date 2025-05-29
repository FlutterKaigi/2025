// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'fetch_api_http_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(fetchApiHttpClient)
const fetchApiHttpClientProvider = FetchApiHttpClientProvider._();

final class FetchApiHttpClientProvider
    extends $FunctionalProvider<FetchApiHttpClient, FetchApiHttpClient>
    with $Provider<FetchApiHttpClient> {
  const FetchApiHttpClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fetchApiHttpClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fetchApiHttpClientHash();

  @$internal
  @override
  $ProviderElement<FetchApiHttpClient> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FetchApiHttpClient create(Ref ref) {
    return fetchApiHttpClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FetchApiHttpClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<FetchApiHttpClient>(value),
    );
  }
}

String _$fetchApiHttpClientHash() =>
    r'8319646fea934b7e96d3e9706f97e72da130b82e';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
