// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'google_auth_client_id.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
        isAutoDispose: false,
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
    r'deebf64b5c3ec1ac0af13235e3c0bbfc320ef94b';

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
        isAutoDispose: false,
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
    r'c66b7de6349ba3460741ee593aec36813ac1ade2';
