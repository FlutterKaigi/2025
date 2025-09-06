// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'force_update_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(forceUpdateChecker)
const forceUpdateCheckerProvider = ForceUpdateCheckerProvider._();

final class ForceUpdateCheckerProvider
    extends
        $FunctionalProvider<
          ForceUpdateChecker,
          ForceUpdateChecker,
          ForceUpdateChecker
        >
    with $Provider<ForceUpdateChecker> {
  const ForceUpdateCheckerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'forceUpdateCheckerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$forceUpdateCheckerHash();

  @$internal
  @override
  $ProviderElement<ForceUpdateChecker> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ForceUpdateChecker create(Ref ref) {
    return forceUpdateChecker(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ForceUpdateChecker value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ForceUpdateChecker>(value),
    );
  }
}

String _$forceUpdateCheckerHash() =>
    r'70e85ade601c2169aa0808962dd354c46da2842d';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
