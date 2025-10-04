import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/router/router.dart';
import 'package:app/features/sponsor/data/sponsor.dart';
import 'package:app/features/sponsor/data/sponsor_provider.dart';
import 'package:flutter/material.dart';
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
      body: _SponsorList(),
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
          if (platinum.isNotEmpty) ...[
            SliverPersistentHeader(
              pinned: true,
              delegate: _SectionHeaderDelegate(
                title: 'Platinum スポンサー',
                tierColor: _getTierColor('Platinum'),
              ),
            ),
            _buildSponsorGrid('Platinum', platinum),
          ],
          if (gold.isNotEmpty) ...[
            SliverPersistentHeader(
              pinned: true,
              delegate: _SectionHeaderDelegate(
                title: 'Gold スポンサー',
                tierColor: _getTierColor('Gold'),
              ),
            ),
            _buildSponsorGrid('Gold', gold),
          ],
          if (silver.isNotEmpty) ...[
            SliverPersistentHeader(
              pinned: true,
              delegate: _SectionHeaderDelegate(
                title: 'Silver スポンサー',
                tierColor: _getTierColor('Silver'),
              ),
            ),
            _buildSponsorGrid('Silver', silver),
          ],
          if (bronze.isNotEmpty) ...[
            SliverPersistentHeader(
              pinned: true,
              delegate: _SectionHeaderDelegate(
                title: 'Bronze スポンサー',
                tierColor: _getTierColor('Bronze'),
              ),
            ),
            _buildSponsorGrid('Bronze', bronze),
          ],
          if (individualSponsors.isNotEmpty) ...[
            SliverPersistentHeader(
              pinned: true,
              delegate: _SectionHeaderDelegate(
                title: t.sponsor.individual,
                tierColor: _getTierColor('Individual'),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => _UnifiedSponsorCard(
                  sponsor: individualSponsors[index],
                  tier: 'Individual',
                ),
                childCount: individualSponsors.length,
              ),
            ),
          ],
        ];
        return SafeArea(
          child: CustomScrollView(
            slivers: slivers,
          ),
        );
      }(),
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(:final error) => Center(child: Text(error.toString())),
    };
  }
}

class _SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SectionHeaderDelegate({required this.title, required this.tierColor});

  final String title;
  final Color tierColor;

  @override
  double get minExtent => 56;
  @override
  double get maxExtent => 56;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
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

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _UnifiedSponsorCard extends StatelessWidget {
  const _UnifiedSponsorCard({required this.sponsor, required this.tier});

  final Sponsor sponsor;
  final String tier;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final logoSize = _getLogoSize(tier);
    return Card(
      margin: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () {
          SponsorDetailRoute(slug: sponsor.slug).go(context);
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: sponsor.logoUrl.toString().isEmpty
                    ? Icon(
                        tier == 'Individual' ? Icons.person : Icons.business,
                        color: Colors.white,
                        size: logoSize * 0.5,
                      )
                    : Image.network(
                        sponsor.logoUrl.toString(),
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          tier == 'Individual' ? Icons.person : Icons.business,
                          color: Colors.white,
                          size: logoSize * 0.5,
                        ),
                      ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withAlpha(51),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                sponsor.name,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: tier == 'Platinum'
                      ? FontWeight.bold
                      : FontWeight.w500,
                  fontSize: _getTextSize(tier),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SliverGrid _buildSponsorGrid(String tier, List<CompanySponsor> sponsors) {
  final config = _gridConfigForTier(tier);
  return SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: config.crossAxisCount,
      childAspectRatio: config.childAspectRatio,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
    delegate: SliverChildBuilderDelegate(
      (context, index) => _UnifiedSponsorCard(
        sponsor: sponsors[index],
        tier: tier,
      ),
      childCount: sponsors.length,
    ),
  );
}

_GridConfig _gridConfigForTier(String tier) {
  switch (tier) {
    case 'Platinum':
      return const _GridConfig(crossAxisCount: 2, childAspectRatio: 1.5);
    case 'Gold':
      return const _GridConfig(crossAxisCount: 3, childAspectRatio: 1.2);
    default:
      return const _GridConfig(crossAxisCount: 4, childAspectRatio: 1);
  }
}

class _GridConfig {
  const _GridConfig({
    required this.crossAxisCount,
    required this.childAspectRatio,
  });

  final int crossAxisCount;
  final double childAspectRatio;
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

double _getLogoSize(String tier) {
  switch (tier) {
    case 'Platinum':
      return 128;
    case 'Gold':
      return 104;
    case 'Silver':
    case 'Bronze':
      return 80;
    case 'Individual':
      return 64;
    default:
      return 64;
  }
}

double _getTextSize(String tier) {
  switch (tier) {
    case 'Platinum':
      return 14;
    case 'Gold':
      return 12;
    case 'Silver':
    case 'Bronze':
      return 11;
    case 'Individual':
      return 10;
    default:
      return 10;
  }
}
