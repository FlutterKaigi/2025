import 'dart:async';

import 'package:app/core/designsystem/theme/theme.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/provider/app_lifecycle_provider.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/force_update/force_update_dialog_listener.dart';
import 'package:app/features/force_update/force_update_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
        unawaited(_checkForceUpdate(ref));
      }
    });

    return MaterialApp.router(
      routerConfig: router,
      darkTheme: darkTheme(),
      themeMode: ThemeMode.dark,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      builder: (context, child) => ForceUpdateDialogListener(
        child: child!,
      ),
    );
  }

  Future<void> _checkForceUpdate(WidgetRef ref) async {
    if (kIsWeb) {
      return;
    }
    final notifier = ref.read(forceUpdateStateNotifierProvider.notifier);
    await notifier.checkForUpdate();
  }
}
