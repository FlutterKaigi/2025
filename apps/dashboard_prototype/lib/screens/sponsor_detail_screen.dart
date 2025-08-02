import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SponsorDetailScreen extends StatelessWidget {
  const SponsorDetailScreen({
    required this.slug,
    super.key,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    // Mock data
    final sponsorData = {
      'platinum-a': {'name': 'プラチナスポンサー A社', 'tier': 'Platinum', 'description': 'A社は最先端のモバイル開発を支援しています。'},
      'gold-b': {'name': 'ゴールドスポンサー B社', 'tier': 'Gold', 'description': 'B社はFlutterエコシステムに貢献しています。'},
      'silver-c': {'name': 'シルバースポンサー C社', 'tier': 'Silver', 'description': 'C社はクラウドソリューションを提供しています。'},
      'bronze-d': {'name': 'ブロンズスポンサー D社', 'tier': 'Bronze', 'description': 'D社は開発者ツールを開発しています。'},
    };

    final sponsor = sponsorData[slug] ?? {'name': 'Unknown Sponsor', 'tier': 'Unknown', 'description': ''};

    return Scaffold(
      appBar: AppBar(
        title: Text(sponsor['name']!),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/sponsors');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.go('/sponsors/$slug/edit');
            },
            tooltip: '編集',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: _getTierColor(sponsor['tier']!),
                        child: Text(
                          sponsor['name']![0],
                          style: const TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sponsor['name']!,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Chip(
                              label: Text('${sponsor['tier']} Sponsor'),
                              backgroundColor: _getTierColor(sponsor['tier']!).withValues(alpha: 0.2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    '会社概要',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(sponsor['description']!),
                  const SizedBox(height: 24),
                  const Text(
                    'スポンサー特典',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('• ロゴ掲載\n• セッション枠\n• ブース出展'),
                ],
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }

  Color _getTierColor(String tier) {
    switch (tier) {
      case 'Platinum':
        return Colors.purple;
      case 'Gold':
        return Colors.amber;
      case 'Silver':
        return Colors.grey;
      case 'Bronze':
        return Colors.brown;
      default:
        return Colors.blue;
    }
  }
}