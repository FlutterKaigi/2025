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

// ignore: avoid_classes_with_only_static_members
class EventBranch extends StatefulShellBranchData with _$EventBranch {
  static final List<NavigatorObserver> $observers = [
    TalkerRouteObserver(talker),
  ];
}

class EventInfoRoute extends GoRouteData with _$EventInfoRoute {
  const EventInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const EventInfoScreen();
}

class NewsRoute extends GoRouteData with _$NewsRoute {
  const NewsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const NewsScreen();
}
