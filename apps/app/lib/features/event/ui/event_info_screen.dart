import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/ticket/ui/components/entry_ticket_card.dart';
import 'package:flutter/material.dart';

/// イベント情報画面
///
/// 主な役割:
/// - イベントの詳細情報を表示する
/// - メイン画面や他イベント画面から遷移して利用される
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/app/SCREENS.md)
class EventInfoScreen extends StatelessWidget {
  const EventInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          _NewsListTile(),
          _EventInfoCard(),
          EntryTicketCard(),
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
    final t = Translations.of(context);
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
        title: Text(t.news.tile.title),
        subtitle: Text(t.news.tile.subtitle),
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
    final t = Translations.of(context);

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
              t.event.description,
              style: textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: Text(t.event.date),
            subtitle: Text(t.event.time),
            dense: true,
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: Text(t.event.venue),
            subtitle: Text(t.event.address),
            dense: true,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
