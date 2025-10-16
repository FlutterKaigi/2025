part of 'router.dart';

const _ticketRoutes = [
  TypedGoRoute<TicketRoute>(
    path: '/tickets',
    routes: [
      TypedGoRoute<TicketDetailRoute>(
        path: ':ticketId',
      ),
    ],
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


class TicketDetailRoute extends GoRouteData with $TicketDetailRoute {
  const TicketDetailRoute({required this.ticketId});

  final String ticketId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      TicketDetailScreen(ticketId: ticketId);
}
