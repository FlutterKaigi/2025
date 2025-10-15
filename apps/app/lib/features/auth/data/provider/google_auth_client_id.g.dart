// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'google_auth_client_id.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(googleAuthClientId)
const googleAuthClientIdProvider = GoogleAuthClientIdProvider._();

final class GoogleAuthClientIdProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const GoogleAuthClientIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleAuthClientIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleAuthClientIdHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return googleAuthClientId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$googleAuthClientIdHash() =>
    r'5c599e145322096fd153c54aba2f6ef251a6a116';

@ProviderFor(googleAuthWebClientId)
const googleAuthWebClientIdProvider = GoogleAuthWebClientIdProvider._();

final class GoogleAuthWebClientIdProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const GoogleAuthWebClientIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleAuthWebClientIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleAuthWebClientIdHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return googleAuthWebClientId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$googleAuthWebClientIdHash() =>
    r'abe0dbdaf4471f8c1fa9690f66e6ce7d6b27edc3';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
