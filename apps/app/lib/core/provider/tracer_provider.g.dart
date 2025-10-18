// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'tracer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tracer)
const tracerProvider = TracerProvider._();

final class TracerProvider
    extends
        $FunctionalProvider<
          sdk.TracerProvider,
          sdk.TracerProvider,
          sdk.TracerProvider
        >
    with $Provider<sdk.TracerProvider> {
  const TracerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tracerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tracerHash();

  @$internal
  @override
  $ProviderElement<sdk.TracerProvider> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  sdk.TracerProvider create(Ref ref) {
    return tracer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(sdk.TracerProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<sdk.TracerProvider>(value),
    );
  }
}

String _$tracerHash() => r'e854b8ac8644be41742bf0f72faf3cdaa270c09e';
