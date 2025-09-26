import 'package:app/core/debug/debug_overlay.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/ui/main/responsive_scaffold.dart';
import 'package:app/features/force_update/force_update_dialog_listener.dart';
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
    final t = Translations.of(context);
    final content = ForceUpdateDialogListener(
      child: ResponsiveScaffold(
        currentIndex: navigationShell.currentIndex,
        destinations: [
          ResponsiveScaffoldDestination(
            icon: Icons.event,
            title: t.common.navigation.event,
          ),
          ResponsiveScaffoldDestination(
            icon: Icons.calendar_month,
            title: t.common.navigation.session,
          ),
          // TODO: スポンサーの表示修正完了後に復活予定
          // ResponsiveScaffoldDestination(
          //   icon: Icons.business,
          //   title: t.common.navigation.sponsor,
          // ),
          ResponsiveScaffoldDestination(
            icon: Icons.confirmation_number,
            title: t.common.navigation.ticket,
          ),
          ResponsiveScaffoldDestination(
            icon: Icons.person,
            title: t.common.navigation.account,
          ),
        ],
        onNavigationIndexChange: (index) async {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        body: navigationShell,
      ),
    );

    if (kDebugMode) {
      return DebugOverlay(child: content);
    }

    return content;
  }
}
