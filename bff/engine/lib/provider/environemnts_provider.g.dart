// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'environemnts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(environemnts)
const environemntsProvider = EnvironemntsProvider._();

final class EnvironemntsProvider
    extends $FunctionalProvider<Environments, Environments>
    with $Provider<Environments> {
  const EnvironemntsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'environemntsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$environemntsHash();

  @$internal
  @override
  $ProviderElement<Environments> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Environments create(Ref ref) {
    return environemnts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Environments value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<Environments>(value),
    );
  }
}

String _$environemntsHash() => r'3007fa6057dec649d23528de4ca185c62dc099ca';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
