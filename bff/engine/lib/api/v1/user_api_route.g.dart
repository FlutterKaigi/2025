// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'user_api_route.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userApiRouteHash() => r'a279c2bdceeb481401e6de8b9fd9169c16549d00';

/// See also [userApiRoute].
@ProviderFor(userApiRoute)
final userApiRouteProvider = Provider<UserApiRoute>.internal(
  userApiRoute,
  name: r'userApiRouteProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userApiRouteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserApiRouteRef = ProviderRef<UserApiRoute>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$UserApiRouteRouter(UserApiRoute service) {
  final router = Router();
  router.add('GET', r'/me', service._getMe);
  return router;
}
