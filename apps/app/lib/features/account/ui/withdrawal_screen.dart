import 'package:flutter/material.dart';

/// 退会申請画面
///
/// 主な役割:
/// - ユーザーの退会申請を行う
/// - アカウント情報画面から遷移して利用される
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/app/SCREENS.md)
class WithdrawalScreen extends StatelessWidget {
  const WithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WithdrawalScreen'),
      ),
      body: const Center(),
    );
  }
}
