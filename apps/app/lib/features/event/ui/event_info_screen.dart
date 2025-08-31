import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/l10n/l10n.dart';
import 'package:app/core/router/router.dart';
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
          _NewsListTile(),
          _EventInfoCard(),
        ],
      ),
    );
  }
}

class _NewsListTile extends StatelessWidget {
  const _NewsListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
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
        title: Text(l10n.newsTileTitle),
        subtitle: Text(l10n.newsTileSubtitle),
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
    final l10n = L10n.of(context);

    return Card.outlined(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Assets.res.assets.logo.image(height: 126),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              l10n.eventDescription,
              style: textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: Text(l10n.eventDate),
            subtitle: Text(l10n.eventTime),
            dense: true,
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: Text(l10n.eventVenue),
            subtitle: Text(l10n.eventAddress),
            dense: true,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
