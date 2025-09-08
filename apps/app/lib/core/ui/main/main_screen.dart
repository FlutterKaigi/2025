import 'package:app/core/debug/debug_overlay.dart';
import 'package:app/core/ui/main/responsive_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// メイン画面
///
/// 主な役割:
/// - アプリの主要なタブ画面（イベント・スポンサー・チケット・アカウント）を統括する
/// - 各タブへのナビゲーションを提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/app/SCREENS.md)
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
        // TODO: スポンサーの表示修正完了後に復活予定
        // ResponsiveScaffoldDestination(icon: Icons.business, title: 'スポンサー'),
        ResponsiveScaffoldDestination(
          icon: Icons.confirmation_number,
          title: 'チケット',
        ),
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
