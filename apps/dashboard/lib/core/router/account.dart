part of 'router.dart';

const _accountRoutes = [
  TypedGoRoute<AccountInfoRoute>(path: '/account'),
];

class AccountBranch extends StatefulShellBranchData {}

class AccountInfoRoute extends GoRouteData {
  const AccountInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AccountInfoScreen();
}
