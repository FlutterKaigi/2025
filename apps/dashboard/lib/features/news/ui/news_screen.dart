import 'package:flutter/material.dart';

/// お知らせ画面
///
/// 主な役割:
/// - イベントや運営からのお知らせ情報を表示する
/// - イベント画面などから遷移して利用される
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: const Center(
        child: Text(
          'NewsScreen',
        ),
      ),
    );
  }
}
