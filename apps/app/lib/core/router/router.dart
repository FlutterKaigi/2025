import 'dart:async';

import 'package:app/core/debug/debug_screen.dart';
import 'package:app/core/debug/talker.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/provider/environment.dart';
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
  final isGoogleSessionExpiredNotifier = ValueNotifier<bool>(false);

  ref
    ..listen(authNotifierProvider, (_, __) {
      isAuthorizedNotifier.value = ref.read(
        authNotifierProvider.select((v) => v.value != null),
      );
      // Googleセッション切れチェック
      isGoogleSessionExpiredNotifier.value = ref
          .read(authNotifierProvider.notifier)
          .isGoogleSessionExpired();
    })
    ..onDispose(() {
      isAuthorizedNotifier.dispose();
      isGoogleSessionExpiredNotifier.dispose();
    });

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    observers: _rootObservers,
    routes: [
      $loginRoute,
      StatefulShellRouteData.$route(
        factory: $MainRouteExtension._fromState,
        branches: ($mainRoute as StatefulShellRoute).branches
            .whereNot(
              (branch) => branch.defaultRoute?.path == '/sponsors',
            )
            .toList(),
      ),
      if (kDebugMode) $debugRoute,
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
    debugLogDiagnostics: kDebugMode,
    refreshListenable: isAuthorizedNotifier,
    initialLocation: const EventInfoRoute().location,
    redirect: (context, state) {
      final isAuthorized = isAuthorizedNotifier.value;
      final isGoogleSessionExpired = isGoogleSessionExpiredNotifier.value;

      // Googleセッション切れの場合のみログイン画面へ
      if (isGoogleSessionExpired &&
          state.fullPath != const LoginRoute().location) {
        // セッション切れメッセージを表示するためのパラメータ付きでリダイレクト
        return Uri(
          path: const LoginRoute().location,
          queryParameters: {'session_expired': 'true'},
        ).toString();
      }

      // 未認証でログイン画面以外にいる場合はログイン画面へ
      if (!isAuthorized && state.fullPath != const LoginRoute().location) {
        return const LoginRoute().location;
      }

      final queryParameters = state.uri.queryParameters;

      // ゲストユーザーが Google アカウントと紐づけられている場合エラーメッセージを表示
      // ログインコールバックより先にチェック
      if (queryParameters['error_code'] == 'identity_already_exists') {
        // エラーメッセージを表示してからゲストユーザーをログアウト
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (context.mounted) {
            // ログアウト完了後、AuthNotifierの監視により自動的にログイン画面へ遷移
            await ref.read(authNotifierProvider.notifier).signOut();
          }
        });
        // ログイン画面へ遷移し、エラーメッセージを表示
        return Uri(
          path: const LoginRoute().location,
          queryParameters: {'identity_already_exists': 'true'},
        ).toString();
      }

      // 既にログイン済み（ゲストまたはGoogle）でログイン画面にいる場合はイベント画面へ
      // ただし、identity_already_existsエラー表示中は除外
      if (isAuthorized &&
          !isGoogleSessionExpired &&
          queryParameters['identity_already_exists'] != 'true' &&
          (state.fullPath?.startsWith(const LoginRoute().location) ?? false)) {
        return const EventInfoRoute().location;
      }

      // ログインコールバック
      if (state.uri.host == 'login-callback' ||
          (kIsWeb && queryParameters.containsKey('code'))) {
        // OAuth認証後のコールバック処理
        // セッションを更新してGoogleユーザー情報を取得
        unawaited(
          ref.read(authServiceProvider).refreshSession(),
        );
        return const AccountInfoRoute().location;
      }
      return null;
    },
  );
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
