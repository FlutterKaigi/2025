import 'package:flutter/material.dart';

/// アカウント情報画面
///
/// 主な役割:
/// - ユーザーのアカウント情報を表示する
/// - プロフィール編集や退会申請画面への導線を提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('AccountInfoScreen')));
  }
}
