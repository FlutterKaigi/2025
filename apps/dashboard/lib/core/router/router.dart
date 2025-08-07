import 'dart:async';

import 'package:dashboard/core/debug/debug_screen.dart';
import 'package:dashboard/core/debug/talker.dart';
import 'package:dashboard/core/gen/l10n/l10n.dart';
import 'package:dashboard/core/ui/main/main_screen.dart';
import 'package:dashboard/features/account/ui/info/account_info_screen.dart';
import 'package:dashboard/features/account/ui/profile_edit_screen.dart';
import 'package:dashboard/features/account/ui/withdrawal_screen.dart';
import 'package:dashboard/features/auth/data/notifier/auth_notifier.dart';
import 'package:dashboard/features/auth/data/provider/auth_service.dart';
import 'package:dashboard/features/auth/ui/login_screen.dart';
import 'package:dashboard/features/event/ui/event_info_screen.dart';
import 'package:dashboard/features/news/ui/news_screen.dart';
import 'package:dashboard/features/sponsor/ui/sponsor_detail_screen.dart';
import 'package:dashboard/features/sponsor/ui/sponsor_edit_screen.dart';
import 'package:dashboard/features/sponsor/ui/sponsor_list_screen.dart';
import 'package:dashboard/features/ticket/ui/owned_tickets_screen.dart';
import 'package:dashboard/features/ticket/ui/ticket_detail_screen.dart';
import 'package:dashboard/features/ticket/ui/ticket_list_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

part 'account.dart';
part 'event.dart';
part 'router.g.dart';
part 'sponsor.dart';
part 'ticket.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _rootObservers = [
  TalkerRouteObserver(talker),
];

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
    navigatorKey: _rootNavigatorKey,
    observers: _rootObservers,
    routes: [
      $loginRoute,
      $mainRoute,
      if (kDebugMode) $debugRoute,
    ],
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
      if (isAuthorized && state.uri.host == 'login-callback') {
        // エラーパラメータをチェック
        final errorCode = state.uri.queryParameters['error_code'];
        if (errorCode == 'identity_already_exists') {
          // エラーメッセージを表示
          unawaited(_handleIdentityAlreadyExistsError(context, ref));
        } else {
          unawaited(
            ref.read(authServiceProvider).refreshSession(),
          );
        }
        return const AccountInfoRoute().location;
      }
      return null;
    },
  );
}

/// Googleアカウントが既に別のユーザーと紐づけられている場合エラートーストを表示する
Future<void> _handleIdentityAlreadyExistsError(
  BuildContext context,
  Ref ref,
) async {
  // エラーメッセージを表示
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(L10n.of(context).authErrorIdentityAlreadyExists),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
      ),
    );
  }
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
    TypedStatefulShellBranch<TicketBranch>(routes: _ticketRoutes),
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

@TypedGoRoute<DebugRoute>(
  path: '/debug',
  routes: [
    TypedGoRoute<TalkerRoute>(
      path: 'talker',
    ),
  ],
)
class DebugRoute extends GoRouteData {
  const DebugRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DebugScreen();
  }
}

class TalkerRoute extends GoRouteData {
  const TalkerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TalkerScreen(talker: talker);
  }
}
