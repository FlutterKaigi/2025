import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お知らせ'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/event');
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNewsItem(
            '2025/01/15',
            'FlutterKaigi 2025 開催決定！',
            'FlutterKaigi 2025の開催が正式に決定しました。詳細は順次公開予定です。',
          ),
          _buildNewsItem(
            '2025/01/10',
            'スポンサー募集開始',
            'FlutterKaigi 2025のスポンサー募集を開始しました。',
          ),
          _buildNewsItem(
            '2025/01/05',
            'ウェブサイトリニューアル',
            'FlutterKaigi 2025の公式ウェブサイトをリニューアルしました。',
          ),
        ],
      ),
    );
  }

  Widget _buildNewsItem(String date, String title, String content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(date, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}