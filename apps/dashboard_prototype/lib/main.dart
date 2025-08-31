import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'router/router.dart';
import 'core/designsystem/theme/theme.dart';
import 'core/auth/auth_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class _AppWrapper extends ConsumerStatefulWidget {
  const _AppWrapper();

  @override
  ConsumerState<_AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends ConsumerState<_AppWrapper> {
  @override
  void initState() {
    super.initState();
    // 自動で匿名ログインを実行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).setAnonymousUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FlutterKaigi 2025 Dashboard Prototype',
      theme: darkTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.dark,
      routerConfig: router,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AppWrapper();
  }
}
