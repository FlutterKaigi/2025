import 'dart:async';

import 'package:app/core/debug/debug_screen.dart';
import 'package:app/core/debug/talker.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/ui/main/main_screen.dart';
import 'package:app/core/ui/main/not_found_screen.dart';
import 'package:app/features/account/ui/info/account_info_screen.dart';
import 'package:app/features/account/ui/profile_edit_screen.dart';
import 'package:app/features/account/ui/withdrawal_screen.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:app/features/auth/data/provider/auth_service.dart';
import 'package:app/features/auth/ui/login_screen.dart';
import 'package:app/features/event/ui/event_info_screen.dart';
import 'package:app/features/news/ui/news_screen.dart';
import 'package:app/features/sponsor/ui/sponsor_detail_screen.dart';
import 'package:app/features/sponsor/ui/sponsor_list_screen.dart';
import 'package:app/features/ticket/ui/components/available_ticket_list_screen.dart';
import 'package:app/features/ticket/ui/components/ticket_list_screen.dart';
import 'package:app/features/ticket/ui/ticket_screen.dart';
import 'package:collection/collection.dart';
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
    errorBuilder: (context, state) => const NotFoundScreen(),
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

      // ログインコールバック
      final queryParameters = state.uri.queryParameters;
      if (isAuthorized &&
          (state.uri.host == 'login-callback' ||
              (kIsWeb && queryParameters.containsKey('code')))) {
        unawaited(
          ref.read(authServiceProvider).refreshSession(),
        );
        return const AccountInfoRoute().location;
      }

      // ゲストユーザーが Google アカウントと紐づけられている場合エラーメッセージを表示
      if (isAuthorized &&
          queryParameters['error_code'] == 'identity_already_exists') {
        unawaited(_handleIdentityAlreadyExistsError(context));
        return const AccountInfoRoute().location;
      }
      return null;
    },
  );
}

/// Googleアカウントが既に別のユーザーと紐づけられている場合エラートーストを表示する
Future<void> _handleIdentityAlreadyExistsError(
  BuildContext context,
) async {
  // 現在のフレームの描画が完了した後に SnackBar を表示
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            Translations.of(context).auth.error.identityAlreadyExists,
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  });
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
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
    TypedStatefulShellBranch<AccountBranch>(
      routes: _accountRoutes,
    ),
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
class DebugRoute extends GoRouteData with $DebugRoute {
  const DebugRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DebugScreen();
  }
}

class TalkerRoute extends GoRouteData with $TalkerRoute {
  const TalkerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TalkerScreen(talker: talker);
  }
}
