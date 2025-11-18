import 'package:app/core/gen/assets/assets.gen.dart';
import 'package:app/core/gen/assets/fonts.gen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/provider/environment.dart';
import 'package:app/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

/// イベント情報画面
///
/// 主な役割:
/// - イベントの詳細情報を表示する
/// - メイン画面や他イベント画面から遷移して利用される
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/app/SCREENS.md)
class EventInfoScreen extends ConsumerWidget {
  const EventInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    return Scaffold(
      body: ListView(
        children: [
          const _NewsListTile(),
          const _EventInfoCard(),
          // Contributors section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              t.event.contributors,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          _SectionListItem(
            title: t.event.staffMembers.title,
            onTap: () => const StaffMemberListRoute().go(context),
          ),
          // Others section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              t.event.others,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          _SectionListItem(
            title: t.event.codeOfConduct,
            onTap: () => _openUrl(
              urlString: t.event.codeOfConductUrl,
            ),
          ),
          _SectionListItem(
            title: t.event.privacyPolicy,
            onTap: () => _openUrl(
              urlString: t.event.privacyPolicyUrl,
            ),
          ),
          _SectionListItem(
            title: t.event.contact,
            onTap: () => _openUrl(
              urlString: t.event.contactUrl,
            ),
          ),
          _SectionListItem(
            title: t.event.ossLicenses,
            onTap: () => const LicenseRoute().go(context),
          ),
          const SizedBox(height: 8),
          // Flutter version and commit info
          _FooterSection(
            commitInformation: ref.watch(environmentProvider).commitInformation,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Future<void> _openUrl({required String urlString}) async {
    final uri = Uri.tryParse(urlString);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch $urlString');
    }
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

/// セクションリストアイテム用のカスタムウィジェット
class _SectionListItem extends StatelessWidget {
  const _SectionListItem({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(
        title,
        style: textTheme.bodyLarge,
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: colorScheme.onSurfaceVariant,
      ),
      visualDensity: VisualDensity.comfortable,
      onTap: onTap,
    );
  }
}

/// フッターセクション
class _FooterSection extends StatelessWidget {
  const _FooterSection({
    required this.commitInformation,
  });

  final String? commitInformation;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Powered by Flutter\n',
                    style: TextStyle(
                      fontVariations: [
                        FontVariation('wght', 700),
                        FontVariation('wdth', 125),
                      ],
                    ),
                  ),
                  if (commitInformation != null)
                    TextSpan(
                      text: 'Commit: $commitInformation',
                    ),
                ],
              ),
              style: textTheme.bodySmall!.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontFamily: FontFamily.notoSansMono,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Link(
              uri: Uri.parse(
                'https://github.com/FlutterKaigi/2025',
              ),
              builder: (context, followLink) => OutlinedButton.icon(
                onPressed: followLink,
                icon: const FaIcon(
                  FontAwesomeIcons.github,
                  size: 16,
                ),
                label: Text(t.event.sourceCode),
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.colorScheme.primary,
                  side: BorderSide(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
