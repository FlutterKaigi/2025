part of 'router.dart';

const _ticketRoutes = [
  TypedGoRoute<TicketRoute>(
    path: '/tickets',
    routes: [
      TypedGoRoute<AvailableTicketListRoute>(
        path: 'available',
      ),
      TypedGoRoute<ActiveCheckoutRoute>(
        path: 'active/:checkoutId',
      ),
      TypedGoRoute<TicketListRoute>(
        path: 'list',
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
      const TicketScreen();
}

class AvailableTicketListRoute extends GoRouteData
    with $AvailableTicketListRoute {
  const AvailableTicketListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AvailableTicketListScreen();
}

class ActiveCheckoutRoute extends GoRouteData with $ActiveCheckoutRoute {
  const ActiveCheckoutRoute({required this.checkoutId});

  final String checkoutId;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ActiveCheckoutScreen(checkoutId: checkoutId);
}

class TicketListRoute extends GoRouteData with $TicketListRoute {
  const TicketListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TicketListScreen();
}
