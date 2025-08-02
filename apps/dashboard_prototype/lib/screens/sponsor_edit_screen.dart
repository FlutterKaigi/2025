import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SponsorEditScreen extends StatelessWidget {
  const SponsorEditScreen({
    required this.slug,
    super.key,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スポンサー情報編集'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.go('/sponsors/$slug');
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Mock save action
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('保存しました')),
              );
              context.go('/sponsors/$slug');
            },
            child: const Text('保存'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
          const TextField(
            decoration: InputDecoration(
              labelText: '会社名',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'スポンサーティア',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            maxLines: 5,
            decoration: InputDecoration(
              labelText: '会社概要',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'ロゴURL',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  context.go('/sponsors/$slug');
                },
                child: const Text('キャンセル'),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('保存しました')),
                  );
                  context.go('/sponsors/$slug');
                },
                child: const Text('保存'),
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}