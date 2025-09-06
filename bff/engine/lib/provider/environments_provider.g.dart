// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'environments_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(environments)
const environmentsProvider = EnvironmentsProvider._();

final class EnvironmentsProvider
    extends $FunctionalProvider<Environments, Environments, Environments>
    with $Provider<Environments> {
  const EnvironmentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'environmentsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$environmentsHash();

  @$internal
  @override
  $ProviderElement<Environments> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Environments create(Ref ref) {
    return environments(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Environments value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Environments>(value),
    );
  }
}

String _$environmentsHash() => r'9041501eca6a8c9ae378d767e2870605766ea373';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
