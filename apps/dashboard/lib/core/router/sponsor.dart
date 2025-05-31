part of 'router.dart';

class SponsorBranch extends StatefulShellBranchData {}

class SponsorListRoute extends GoRouteData {
  const SponsorListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SponsorListScreen();
}
