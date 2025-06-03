// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$loginRoute, $mainRoute];

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',

  factory: $LoginRouteExtension._fromState,
);

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location('/login');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainRoute => StatefulShellRouteData.$route(
  factory: $MainRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/event',

          factory: $EventInfoRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'news',

              factory: $NewsRouteExtension._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/sponsors',

          factory: $SponsorListRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: ':slug',

              factory: $SponsorDetailRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'edit',

                  parentNavigatorKey: SponsorEditRoute.$parentNavigatorKey,

                  factory: $SponsorEditRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/account',

          factory: $AccountInfoRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'profile-edit',

              parentNavigatorKey: ProfileEditRoute.$parentNavigatorKey,

              factory: $ProfileEditRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'withdrawal',

              parentNavigatorKey: WithdrawalRoute.$parentNavigatorKey,

              factory: $WithdrawalRouteExtension._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();
}

extension $EventInfoRouteExtension on EventInfoRoute {
  static EventInfoRoute _fromState(GoRouterState state) =>
      const EventInfoRoute();

  String get location => GoRouteData.$location('/event');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NewsRouteExtension on NewsRoute {
  static NewsRoute _fromState(GoRouterState state) => const NewsRoute();

  String get location => GoRouteData.$location('/event/news');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SponsorListRouteExtension on SponsorListRoute {
  static SponsorListRoute _fromState(GoRouterState state) =>
      const SponsorListRoute();

  String get location => GoRouteData.$location('/sponsors');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SponsorDetailRouteExtension on SponsorDetailRoute {
  static SponsorDetailRoute _fromState(GoRouterState state) =>
      SponsorDetailRoute(slug: state.pathParameters['slug']!);

  String get location =>
      GoRouteData.$location('/sponsors/${Uri.encodeComponent(slug)}');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SponsorEditRouteExtension on SponsorEditRoute {
  static SponsorEditRoute _fromState(GoRouterState state) =>
      SponsorEditRoute(slug: state.pathParameters['slug']!);

  String get location =>
      GoRouteData.$location('/sponsors/${Uri.encodeComponent(slug)}/edit');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountInfoRouteExtension on AccountInfoRoute {
  static AccountInfoRoute _fromState(GoRouterState state) =>
      const AccountInfoRoute();

  String get location => GoRouteData.$location('/account');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileEditRouteExtension on ProfileEditRoute {
  static ProfileEditRoute _fromState(GoRouterState state) =>
      const ProfileEditRoute();

  String get location => GoRouteData.$location('/account/profile-edit');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WithdrawalRouteExtension on WithdrawalRoute {
  static WithdrawalRoute _fromState(GoRouterState state) =>
      const WithdrawalRoute();

  String get location => GoRouteData.$location('/account/withdrawal');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(router)
const routerProvider = RouterProvider._();

final class RouterProvider extends $FunctionalProvider<GoRouter, GoRouter>
    with $Provider<GoRouter> {
  const RouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routerHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return router(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $ValueProvider<GoRouter>(value),
    );
  }
}

String _$routerHash() => r'ecc626acb78b04853f89f21c9027f94b9d700e5f';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
