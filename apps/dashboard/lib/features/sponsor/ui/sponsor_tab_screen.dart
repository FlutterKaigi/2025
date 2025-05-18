import 'package:flutter/material.dart';

/// スポンサータブ画面
///
/// 主な役割:
/// - スポンサー情報の一覧や詳細への導線を提供する
/// - タブ切り替えでスポンサー関連画面を表示する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class SponsorTabScreen extends StatelessWidget {
  const SponsorTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('SponsorTabScreen')));
  }
}
