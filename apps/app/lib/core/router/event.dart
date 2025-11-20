part of 'router.dart';

const _eventRoutes = [
  TypedGoRoute<EventInfoRoute>(
    path: '/event',
    routes: [
      TypedGoRoute<NewsRoute>(
        path: 'news',
      ),
      TypedGoRoute<StaffMemberListRoute>(
        path: 'staff-members',
      ),
      TypedGoRoute<LicenseRoute>(
        path: 'licenses',
        routes: [
          TypedGoRoute<LicenseDetailRoute>(
            path: ':package',
          ),
        ],
      ),
    ],
  ),
];

// ignore: avoid_classes_with_only_static_members
class EventBranch extends StatefulShellBranchData {
  static final List<NavigatorObserver> $observers = [
    TalkerRouteObserver(talker),
  ];
}

class EventInfoRoute extends GoRouteData with $EventInfoRoute {
  const EventInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const EventInfoScreen();
}

class NewsRoute extends GoRouteData with $NewsRoute {
  const NewsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const NewsScreen();
}
