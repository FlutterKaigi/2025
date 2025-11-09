part of 'router.dart';

const _venueRoutes = [
  TypedGoRoute<VenueRoute>(
    path: '/venue',
  ),
];

// ignore: avoid_classes_with_only_static_members
class VenueBranch extends StatefulShellBranchData {
  static final List<NavigatorObserver> $observers = [
    TalkerRouteObserver(talker),
  ];
}

class VenueRoute extends GoRouteData with $VenueRoute {
  const VenueRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const VenueScreen();
}
