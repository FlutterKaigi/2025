import 'package:flutter/material.dart';

/// チケット詳細画面
/// 
/// 機能:
/// - 特定のチケット種別の詳細情報を表示
/// - オプション選択
/// - 購入ボタン（認証チェック含む）
class TicketDetailScreen extends StatelessWidget {
  const TicketDetailScreen({
    required this.ticketTypeId,
    super.key,
  });

  final String ticketTypeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('チケット詳細'),
      ),
      body: Center(
        child: Text('チケット詳細画面（実装中）\nTicket ID: $ticketTypeId'),
      ),
    );
  }
}