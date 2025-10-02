part of 'router.dart';

const _sessionRoutes = <TypedRoute<RouteData>>[
  TypedGoRoute<SessionTimelineRoute>(
    path: '/sessions',
    routes: [
      TypedGoRoute<BookmarkedSessionsRoute>(
        path: 'bookmarked',
      ),
      TypedGoRoute<SessionDetailRoute>(
        path: ':sessionId',
      ),
    ],
  ),
];

class SessionBranch extends StatefulShellBranchData {
  const SessionBranch();
}

class SessionTimelineRoute extends GoRouteData with $SessionTimelineRoute {
  const SessionTimelineRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SessionTimelineScreen();
  }
}

class SessionDetailRoute extends GoRouteData with $SessionDetailRoute {
  const SessionDetailRoute({required this.sessionId});

  final String sessionId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SessionScreen(sessionId: sessionId);
  }
}

class BookmarkedSessionsRoute extends GoRouteData
    with $BookmarkedSessionsRoute {
  const BookmarkedSessionsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BookmarkedSessionsScreen();
  }
}
