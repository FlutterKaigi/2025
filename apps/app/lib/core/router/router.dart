import 'dart:async';

import 'package:app/core/debug/debug_screen.dart';
import 'package:app/core/debug/talker.dart';
import 'package:app/core/ui/main/main_screen.dart';
import 'package:app/core/ui/main/not_found_screen.dart';
import 'package:app/features/event/ui/event_info_screen.dart';
import 'package:app/features/licenses/ui/license_detail_screen.dart';
import 'package:app/features/licenses/ui/license_screen.dart';
import 'package:app/features/news/ui/news_screen.dart';
import 'package:app/features/session/ui/bookmarked_sessions_screen.dart';
import 'package:app/features/session/ui/session_screen.dart';
import 'package:app/features/session/ui/session_timeline_screen.dart';
import 'package:app/features/sponsor/ui/sponsor_detail_screen.dart';
import 'package:app/features/sponsor/ui/sponsor_list_screen.dart';
import 'package:app/features/staff_member/ui/staff_member_list_screen.dart';
import 'package:app/features/venue/ui/venue_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'event.dart';
part 'router.g.dart';
part 'session.dart';
part 'sponsor.dart';
part 'venue.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _rootObservers = [
  TalkerRouteObserver(talker),
];

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    observers: _rootObservers,
    routes: [
      $mainRoute,
      if (kDebugMode) $debugRoute,
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
    debugLogDiagnostics: kDebugMode,
    initialLocation: const EventInfoRoute().location,
  );
}

@TypedStatefulShellRoute<MainRoute>(
  branches: [
    TypedStatefulShellBranch<EventBranch>(routes: _eventRoutes),
    TypedStatefulShellBranch<SessionBranch>(routes: _sessionRoutes),
    TypedStatefulShellBranch<VenueBranch>(routes: _venueRoutes),
    TypedStatefulShellBranch<SponsorBranch>(routes: _sponsorRoutes),
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
