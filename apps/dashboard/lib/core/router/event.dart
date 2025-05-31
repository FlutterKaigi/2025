part of 'router.dart';

const _eventRoutes = [
  TypedGoRoute<EventInfoRoute>(path: '/event'),
];

class EventBranch extends StatefulShellBranchData {}

class EventInfoRoute extends GoRouteData {
  const EventInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const EventInfoScreen();
}
