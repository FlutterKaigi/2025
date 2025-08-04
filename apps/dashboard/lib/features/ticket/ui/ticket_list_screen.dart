import 'package:flutter/material.dart';

/// チケット一覧画面
/// 
/// 機能:
/// - 購入可能なチケット種別を表示
/// - 進行中のチェックアウトがある場合は非表示
class TicketListScreen extends StatelessWidget {
  const TicketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チケット'),
      ),
      body: const Center(
        child: Text('チケット一覧画面（実装中）'),
      ),
    );
  }
}