import 'package:flutter/material.dart';

/// スプラッシュ画面
///
/// 主な役割:
/// - アプリ起動時に表示される
/// - セッション確認や初期化処理を行う
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('SplashScreen')));
  }
}
