// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'api_route.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiRouteHash() => r'a2b73512173823e60d4869f50df57cfacc9725e5';

/// See also [apiRoute].
@ProviderFor(apiRoute)
final apiRouteProvider = Provider<ApiRoute>.internal(
  apiRoute,
  name: r'apiRouteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiRouteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApiRouteRef = ProviderRef<ApiRoute>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$ApiRouteRouter(ApiRoute service) {
  final router = Router();
  router.add('GET', r'/', service._getIndex);
  router.add('GET', r'/health', service._getHealth);
  router.mount(r'/v1', service._v1Router.call);
  router.all(r'/<ignored|.*>', service._notFound);
  return router;
}
