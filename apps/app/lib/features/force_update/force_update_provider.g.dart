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

@ProviderFor(ForceUpdateStateNotifier)
const forceUpdateStateNotifierProvider = ForceUpdateStateNotifierProvider._();

final class ForceUpdateStateNotifierProvider
    extends $NotifierProvider<ForceUpdateStateNotifier, ForceUpdateState> {
  const ForceUpdateStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'forceUpdateStateNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$forceUpdateStateNotifierHash();

  @$internal
  @override
  ForceUpdateStateNotifier create() => ForceUpdateStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ForceUpdateState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ForceUpdateState>(value),
    );
  }
}

String _$forceUpdateStateNotifierHash() =>
    r'23ff2c0780d78977bf168e1809f054770d757750';

abstract class _$ForceUpdateStateNotifier extends $Notifier<ForceUpdateState> {
  ForceUpdateState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ForceUpdateState, ForceUpdateState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ForceUpdateState, ForceUpdateState>,
              ForceUpdateState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
