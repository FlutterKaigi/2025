// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'bff_authorization_header_interceptor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
    r'55630f1d98089be25a8a30725018cea9564c1b3e';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
