// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'jwt_secret_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(jwtSecret)
const jwtSecretProvider = JwtSecretProvider._();

final class JwtSecretProvider
    extends $FunctionalProvider<JWTKey, JWTKey, JWTKey>
    with $Provider<JWTKey> {
  const JwtSecretProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jwtSecretProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jwtSecretHash();

  @$internal
  @override
  $ProviderElement<JWTKey> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  JWTKey create(Ref ref) {
    return jwtSecret(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JWTKey value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JWTKey>(value),
    );
  }
}

String _$jwtSecretHash() => r'13955277aeb3aa5dd8b97e91b3b339be4dc645b9';
