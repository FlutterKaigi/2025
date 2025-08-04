part of 'router.dart';

const _ticketRoutes = [
  TypedGoRoute<TicketListRoute>(
    path: '/tickets',
    routes: [
      TypedGoRoute<TicketDetailRoute>(
        path: ':ticketTypeId',
      ),
      TypedGoRoute<OwnedTicketsRoute>(
        path: 'owned',
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

class TicketListRoute extends GoRouteData {
  const TicketListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TicketListScreen();
}

class TicketDetailRoute extends GoRouteData {
  const TicketDetailRoute({required this.ticketTypeId});

  final String ticketTypeId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      TicketDetailScreen(ticketTypeId: ticketTypeId);
}

class OwnedTicketsRoute extends GoRouteData {
  const OwnedTicketsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OwnedTicketsScreen();
}