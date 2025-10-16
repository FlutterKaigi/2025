// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'app_lifecycle_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
