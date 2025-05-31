part of 'router.dart';

const _eventRoutes = [
  TypedGoRoute<EventInfoRoute>(
    path: '/event',
    routes: [
      TypedGoRoute<NewsRoute>(
        path: 'news',
      ),
    ],
  ),
];

class EventBranch extends StatefulShellBranchData {}

class EventInfoRoute extends GoRouteData {
  const EventInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const EventInfoScreen();
}

class NewsRoute extends GoRouteData {
  const NewsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const NewsScreen();
}
