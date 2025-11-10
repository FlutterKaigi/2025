part of 'router.dart';

const _accountRoutes = [
  TypedGoRoute<AccountInfoRoute>(
    path: '/account',
    routes: [
      TypedGoRoute<LoginRoute>(
        path: 'login',
      ),
      TypedGoRoute<ProfileEditRoute>(
        path: 'profile-edit',
      ),
      TypedGoRoute<WithdrawalRoute>(
        path: 'withdrawal',
      ),
      TypedGoRoute<ProfileShareListRoute>(
        path: 'profile-share',
      ),
      TypedGoRoute<ProfileShareQrDisplayRoute>(
        path: 'profile-share/qr',
      ),
      TypedGoRoute<ProfileShareQrScanRoute>(
        path: 'profile-share/scan',
      ),
      TypedGoRoute<StaffMemberListRoute>(
        path: 'staff-members',
      ),
      TypedGoRoute<LicenseRoute>(
        path: 'licenses',
        routes: [
          TypedGoRoute<LicenseDetailRoute>(
            path: ':package',
          ),
        ],
      ),
      TypedGoRoute<AdminRoute>(
        path: 'admin',
        routes: [
          TypedGoRoute<AdminUserListRoute>(
            path: 'users',
            routes: [
              TypedGoRoute<AdminUserDetailRoute>(
                path: ':userId',
              ),
            ],
          ),
        ],
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
    return Consumer(
      builder: (context, ref, child) {
        final hasProfile = ref.watch(
          profileProvider.select((v) => v.value != null),
        );

        Future<T?> guard<T>(FutureOr<T> Function() fn) async {
          if (!hasProfile) {
            final moveToProfileEdit = await ProfileRequiredSheet.show(
              context: context,
              onCreateProfile: () {
                const ProfileEditRoute().go(context);
              },
            );
            if (!context.mounted) {
              return null;
            }
            if (moveToProfileEdit ?? false) {
              const ProfileEditRoute().go(context);
            } else {
              return null;
            }
          }
          return fn();
        }

        return AccountInfoScreen(
          onProfileEdit: () => const ProfileEditRoute().go(context),
          onTapQrCode: () =>
              guard(() => const ProfileShareQrDisplayRoute().go(context)),
          onTapQrCodeScan: () =>
              guard(() => const ProfileShareQrScanRoute().go(context)),
          onTapFriendsList: () =>
              guard(() => const ProfileShareListRoute().go(context)),
          onTapCodeOfConductTile: () => _openUrl(
            urlString: Translations.of(context).account.codeOfConductUrl,
          ),
          onTapPrivacyPolicyTile: () => _openUrl(
            urlString: Translations.of(context).account.privacyPolicyUrl,
          ),
          onTapContactTile: () => _openUrl(
            urlString: Translations.of(context).account.contactUrl,
          ),
          onTapOssLicensesTile: () => const LicenseRoute().go(context),
          onTapWithdrawalTile: () => _openWithdrawalForm(context),
          onTapStaffMembers: () => const StaffMemberListRoute().go(context),
          onTapAdminPage: () => const AdminRoute().go(context),
        );
      },
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

  Future<void> _openWithdrawalForm(BuildContext context) async {
    final container = ProviderScope.containerOf(context);
    final environment = container.read(environmentProvider);
    await _openUrl(urlString: environment.withdrawalFormUrl);
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

class ProfileShareListRoute extends GoRouteData with $ProfileShareListRoute {
  const ProfileShareListRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileShareListScreen();
}

class ProfileShareQrDisplayRoute extends GoRouteData
    with $ProfileShareQrDisplayRoute {
  const ProfileShareQrDisplayRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const QrCodeDisplayScreen();
}

class ProfileShareQrScanRoute extends GoRouteData
    with $ProfileShareQrScanRoute {
  const ProfileShareQrScanRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const QrCodeScanScreen();
}

class StaffMemberListRoute extends GoRouteData with $StaffMemberListRoute {
  const StaffMemberListRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StaffMemberListScreen();
}

class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

class LicenseRoute extends GoRouteData with $LicenseRoute {
  const LicenseRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LicenseScreen();
}

class LicenseDetailRoute extends GoRouteData with $LicenseDetailRoute {
  const LicenseDetailRoute({required this.package});

  final String package;

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      LicenseDetailScreen(package: package);
}

class AdminRoute extends GoRouteData with $AdminRoute {
  const AdminRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(
      builder: (context, ref, child) {
        final userAsync = ref.watch(userProvider);
        final isAdmin = userAsync.maybeWhen(
          data: (userAndRoles) => userAndRoles.roles.contains(Role.admin),
          orElse: () => false,
        );

        if (!isAdmin) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              const AccountInfoRoute().go(context);
            }
          });
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }

        return const AdminScreen();
      },
    );
  }
}

class AdminUserListRoute extends GoRouteData with $AdminUserListRoute {
  const AdminUserListRoute();

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(
      builder: (context, ref, child) {
        final userAsync = ref.watch(userProvider);
        final isAdmin = userAsync.maybeWhen(
          data: (userAndRoles) => userAndRoles.roles.contains(Role.admin),
          orElse: () => false,
        );

        if (!isAdmin) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              const AccountInfoRoute().go(context);
            }
          });
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }

        return const AdminUserListScreen();
      },
    );
  }
}

class AdminUserDetailRoute extends GoRouteData with $AdminUserDetailRoute {
  const AdminUserDetailRoute({required this.userId});

  final String userId;

  static final GlobalKey<NavigatorState> $parentNavigatorKey =
      _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(
      builder: (context, ref, child) {
        final userAsync = ref.watch(userProvider);
        final isAdmin = userAsync.maybeWhen(
          data: (userAndRoles) => userAndRoles.roles.contains(Role.admin),
          orElse: () => false,
        );

        if (!isAdmin) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              const AccountInfoRoute().go(context);
            }
          });
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }

        return AdminUserDetailScreen(userId: userId);
      },
    );
  }
}
