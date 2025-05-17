// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiServiceHash() => r'93a7e3b4d3004741abc3061c4688239c3a72f9c4';

/// See also [apiService].
@ProviderFor(apiService)
final apiServiceProvider = Provider<ApiService>.internal(
  apiService,
  name: r'apiServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApiServiceRef = ProviderRef<ApiService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$ApiServiceRouter(ApiService service) {
  final router = Router();
  router.add('GET', r'/', service._getIndex);
  router.mount(r'/v1', service._v1Router.call);
  router.all(r'/<ignored|.*>', service._notFound);
  return router;
}
