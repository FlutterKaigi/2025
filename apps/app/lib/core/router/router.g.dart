// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$mainRoute, $debugRoute];

RouteBase get $mainRoute => StatefulShellRouteData.$route(
  factory: $MainRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      observers: EventBranch.$observers,
      routes: [
        GoRouteData.$route(
          path: '/event',
          factory: $EventInfoRoute._fromState,
          routes: [
            GoRouteData.$route(path: 'news', factory: $NewsRoute._fromState),
            GoRouteData.$route(
              path: 'staff-members',
              parentNavigatorKey: StaffMemberListRoute.$parentNavigatorKey,
              factory: $StaffMemberListRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'licenses',
              parentNavigatorKey: LicenseRoute.$parentNavigatorKey,
              factory: $LicenseRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':package',
                  parentNavigatorKey: LicenseDetailRoute.$parentNavigatorKey,
                  factory: $LicenseDetailRoute._fromState,
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
          path: '/sessions',
          factory: $SessionTimelineRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'bookmarked',
              factory: $BookmarkedSessionsRoute._fromState,
            ),
            GoRouteData.$route(
              path: ':sessionId',
              factory: $SessionDetailRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      observers: VenueBranch.$observers,
      routes: [
        GoRouteData.$route(path: '/venue', factory: $VenueRoute._fromState),
      ],
    ),
    StatefulShellBranchData.$branch(
      observers: SponsorBranch.$observers,
      routes: [
        GoRouteData.$route(
          path: '/sponsors',
          factory: $SponsorListRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: ':slug',
              factory: $SponsorDetailRoute._fromState,
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

mixin $EventInfoRoute on GoRouteData {
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

mixin $NewsRoute on GoRouteData {
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

mixin $StaffMemberListRoute on GoRouteData {
  static StaffMemberListRoute _fromState(GoRouterState state) =>
      const StaffMemberListRoute();

  @override
  String get location => GoRouteData.$location('/event/staff-members');

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

mixin $LicenseRoute on GoRouteData {
  static LicenseRoute _fromState(GoRouterState state) => const LicenseRoute();

  @override
  String get location => GoRouteData.$location('/event/licenses');

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

mixin $LicenseDetailRoute on GoRouteData {
  static LicenseDetailRoute _fromState(GoRouterState state) =>
      LicenseDetailRoute(package: state.pathParameters['package']!);

  LicenseDetailRoute get _self => this as LicenseDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/event/licenses/${Uri.encodeComponent(_self.package)}',
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

mixin $SessionTimelineRoute on GoRouteData {
  static SessionTimelineRoute _fromState(GoRouterState state) =>
      const SessionTimelineRoute();

  @override
  String get location => GoRouteData.$location('/sessions');

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

mixin $BookmarkedSessionsRoute on GoRouteData {
  static BookmarkedSessionsRoute _fromState(GoRouterState state) =>
      const BookmarkedSessionsRoute();

  @override
  String get location => GoRouteData.$location('/sessions/bookmarked');

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

mixin $SessionDetailRoute on GoRouteData {
  static SessionDetailRoute _fromState(GoRouterState state) =>
      SessionDetailRoute(sessionId: state.pathParameters['sessionId']!);

  SessionDetailRoute get _self => this as SessionDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/sessions/${Uri.encodeComponent(_self.sessionId)}',
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

mixin $VenueRoute on GoRouteData {
  static VenueRoute _fromState(GoRouterState state) => const VenueRoute();

  @override
  String get location => GoRouteData.$location('/venue');

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

mixin $SponsorListRoute on GoRouteData {
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

mixin $SponsorDetailRoute on GoRouteData {
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

RouteBase get $debugRoute => GoRouteData.$route(
  path: '/debug',
  factory: $DebugRoute._fromState,
  routes: [
    GoRouteData.$route(path: 'talker', factory: $TalkerRoute._fromState),
  ],
);

mixin $DebugRoute on GoRouteData {
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

mixin $TalkerRoute on GoRouteData {
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

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$routerHash() => r'42129dee508a73ee22ca70c18b1d7d227af4080e';
