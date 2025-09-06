// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'app_lifecycle_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(appLifecycle)
const appLifecycleProvider = AppLifecycleProvider._();

final class AppLifecycleProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppLifecycleState>,
          AppLifecycleState,
          Stream<AppLifecycleState>
        >
    with
        $FutureModifier<AppLifecycleState>,
        $StreamProvider<AppLifecycleState> {
  const AppLifecycleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLifecycleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLifecycleHash();

  @$internal
  @override
  $StreamProviderElement<AppLifecycleState> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<AppLifecycleState> create(Ref ref) {
    return appLifecycle(ref);
  }
}

String _$appLifecycleHash() => r'48335bfcac453276c6e31712ec049454f5422af8';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
