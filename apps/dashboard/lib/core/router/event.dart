part of 'router.dart';

class EventBranch extends StatefulShellBranchData {}

class EventInfoRoute extends GoRouteData {
  const EventInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const EventInfoScreen();
}
