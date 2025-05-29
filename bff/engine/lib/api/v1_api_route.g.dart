// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'v1_api_route.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(v1ApiRoute)
const v1ApiRouteProvider = V1ApiRouteProvider._();

final class V1ApiRouteProvider
    extends $FunctionalProvider<V1ApiRoute, V1ApiRoute>
    with $Provider<V1ApiRoute> {
  const V1ApiRouteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'v1ApiRouteProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$v1ApiRouteHash();

  @$internal
  @override
  $ProviderElement<V1ApiRoute> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  V1ApiRoute create(Ref ref) {
    return v1ApiRoute(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(V1ApiRoute value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<V1ApiRoute>(value),
    );
  }
}

String _$v1ApiRouteHash() => r'007b30bd3478ceb87ceae6da26137d2f85141ce2';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$V1ApiRouteRouter(V1ApiRoute service) {
  final router = Router();
  router.mount(r'/users', service._usersRouter.call);
  return router;
}
