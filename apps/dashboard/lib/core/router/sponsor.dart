part of 'router.dart';

const _sponsorRoutes = [
  TypedGoRoute<SponsorListRoute>(
    path: '/sponsors',
    routes: [
      TypedGoRoute<SponsorDetailRoute>(
        path: ':slug',
        routes: [
          TypedGoRoute<SponsorEditRoute>(
            path: 'edit',
          ),
        ],
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

class SponsorEditRoute extends GoRouteData with $SponsorEditRoute {
  const SponsorEditRoute({required this.slug});

  final String slug;

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SponsorEditScreen(slug: slug);
}
