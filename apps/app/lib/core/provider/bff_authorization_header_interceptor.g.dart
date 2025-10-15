// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'bff_authorization_header_interceptor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bffAuthorizationHeaderInterceptor)
const bffAuthorizationHeaderInterceptorProvider =
    BffAuthorizationHeaderInterceptorProvider._();

final class BffAuthorizationHeaderInterceptorProvider
    extends
        $FunctionalProvider<
          BffAuthorizationHeaderInterceptor,
          BffAuthorizationHeaderInterceptor,
          BffAuthorizationHeaderInterceptor
        >
    with $Provider<BffAuthorizationHeaderInterceptor> {
  const BffAuthorizationHeaderInterceptorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bffAuthorizationHeaderInterceptorProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$bffAuthorizationHeaderInterceptorHash();

  @$internal
  @override
  $ProviderElement<BffAuthorizationHeaderInterceptor> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BffAuthorizationHeaderInterceptor create(Ref ref) {
    return bffAuthorizationHeaderInterceptor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BffAuthorizationHeaderInterceptor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BffAuthorizationHeaderInterceptor>(
        value,
      ),
    );
  }
}

String _$bffAuthorizationHeaderInterceptorHash() =>
    r'7155669ed7f09d3c825a4fde445106f4669a9e33';
