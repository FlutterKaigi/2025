import 'package:flutter/material.dart';

/// スポンサー編集画面
///
/// 主な役割:
/// - スポンサー企業情報の編集を行う
/// - 詳細画面から遷移して利用される
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class SponsorEditScreen extends StatelessWidget {
  const SponsorEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('SponsorEditScreen')));
  }
}
