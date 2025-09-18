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

// ignore: avoid_classes_with_only_static_members
class AccountBranch extends StatefulShellBranchData {
  static final List<NavigatorObserver> $observers = [
    TalkerRouteObserver(talker),
  ];
}

class AccountInfoRoute extends GoRouteData with $AccountInfoRoute {
  const AccountInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AccountInfoScreen(
      onProfileEdit: () => const ProfileEditRoute().go(context),
      onTapCodeOfConductTile: () => _openUrl(
        urlString: Translations.of(context).account.codeOfConductUrl,
      ),
      onTapPrivacyPolicyTile: () => _openUrl(
        urlString: Translations.of(context).account.privacyPolicyUrl,
      ),
      onTapContactTile: () => _openUrl(
        urlString: Translations.of(context).account.contactUrl,
      ),
      onTapOssLicensesTile: () => showLicensePage(
        context: context,
        applicationName: Translations.of(context).app.name,
      ),
    );
  }

  // MEMO: util とかで MIXIN とかにしてもいいかもしれない
  Future<void> _openUrl({required String urlString}) async {
    final uri = Uri.tryParse(urlString);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch $urlString');
    }
  }
}

class ProfileEditRoute extends GoRouteData with $ProfileEditRoute {
  const ProfileEditRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileEditScreen();
}

class WithdrawalRoute extends GoRouteData with $WithdrawalRoute {
  const WithdrawalRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WithdrawalScreen();
}
