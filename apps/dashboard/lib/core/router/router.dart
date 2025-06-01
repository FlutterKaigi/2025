import 'package:dashboard/core/ui/main/main_screen.dart';
import 'package:dashboard/features/account/ui/account_info_screen.dart';
import 'package:dashboard/features/account/ui/profile_edit_screen.dart';
import 'package:dashboard/features/account/ui/withdrawal_screen.dart';
import 'package:dashboard/features/auth/data/notifier/auth_notifier.dart';
import 'package:dashboard/features/auth/ui/login_screen.dart';
import 'package:dashboard/features/event/ui/event_info_screen.dart';
import 'package:dashboard/features/news/ui/news_screen.dart';
import 'package:dashboard/features/sponsor/ui/sponsor_detail_screen.dart';
import 'package:dashboard/features/sponsor/ui/sponsor_edit_screen.dart';
import 'package:dashboard/features/sponsor/ui/sponsor_list_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account.dart';
part 'event.dart';
part 'router.g.dart';
part 'sponsor.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final isAuthorizedNotifier = ValueNotifier<bool>(
    ref.read(authNotifierProvider.select((v) => v.value != null)),
  );
  ref
    ..listen(authNotifierProvider, (_, __) {
      isAuthorizedNotifier.value = ref.read(
        authNotifierProvider.select((v) => v.value != null),
      );
    })
    ..onDispose(isAuthorizedNotifier.dispose);

  return GoRouter(
    routes: $appRoutes,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: isAuthorizedNotifier,
    initialLocation: const EventInfoRoute().location,
    redirect: (context, state) {
      final isAuthorized = isAuthorizedNotifier.value;
      if (!isAuthorized && state.fullPath != const LoginRoute().location) {
        return const LoginRoute().location;
      }
      if (isAuthorized && state.fullPath == const LoginRoute().location) {
        return const EventInfoRoute().location;
      }
      return null;
    },
  );
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

@TypedStatefulShellRoute<MainRoute>(
  branches: [
    TypedStatefulShellBranch<EventBranch>(routes: _eventRoutes),
    TypedStatefulShellBranch<SponsorBranch>(routes: _sponsorRoutes),
    TypedStatefulShellBranch<AccountBranch>(routes: _accountRoutes),
  ],
)
class MainRoute extends StatefulShellRouteData {
  const MainRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainScreen(navigationShell: navigationShell);
  }
}
