part of 'router.dart';

const _ticketRoutes = [
  TypedGoRoute<TicketRoute>(
    path: '/tickets',
  ),
];

// ignore: avoid_classes_with_only_static_members
class TicketBranch extends StatefulShellBranchData {
  static final List<NavigatorObserver> $observers = [
    TalkerRouteObserver(talker),
  ];
}

class TicketRoute extends GoRouteData with $TicketRoute {
  const TicketRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TicketListScreen();
}
