// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'cf_workers_env.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(cfWorkersEnv)
const cfWorkersEnvProvider = CfWorkersEnvProvider._();

final class CfWorkersEnvProvider
    extends $FunctionalProvider<CfWorkersEnv, CfWorkersEnv>
    with $Provider<CfWorkersEnv> {
  const CfWorkersEnvProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cfWorkersEnvProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cfWorkersEnvHash();

  @$internal
  @override
  $ProviderElement<CfWorkersEnv> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CfWorkersEnv create(Ref ref) {
    return cfWorkersEnv(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CfWorkersEnv value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<CfWorkersEnv>(value),
    );
  }
}

String _$cfWorkersEnvHash() => r'bb3cb13a13d353e8e1c54acb341a3ab6b41046fd';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
