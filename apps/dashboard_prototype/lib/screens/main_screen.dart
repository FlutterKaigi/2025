import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/ui/main/responsive_scaffold.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      currentIndex: navigationShell.currentIndex,
      destinations: const [
        ResponsiveScaffoldDestination(icon: Icons.event, title: 'イベント'),
        ResponsiveScaffoldDestination(icon: Icons.business, title: 'スポンサー'),
        ResponsiveScaffoldDestination(icon: Icons.person, title: 'アカウント'),
      ],
      onNavigationIndexChange: (index) async {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      },
      body: navigationShell,
    );
  }
}