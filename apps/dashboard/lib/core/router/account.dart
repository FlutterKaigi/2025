part of 'router.dart';

const _accountRoutes = [
  TypedGoRoute<AccountInfoRoute>(
    path: '/account',
    routes: [
      TypedGoRoute<ProfileEditRoute>(
        path: 'profile-edit',
      ),
      TypedGoRoute<WithdrawalRoute>(
        path: 'withdrawal',
      ),
    ],
  ),
];

class AccountBranch extends StatefulShellBranchData {}

class AccountInfoRoute extends GoRouteData {
  const AccountInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AccountInfoScreen();
}

class ProfileEditRoute extends GoRouteData {
  const ProfileEditRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileEditScreen();
}

class WithdrawalRoute extends GoRouteData {
  const WithdrawalRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WithdrawalScreen();
}
