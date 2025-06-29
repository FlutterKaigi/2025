import 'package:dashboard/core/assets/assets.gen.dart';
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
      body: ListView(
        children: const [
          _NotificationListTile(),
          _EventInfoCard(),
        ],
      ),
    );
  }
}

class _NotificationListTile extends StatelessWidget {
  const _NotificationListTile({
    super.key,
  });

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
        title: const Text('最新のお知らせ'),
        subtitle: const Text('最新のお知らせをご確認ください'),
        trailing: const Icon(Icons.arrow_right),
        onTap: () async => const NewsRoute().go(context),
      ),
    );
  }
}

class _EventInfoCard extends StatelessWidget {
  const _EventInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card.outlined(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Assets.logo.image(height: 126),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '''2025年、日本国内で Flutter をメインに扱う技術カンファレンス。Flutter や Dart の深い知見を持つ開発者によるセッションを多数企画します。''',
              style: textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
          const ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('2025年11月13日(金)'),
            subtitle: Text('10:00 ~ 19:00'),
            dense: true,
          ),
          const ListTile(
            leading: Icon(Icons.location_on),
            title: Text('大手町プレイス ホール＆カンファレンス'),
            subtitle: Text('東京都千代田区大手町二丁目3番1号'),
            dense: true,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
