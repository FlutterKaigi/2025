part of 'router.dart';

const _sponsorRoutes = [
  TypedGoRoute<SponsorListRoute>(path: '/sponsors'),
];

class SponsorBranch extends StatefulShellBranchData {}

class SponsorListRoute extends GoRouteData {
  const SponsorListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SponsorListScreen();
}
