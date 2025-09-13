import 'dart:async';

import 'package:app/core/designsystem/theme/theme.dart';
import 'package:app/core/gen/l10n/l10n.dart';
import 'package:app/core/provider/app_lifecycle_provider.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/force_update/force_update_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    
    // 初回起動時にチェック
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(_checkForceUpdate(ref));
      });
      return null;
    }, []);

    // ライフサイクル監視
    ref.listen(appLifecycleProvider, (previous, next) {
      if (next.value == AppLifecycleState.resumed) {
        // フォアグラウンド復帰時にチェック（強制）
        unawaited(_checkForceUpdate(ref, force: true));
      }
    });

    return MaterialApp.router(
      routerConfig: router,
      darkTheme: darkTheme(),
      themeMode: ThemeMode.dark,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
    );
  }

  Future<void> _checkForceUpdate(WidgetRef ref, {bool force = false}) async {
    final notifier = ref.read(forceUpdateStateNotifierProvider.notifier);
    await notifier.checkForUpdate(force: force);
  }
}
