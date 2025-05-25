// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(handler)
const handlerProvider = HandlerProvider._();

final class HandlerProvider extends $FunctionalProvider<Handler, Handler>
    with $Provider<Handler> {
  const HandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'handlerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$handlerHash();

  @$internal
  @override
  $ProviderElement<Handler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Handler create(Ref ref) {
    return handler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Handler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<Handler>(value),
    );
  }
}

String _$handlerHash() => r'2a7350fca968338310c816d0ff4d94b24eb35773';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
