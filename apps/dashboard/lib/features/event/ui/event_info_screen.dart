import 'package:dashboard/core/router/router.dart';
import 'package:flutter/material.dart';

/// イベント情報画面
///
/// 主な役割:
/// - イベントの詳細情報を表示する
/// - メイン画面や他イベント画面から遷移して利用される
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class EventInfoScreen extends StatelessWidget {
  const EventInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () async => const NewsRoute().go(context),
          child: const Text('ニュース画面へ'),
        ),
      ),
    );
  }
}
