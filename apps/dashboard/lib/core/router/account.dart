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

class AccountInfoRoute extends GoRouteData {
  const AccountInfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final isJapanese = Localizations.localeOf(context).languageCode == 'ja';

    return AccountInfoScreen(
      onProfileEdit: () => const ProfileEditRoute().go(context),
      onTapCodeOfConductTile: () => _openUrl(
        urlString: isJapanese
            ? 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja'
            : 'https://docs.flutterkaigi.jp/Code-of-Conduct',
      ),
      onTapPrivacyPolicyTile: () => _openUrl(
        urlString: isJapanese
            ? 'https://docs.flutterkaigi.jp/Privacy-Policy.ja'
            : 'https://docs.flutterkaigi.jp/Privacy-Policy',
      ),
      onTapContactTile: () => _openUrl(
        urlString:
            'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform',
      ),
      onTapOssLicensesTile: () => showLicensePage(context: context),
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

class ProfileEditRoute extends GoRouteData {
  const ProfileEditRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileEditScreen();
}

class WithdrawalRoute extends GoRouteData {
  const WithdrawalRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WithdrawalScreen();
}
