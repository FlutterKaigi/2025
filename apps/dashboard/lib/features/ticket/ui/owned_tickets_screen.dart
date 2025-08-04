import 'package:flutter/material.dart';

/// 保有チケット画面
///
/// 機能:
/// - 購入済みチケット一覧を表示
/// - 各チケットの詳細情報表示
class OwnedTicketsScreen extends StatelessWidget {
  const OwnedTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('保有チケット'),
      ),
      body: const Center(
        child: Text('保有チケット画面（実装中）'),
      ),
    );
  }
}
