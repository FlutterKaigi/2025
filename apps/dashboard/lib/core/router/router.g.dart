// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$loginRoute, $mainRoute, $debugRoute];

RouteBase get $loginRoute =>
    GoRouteData.$route(path: '/login', factory: _$LoginRoute._fromState);

mixin _$LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainRoute => StatefulShellRouteData.$route(
  factory: $MainRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      observers: EventBranch.$observers,
      routes: [
        GoRouteData.$route(
          path: '/event',
          factory: _$EventInfoRoute._fromState,
          routes: [
            GoRouteData.$route(path: 'news', factory: _$NewsRoute._fromState),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      observers: SponsorBranch.$observers,
      routes: [
        GoRouteData.$route(
          path: '/sponsors',
          factory: _$SponsorListRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: ':slug',
              factory: _$SponsorDetailRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'edit',
                  parentNavigatorKey: SponsorEditRoute.$parentNavigatorKey,
                  factory: _$SponsorEditRoute._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      observers: TicketBranch.$observers,
      routes: [
        GoRouteData.$route(
          path: '/tickets',
          factory: _$TicketListRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: ':ticketTypeId',
              factory: _$TicketDetailRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'owned',
              factory: _$OwnedTicketsRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      observers: AccountBranch.$observers,
      routes: [
        GoRouteData.$route(
          path: '/account',
          factory: _$AccountInfoRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'profile-edit',
              parentNavigatorKey: ProfileEditRoute.$parentNavigatorKey,
              factory: _$ProfileEditRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'withdrawal',
              parentNavigatorKey: WithdrawalRoute.$parentNavigatorKey,
              factory: _$WithdrawalRoute._fromState,
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

mixin _$EventInfoRoute on GoRouteData {
  static EventInfoRoute _fromState(GoRouterState state) =>
      const EventInfoRoute();

  @override
  String get location => GoRouteData.$location('/event');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$NewsRoute on GoRouteData {
  static NewsRoute _fromState(GoRouterState state) => const NewsRoute();

  @override
  String get location => GoRouteData.$location('/event/news');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SponsorListRoute on GoRouteData {
  static SponsorListRoute _fromState(GoRouterState state) =>
      const SponsorListRoute();

  @override
  String get location => GoRouteData.$location('/sponsors');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SponsorDetailRoute on GoRouteData {
  static SponsorDetailRoute _fromState(GoRouterState state) =>
      SponsorDetailRoute(slug: state.pathParameters['slug']!);

  SponsorDetailRoute get _self => this as SponsorDetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/sponsors/${Uri.encodeComponent(_self.slug)}');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$SponsorEditRoute on GoRouteData {
  static SponsorEditRoute _fromState(GoRouterState state) =>
      SponsorEditRoute(slug: state.pathParameters['slug']!);

  SponsorEditRoute get _self => this as SponsorEditRoute;

  @override
  String get location => GoRouteData.$location(
    '/sponsors/${Uri.encodeComponent(_self.slug)}/edit',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$TicketListRoute on GoRouteData {
  static TicketListRoute _fromState(GoRouterState state) =>
      const TicketListRoute();

  @override
  String get location => GoRouteData.$location('/tickets');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$TicketDetailRoute on GoRouteData {
  static TicketDetailRoute _fromState(GoRouterState state) =>
      TicketDetailRoute(ticketTypeId: state.pathParameters['ticketTypeId']!);

  TicketDetailRoute get _self => this as TicketDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/tickets/${Uri.encodeComponent(_self.ticketTypeId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$OwnedTicketsRoute on GoRouteData {
  static OwnedTicketsRoute _fromState(GoRouterState state) =>
      const OwnedTicketsRoute();

  @override
  String get location => GoRouteData.$location('/tickets/owned');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$AccountInfoRoute on GoRouteData {
  static AccountInfoRoute _fromState(GoRouterState state) =>
      const AccountInfoRoute();

  @override
  String get location => GoRouteData.$location('/account');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$ProfileEditRoute on GoRouteData {
  static ProfileEditRoute _fromState(GoRouterState state) =>
      const ProfileEditRoute();

  @override
  String get location => GoRouteData.$location('/account/profile-edit');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$WithdrawalRoute on GoRouteData {
  static WithdrawalRoute _fromState(GoRouterState state) =>
      const WithdrawalRoute();

  @override
  String get location => GoRouteData.$location('/account/withdrawal');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $debugRoute => GoRouteData.$route(
  path: '/debug',
  factory: _$DebugRoute._fromState,
  routes: [
    GoRouteData.$route(path: 'talker', factory: _$TalkerRoute._fromState),
  ],
);

mixin _$DebugRoute on GoRouteData {
  static DebugRoute _fromState(GoRouterState state) => const DebugRoute();

  @override
  String get location => GoRouteData.$location('/debug');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$TalkerRoute on GoRouteData {
  static TalkerRoute _fromState(GoRouterState state) => const TalkerRoute();

  @override
  String get location => GoRouteData.$location('/debug/talker');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(router)
const routerProvider = RouterProvider._();

final class RouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
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
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$routerHash() => r'321e1fe5325869f339fb5dfd64b42a85f6e7ff76';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
