import 'package:dashboard/core/debug/debug_overlay.dart';
import 'package:dashboard/core/ui/main/responsive_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// メイン画面
///
/// 主な役割:
/// - アプリの主要なタブ画面（イベント・スポンサー・アカウント）を統括する
/// - 各タブへのナビゲーションを提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class MainScreen extends StatelessWidget {
  const MainScreen({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final content = ResponsiveScaffold(
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

    if (kDebugMode) {
      return DebugOverlay(child: content);
    }

    return content;
  }
}
