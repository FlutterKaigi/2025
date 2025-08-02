import 'package:flutter/material.dart';

class SessionDetailScreen extends StatelessWidget {
  const SessionDetailScreen({
    required this.slug,
    super.key,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('セッション詳細: $slug'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'セッション: $slug',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              'このセッションの詳細情報がここに表示されます。',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'スピーカー情報、時間、場所などの詳細が表示されます。',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}