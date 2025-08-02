import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/gen/assets/assets.gen.dart';

class EventInfoScreen extends StatelessWidget {
  const EventInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          _NewsListTile(),
          _EventInfoCard(),
        ],
      ),
    );
  }
}

class _NewsListTile extends StatelessWidget {
  const _NewsListTile();

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE50632),
            Color(0xFF822FE0),
            Color(0xFF007AFF),
          ],
          stops: [0.04, 0.5, 0.95],
        ),
      ),
      child: ListTile(
        leading: const Icon(Icons.notifications_outlined),
        title: const Text('お知らせ'),
        subtitle: const Text('最新の情報をチェック'),
        trailing: const Icon(Icons.arrow_right),
        onTap: () => context.go('/event/news'),
      ),
    );
  }
}

class _EventInfoCard extends StatelessWidget {
  const _EventInfoCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card.outlined(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Assets.res.logo.image(height: 126),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'FlutterKaigiは、Flutterエンジニアが集まる日本最大級のカンファレンスです。',
              style: textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('開催日'),
            subtitle: const Text('2025年11月（詳細未定）'),
            dense: true,
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('開催場所'),
            subtitle: const Text('未定'),
            dense: true,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}