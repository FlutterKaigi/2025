import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/login_screen.dart';
import '../screens/main_screen.dart';
import '../screens/event_info_screen.dart';
import '../screens/news_screen.dart';
import '../screens/sponsor_list_screen.dart';
import '../screens/sponsor_detail_screen.dart';
import '../screens/sponsor_edit_screen.dart';
import '../screens/account_info_screen.dart';
import '../screens/profile_edit_screen.dart';
import '../screens/withdrawal_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/event',
              builder: (context, state) => const EventInfoScreen(),
              routes: [
                GoRoute(
                  path: 'news',
                  builder: (context, state) => const NewsScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/sponsors',
              builder: (context, state) => const SponsorListScreen(),
              routes: [
                GoRoute(
                  path: ':slug',
                  builder: (context, state) => SponsorDetailScreen(
                    slug: state.pathParameters['slug']!,
                  ),
                  routes: [
                    GoRoute(
                      path: 'edit',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (context, state) => SponsorEditScreen(
                        slug: state.pathParameters['slug']!,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/account',
              builder: (context, state) => const AccountInfoScreen(),
              routes: [
                GoRoute(
                  path: 'profile-edit',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const ProfileEditScreen(),
                ),
                GoRoute(
                  path: 'withdrawal',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const WithdrawalScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);