import 'package:dashboard/core/designsystem/theme/theme.dart';
import 'package:dashboard/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      darkTheme: darkTheme(),
      themeMode: ThemeMode.dark,
    );
  }
}
