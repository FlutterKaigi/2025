// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'hyperdrive_env.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(hyperdriveEnv)
const hyperdriveEnvProvider = HyperdriveEnvProvider._();

final class HyperdriveEnvProvider
    extends $FunctionalProvider<HyperdriveEnv, HyperdriveEnv>
    with $Provider<HyperdriveEnv> {
  const HyperdriveEnvProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hyperdriveEnvProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hyperdriveEnvHash();

  @$internal
  @override
  $ProviderElement<HyperdriveEnv> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HyperdriveEnv create(Ref ref) {
    return hyperdriveEnv(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HyperdriveEnv value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<HyperdriveEnv>(value),
    );
  }
}

String _$hyperdriveEnvHash() => r'28989089200e6f198769317c9f88ec3334104dd4';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
