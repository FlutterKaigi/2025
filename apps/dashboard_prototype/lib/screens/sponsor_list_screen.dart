import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/ui/sticky_header/simple_sticky_header.dart';

class SponsorListScreen extends StatelessWidget {
  const SponsorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // スポンサーデータをランク別に整理
    final sponsorsByTier = {
      'Platinum': [
        {'name': 'プラチナスポンサー A社', 'slug': 'platinum-a'},
        {'name': 'プラチナスポンサー B社', 'slug': 'platinum-b'},
      ],
      'Gold': [
        {'name': 'ゴールドスポンサー A社', 'slug': 'gold-a'},
        {'name': 'ゴールドスポンサー B社', 'slug': 'gold-b'},
        {'name': 'ゴールドスポンサー C社', 'slug': 'gold-c'},
      ],
      'Silver': [
        {'name': 'シルバースポンサー A社', 'slug': 'silver-a'},
        {'name': 'シルバースポンサー B社', 'slug': 'silver-b'},
        {'name': 'シルバースポンサー C社', 'slug': 'silver-c'},
        {'name': 'シルバースポンサー D社', 'slug': 'silver-d'},
      ],
      'Bronze': [
        {'name': 'ブロンズスポンサー A社', 'slug': 'bronze-a'},
        {'name': 'ブロンズスポンサー B社', 'slug': 'bronze-b'},
        {'name': 'ブロンズスポンサー C社', 'slug': 'bronze-c'},
        {'name': 'ブロンズスポンサー D社', 'slug': 'bronze-d'},
        {'name': 'ブロンズスポンサー E社', 'slug': 'bronze-e'},
      ],
    };

    final individualSponsors = [
      {'name': '個人スポンサー A', 'slug': 'individual-a'},
      {'name': '個人スポンサー B', 'slug': 'individual-b'},
      {'name': '個人スポンサー C', 'slug': 'individual-c'},
      {'name': '個人スポンサー D', 'slug': 'individual-d'},
      {'name': '個人スポンサー E', 'slug': 'individual-e'},
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 企業スポンサーをランク別に表示
          ...sponsorsByTier.entries.map((entry) {
            final tier = entry.key;
            final sponsors = entry.value;

            return SimpleStickyHeader(
              header: _SectionHeader(
                title: '$tier スポンサー',
                tierColor: _getTierColor(tier),
              ),
              sliver: _buildSponsorSliver(tier, sponsors),
            );
          }),

          // 個人スポンサー
          if (individualSponsors.isNotEmpty)
            SimpleStickyHeader(
              header: _SectionHeader(
                title: '個人スポンサー',
                tierColor: Colors.blue,
              ),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1,
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
            ),
        ],
      ),
    );
  }

  Widget _buildSponsorSliver(String tier, List<Map<String, String>> sponsors) {
    int crossAxisCount;
    double childAspectRatio;
    
    switch (tier) {
      case 'Platinum':
        crossAxisCount = 2;
        childAspectRatio = 1.5;
        break;
      case 'Gold':
        crossAxisCount = 3;
        childAspectRatio = 1.2;
        break;
      default: // Silver, Bronze
        crossAxisCount = 4;
        childAspectRatio = 1.0;
        break;
    }
    
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
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

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.tierColor,
  });

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
  const _UnifiedSponsorCard({
    required this.sponsor,
    required this.tier,
  });

  final Map<String, String> sponsor;
  final String tier;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tierColor = _getTierColor(tier);
    final logoSize = _getLogoSize(tier);
    
    return Card(
      margin: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () => context.go('/sponsors/${sponsor['slug']}'),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            // ロゴ画像エリア（拡張可能領域）
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Container(
                    width: logoSize,
                    height: logoSize,
                    decoration: BoxDecoration(
                      color: tierColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      tier == 'Individual' ? Icons.person : Icons.business,
                      color: Colors.white,
                      size: logoSize * 0.5,
                    ),
                  ),
                ),
              ),
            ),
            // スポンサー名（下部固定）
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withAlpha(51), // 20% opacity
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                sponsor['name']!,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: tier == 'Platinum' ? FontWeight.bold : FontWeight.w500,
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
        return 64.0;
      case 'Gold':
        return 52.0;
      case 'Silver':
      case 'Bronze':
        return 40.0;
      case 'Individual':
        return 32.0;
      default:
        return 32.0;
    }
  }

  double _getTextSize(String tier) {
    switch (tier) {
      case 'Platinum':
        return 14.0;
      case 'Gold':
        return 12.0;
      case 'Silver':
      case 'Bronze':
        return 11.0;
      case 'Individual':
        return 10.0;
      default:
        return 10.0;
    }
  }
}

