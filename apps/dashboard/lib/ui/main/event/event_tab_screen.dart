import 'package:flutter/material.dart';

/// イベントタブ画面
///
/// 主な役割:
/// - イベント情報の一覧や詳細への導線を提供する
/// - タブ切り替えでイベント関連画面を表示する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class EventTabScreen extends StatelessWidget {
  const EventTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('EventTabScreen')));
  }
}
