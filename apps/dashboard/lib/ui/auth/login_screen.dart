import 'package:flutter/material.dart';

/// ログイン画面
///
/// 主な役割:
/// - ユーザーのログイン認証を行う
/// - Google認証や招待コード入力画面への遷移を提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('LoginScreen')));
  }
}
