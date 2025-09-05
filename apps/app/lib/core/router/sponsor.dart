part of 'router.dart';

const _sponsorRoutes = [
  TypedGoRoute<SponsorListRoute>(
    path: '/sponsors',
    routes: [
      TypedGoRoute<SponsorDetailRoute>(
        path: ':slug',
      ),
    ],
  ),
];

// ignore: avoid_classes_with_only_static_members
class SponsorBranch extends StatefulShellBranchData {
  static final List<NavigatorObserver> $observers = [
    TalkerRouteObserver(talker),
  ];
}

class SponsorListRoute extends GoRouteData with $SponsorListRoute {
  const SponsorListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SponsorListScreen();
}

class SponsorDetailRoute extends GoRouteData with $SponsorDetailRoute {
  const SponsorDetailRoute({required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SponsorDetailScreen(slug: slug);
}
