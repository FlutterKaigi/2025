// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'bff_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bffClient)
const bffClientProvider = BffClientProvider._();

final class BffClientProvider
    extends $FunctionalProvider<BffApiClient, BffApiClient, BffApiClient>
    with $Provider<BffApiClient> {
  const BffClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bffClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bffClientHash();

  @$internal
  @override
  $ProviderElement<BffApiClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BffApiClient create(Ref ref) {
    return bffClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BffApiClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BffApiClient>(value),
    );
  }
}

String _$bffClientHash() => r'f14b8ec2c8c30ef506937a8fa38d52521b4383ae';

@ProviderFor(bffDio)
const bffDioProvider = BffDioProvider._();

final class BffDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const BffDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bffDioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bffDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return bffDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$bffDioHash() => r'b1e475d4324508714397a2d92f10e1108079db74';
