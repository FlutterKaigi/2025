import 'dart:async';

import 'package:app/core/designsystem/theme/theme.dart';
import 'package:app/core/gen/l10n/l10n.dart';
import 'package:app/core/provider/app_lifecycle_provider.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/force_update/force_update.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    
    // ライフサイクル監視
    ref.listen(appLifecycleProvider, (previous, next) {
      if (next.value == AppLifecycleState.resumed) {
        // フォアグラウンド復帰時にチェック
        unawaited(_checkForceUpdate(context, ref));
      }
    });

    // 初回起動時にチェック
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_checkForceUpdate(context, ref));
    });

    return MaterialApp.router(
      routerConfig: router,
      darkTheme: darkTheme(),
      themeMode: ThemeMode.dark,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
    );
  }

  Future<void> _checkForceUpdate(BuildContext context, WidgetRef ref) async {
    try {
      final checker = ref.read(forceUpdateCheckerProvider);
      await checker.checkAndShowUpdateDialog(context);
    } on Exception catch (e) {
      // エラー時はアップデートチェックをスキップ
      debugPrint('Force update check failed: $e');
    }
  }
}
