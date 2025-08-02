import 'package:flutter/material.dart';
import 'router/router.dart';
import 'core/designsystem/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
