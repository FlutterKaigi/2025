// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'api_route.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(apiRoute)
const apiRouteProvider = ApiRouteProvider._();

final class ApiRouteProvider extends $FunctionalProvider<ApiRoute, ApiRoute>
    with $Provider<ApiRoute> {
  const ApiRouteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiRouteProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiRouteHash();

  @$internal
  @override
  $ProviderElement<ApiRoute> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiRoute create(Ref ref) {
    return apiRoute(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiRoute value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<ApiRoute>(value),
    );
  }
}

String _$apiRouteHash() => r'a2b73512173823e60d4869f50df57cfacc9725e5';

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
