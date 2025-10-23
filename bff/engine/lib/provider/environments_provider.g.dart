// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'environments_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
