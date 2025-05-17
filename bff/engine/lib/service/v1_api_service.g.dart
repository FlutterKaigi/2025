// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'v1_api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$v1ApiServiceHash() => r'5adc86b271789d97248202c26b364d7ac984f3dd';

/// See also [v1ApiService].
@ProviderFor(v1ApiService)
final v1ApiServiceProvider = Provider<V1ApiService>.internal(
  v1ApiService,
  name: r'v1ApiServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$v1ApiServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef V1ApiServiceRef = ProviderRef<V1ApiService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$V1ApiServiceRouter(V1ApiService service) {
  final router = Router();
  router.mount(r'/users', service._usersRouter.call);
  return router;
}
