// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'v1_api_route.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$v1ApiRouteHash() => r'007b30bd3478ceb87ceae6da26137d2f85141ce2';

/// See also [v1ApiRoute].
@ProviderFor(v1ApiRoute)
final v1ApiRouteProvider = Provider<V1ApiRoute>.internal(
  v1ApiRoute,
  name: r'v1ApiRouteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$v1ApiRouteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef V1ApiRouteRef = ProviderRef<V1ApiRoute>;
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
