import 'package:flutter/material.dart';

/// アカウントタブ画面
///
/// 主な役割:
/// - アカウント情報やプロフィール編集画面への導線を提供する
/// - タブ切り替えでアカウント関連画面を表示する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class AccountTabScreen extends StatelessWidget {
  const AccountTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('AccountTabScreen')));
  }
}
