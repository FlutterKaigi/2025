part of 'router.dart';

class AccountBranch extends StatefulShellBranchData {}

class AccountInfoRoute extends GoRouteData {
  const AccountInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AccountInfoScreen();
}
