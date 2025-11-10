import 'package:app/core/designsystem/components/error_screen.dart';
import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/sponsor/data/sponsor.dart';
import 'package:app/features/sponsor/data/sponsor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// スポンサー一覧画面
///
/// 主な役割:
/// - 企業スポンサー・個人スポンサーの一覧を表示する
/// - 詳細画面や編集画面への導線を提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/app/SCREENS.md)
class SponsorListScreen extends StatelessWidget {
  const SponsorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: _SponsorList()),
    );
  }
}

class _SponsorList extends ConsumerWidget {
  const _SponsorList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final sponsors = ref.watch(sponsorsProvider);
    return switch (sponsors) {
      AsyncData(:final value) => () {
        final companySponsors = value.whereType<CompanySponsor>().toList();
        final individualSponsors = value
            .whereType<IndividualSponsor>()
            .toList();
        final platinum = companySponsors.whereType<PlatinumSponsor>().toList(
          growable: false,
        );
        final gold = companySponsors.whereType<GoldSponsor>().toList(
          growable: false,
        );
        final silver = companySponsors.whereType<SilverSponsor>().toList(
          growable: false,
        );
        final bronze = companySponsors.whereType<BronzeSponsor>().toList(
          growable: false,
        );
        final slivers = <Widget>[
          if (platinum.isNotEmpty)
            SliverStickyHeader(
              header: _StickyHeaderContainer(
                child: _SectionHeader(
                  title: 'Platinum スポンサー',
                  tierColor: _getTierColor('Platinum'),
                ),
              ),
              sliver: _buildSponsorList('Platinum', platinum),
            ),
          if (gold.isNotEmpty)
            SliverStickyHeader(
              header: _StickyHeaderContainer(
                child: _SectionHeader(
                  title: 'Gold スポンサー',
                  tierColor: _getTierColor('Gold'),
                ),
              ),
              sliver: _buildSponsorList('Gold', gold),
            ),
          if (silver.isNotEmpty)
            SliverStickyHeader(
              header: _StickyHeaderContainer(
                child: _SectionHeader(
                  title: 'Silver スポンサー',
                  tierColor: _getTierColor('Silver'),
                ),
              ),
              sliver: _buildSponsorList('Silver', silver),
            ),
          if (bronze.isNotEmpty)
            SliverStickyHeader(
              header: _StickyHeaderContainer(
                child: _SectionHeader(
                  title: 'Bronze スポンサー',
                  tierColor: _getTierColor('Bronze'),
                ),
              ),
              sliver: _buildSponsorList('Bronze', bronze),
            ),
          if (individualSponsors.isNotEmpty)
            SliverStickyHeader(
              header: _StickyHeaderContainer(
                child: _SectionHeader(
                  title: t.sponsor.individual,
                  tierColor: _getTierColor('Individual'),
                ),
              ),
              sliver: _buildSponsorList('Individual', individualSponsors),
            ),
        ];
        return CustomScrollView(
          primary: true,
          slivers: slivers,
        );
      }(),
      AsyncLoading() => const Center(
        child: SafeArea(child: CircularProgressIndicator.adaptive()),
      ),
      AsyncError(:final error) => ErrorScreen(
        error: error,
        onRetry: () => ref.invalidate(sponsorsProvider),
      ),
    };
  }
}

class _StickyHeaderContainer extends StatelessWidget {
  const _StickyHeaderContainer({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.tierColor});

  final String title;
  final Color tierColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        border: Border(
          left: BorderSide(color: tierColor, width: 4),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _UnifiedSponsorCard extends StatelessWidget {
  const _UnifiedSponsorCard({required this.sponsor, required this.tier});

  final Sponsor sponsor;
  final String tier;

  @override
  Widget build(BuildContext context) {
    final cardSize = _getCardSize(tier);
    return Card(
      margin: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () {
          SponsorDetailRoute(slug: sponsor.slug).go(context);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: cardSize,
          height: cardSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _getTierColor(tier),
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: sponsor.logoUrl.toString().isEmpty
                ? Icon(
                    tier == 'Individual' ? Icons.person : Icons.business,
                    color: Colors.grey.shade400,
                    size: cardSize * 0.4,
                  )
                : Image.network(
                    sponsor.logoUrl.toString(),
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      tier == 'Individual' ? Icons.person : Icons.business,
                      color: Colors.grey.shade400,
                      size: cardSize * 0.4,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

SliverList _buildSponsorList(String tier, List<Sponsor> sponsors) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        if (index > 0) {
          return null;
        }
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: sponsors
                .map(
                  (sponsor) => _UnifiedSponsorCard(
                    sponsor: sponsor,
                    tier: tier,
                  ),
                )
                .toList(),
          ),
        );
      },
      childCount: 1,
    ),
  );
}

Color _getTierColor(String tier) {
  switch (tier) {
    case 'Platinum':
      return const Color(0xFF9C27B0);
    case 'Gold':
      return const Color(0xFFFFC54F);
    case 'Silver':
      return const Color(0xFFB5A7B6);
    case 'Bronze':
      return const Color(0xFFB03400);
    case 'Individual':
      return const Color(0xFF2196F3);
    default:
      return Colors.blue;
  }
}

double _getCardSize(String tier) {
  switch (tier) {
    case 'Platinum':
      return 320;
    case 'Gold':
      return 200;
    case 'Silver':
    case 'Bronze':
    case 'Individual':
      return 120;
    default:
      return 180;
  }
}
