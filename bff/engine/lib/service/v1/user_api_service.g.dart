// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'user_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userApiServiceHash() => r'b657ac85cdaef35e4b78b87cf9f006e9abbe1829';

/// See also [userApiService].
@ProviderFor(userApiService)
final userApiServiceProvider = Provider<UserApiService>.internal(
  userApiService,
  name: r'userApiServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$userApiServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserApiServiceRef = ProviderRef<UserApiService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$UserApiServiceRouter(UserApiService service) {
  final router = Router();
  router.add('GET', r'/me', service._getMe);
  return router;
}
