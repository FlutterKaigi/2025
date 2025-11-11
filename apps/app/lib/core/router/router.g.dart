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
    StatefulShellBranchData.$branch(
      observers: TicketBranch.$observers,
      routes: [
        GoRouteData.$route(
          path: '/tickets',
          factory: $TicketRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: ':ticketId',
              factory: $TicketDetailRoute._fromState,
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
          factory: $AccountInfoRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'login',
              parentNavigatorKey: LoginRoute.$parentNavigatorKey,
              factory: $LoginRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'profile-edit',
              parentNavigatorKey: ProfileEditRoute.$parentNavigatorKey,
              factory: $ProfileEditRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'withdrawal',
              parentNavigatorKey: WithdrawalRoute.$parentNavigatorKey,
              factory: $WithdrawalRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'profile-share',
              parentNavigatorKey: ProfileShareListRoute.$parentNavigatorKey,
              factory: $ProfileShareListRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'profile-share/qr',
              parentNavigatorKey:
                  ProfileShareQrDisplayRoute.$parentNavigatorKey,
              factory: $ProfileShareQrDisplayRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'profile-share/scan',
              parentNavigatorKey: ProfileShareQrScanRoute.$parentNavigatorKey,
              factory: $ProfileShareQrScanRoute._fromState,
            ),
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
            GoRouteData.$route(
              path: 'admin',
              parentNavigatorKey: AdminRoute.$parentNavigatorKey,
              factory: $AdminRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'users',
                  parentNavigatorKey: AdminUserListRoute.$parentNavigatorKey,
                  factory: $AdminUserListRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: ':userId',
                      parentNavigatorKey:
                          AdminUserDetailRoute.$parentNavigatorKey,
                      factory: $AdminUserDetailRoute._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'tickets',
                  parentNavigatorKey: AdminTicketListRoute.$parentNavigatorKey,
                  factory: $AdminTicketListRoute._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: ':ticketId',
                      parentNavigatorKey:
                          AdminTicketDetailRoute.$parentNavigatorKey,
                      factory: $AdminTicketDetailRoute._fromState,
                    ),
                  ],
                ),
                GoRouteData.$route(
                  path: 'ticket-scan',
                  parentNavigatorKey:
                      AdminTicketQrScanRoute.$parentNavigatorKey,
                  factory: $AdminTicketQrScanRoute._fromState,
                ),
              ],
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

mixin $TicketRoute on GoRouteData {
  static TicketRoute _fromState(GoRouterState state) => const TicketRoute();

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

mixin $TicketDetailRoute on GoRouteData {
  static TicketDetailRoute _fromState(GoRouterState state) =>
      TicketDetailRoute(ticketId: state.pathParameters['ticketId']!);

  TicketDetailRoute get _self => this as TicketDetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/tickets/${Uri.encodeComponent(_self.ticketId)}');

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

mixin $AccountInfoRoute on GoRouteData {
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

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/account/login');

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

mixin $ProfileEditRoute on GoRouteData {
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

mixin $WithdrawalRoute on GoRouteData {
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

mixin $ProfileShareListRoute on GoRouteData {
  static ProfileShareListRoute _fromState(GoRouterState state) =>
      const ProfileShareListRoute();

  @override
  String get location => GoRouteData.$location('/account/profile-share');

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

mixin $ProfileShareQrDisplayRoute on GoRouteData {
  static ProfileShareQrDisplayRoute _fromState(GoRouterState state) =>
      const ProfileShareQrDisplayRoute();

  @override
  String get location => GoRouteData.$location('/account/profile-share/qr');

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

mixin $ProfileShareQrScanRoute on GoRouteData {
  static ProfileShareQrScanRoute _fromState(GoRouterState state) =>
      const ProfileShareQrScanRoute();

  @override
  String get location => GoRouteData.$location('/account/profile-share/scan');

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
  String get location => GoRouteData.$location('/account/staff-members');

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
  String get location => GoRouteData.$location('/account/licenses');

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
    '/account/licenses/${Uri.encodeComponent(_self.package)}',
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

mixin $AdminRoute on GoRouteData {
  static AdminRoute _fromState(GoRouterState state) => const AdminRoute();

  @override
  String get location => GoRouteData.$location('/account/admin');

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

mixin $AdminUserListRoute on GoRouteData {
  static AdminUserListRoute _fromState(GoRouterState state) =>
      const AdminUserListRoute();

  @override
  String get location => GoRouteData.$location('/account/admin/users');

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

mixin $AdminUserDetailRoute on GoRouteData {
  static AdminUserDetailRoute _fromState(GoRouterState state) =>
      AdminUserDetailRoute(userId: state.pathParameters['userId']!);

  AdminUserDetailRoute get _self => this as AdminUserDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/account/admin/users/${Uri.encodeComponent(_self.userId)}',
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

mixin $AdminTicketListRoute on GoRouteData {
  static AdminTicketListRoute _fromState(GoRouterState state) =>
      const AdminTicketListRoute();

  @override
  String get location => GoRouteData.$location('/account/admin/tickets');

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

mixin $AdminTicketDetailRoute on GoRouteData {
  static AdminTicketDetailRoute _fromState(GoRouterState state) =>
      AdminTicketDetailRoute(ticketId: state.pathParameters['ticketId']!);

  AdminTicketDetailRoute get _self => this as AdminTicketDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/account/admin/tickets/${Uri.encodeComponent(_self.ticketId)}',
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

mixin $AdminTicketQrScanRoute on GoRouteData {
  static AdminTicketQrScanRoute _fromState(GoRouterState state) =>
      const AdminTicketQrScanRoute();

  @override
  String get location => GoRouteData.$location('/account/admin/ticket-scan');

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

String _$routerHash() => r'0cbd9173dbd35cd49b3a8034316786c3d4258b1d';
