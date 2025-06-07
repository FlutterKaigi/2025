// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'user_api_route.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(userApiRoute)
const userApiRouteProvider = UserApiRouteProvider._();

final class UserApiRouteProvider
    extends $FunctionalProvider<UserApiRoute, UserApiRoute>
    with $Provider<UserApiRoute> {
  const UserApiRouteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userApiRouteProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userApiRouteHash();

  @$internal
  @override
  $ProviderElement<UserApiRoute> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserApiRoute create(Ref ref) {
    return userApiRoute(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserApiRoute value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<UserApiRoute>(value),
    );
  }
}

String _$userApiRouteHash() => r'a279c2bdceeb481401e6de8b9fd9169c16549d00';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$UserApiRouteRouter(UserApiRoute service) {
  final router = Router();
  router.add('GET', r'/me', service._getMe);
  router.add('GET', r'/<userId>', service._getUser);
  router.add('PUT', r'/<userId>/roles', service._putUserRoles);
  return router;
}
