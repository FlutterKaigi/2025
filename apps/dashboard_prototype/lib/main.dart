import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router/router.dart';
import 'core/designsystem/theme/theme.dart';
import 'core/auth/auth_state.dart';

void main() {
  runApp(const MyApp());
}

class _AppWrapper extends StatefulWidget {
  const _AppWrapper();

  @override
  State<_AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<_AppWrapper> {
  @override
  void initState() {
    super.initState();
    // 自動で匿名ログインを実行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthState>().setAnonymousUser();
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
    return ChangeNotifierProvider(
      create: (context) => AuthState(),
      child: const _AppWrapper(),
    );
  }
}
