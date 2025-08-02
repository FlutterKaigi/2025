import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SponsorListScreen extends StatelessWidget {
  const SponsorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final companySponsors = [
      {'name': 'プラチナスポンサー A社', 'slug': 'platinum-a', 'tier': 'Platinum'},
      {'name': 'ゴールドスポンサー B社', 'slug': 'gold-b', 'tier': 'Gold'},
      {'name': 'シルバースポンサー C社', 'slug': 'silver-c', 'tier': 'Silver'},
      {'name': 'ブロンズスポンサー D社', 'slug': 'bronze-d', 'tier': 'Bronze'},
    ];
    
    final individualSponsors = [
      {'name': '個人スポンサー A', 'slug': 'individual-a'},
      {'name': '個人スポンサー B', 'slug': 'individual-b'},
      {'name': '個人スポンサー C', 'slug': 'individual-c'},
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          if (companySponsors.isNotEmpty) ...[
            SliverPersistentHeader(
              pinned: true,
              delegate: _SectionHeaderDelegate(title: '企業スポンサー'),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _SponsorListItem(
                  sponsor: companySponsors[index],
                ),
                childCount: companySponsors.length,
              ),
            ),
          ],
          if (individualSponsors.isNotEmpty) ...[
            SliverPersistentHeader(
              pinned: true,
              delegate: _SectionHeaderDelegate(title: '個人スポンサー'),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _IndividualSponsorItem(
                  sponsor: individualSponsors[index],
                ),
                childCount: individualSponsors.length,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SponsorListItem extends StatelessWidget {
  const _SponsorListItem({required this.sponsor});
  
  final Map<String, String> sponsor;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getTierColor(sponsor['tier']!),
          child: Text(
            sponsor['name']![0],
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(sponsor['name']!),
        subtitle: Text('${sponsor['tier']} Sponsor'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          context.go('/sponsors/${sponsor['slug']}');
        },
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

class _IndividualSponsorItem extends StatelessWidget {
  const _IndividualSponsorItem({required this.sponsor});
  
  final Map<String, String> sponsor;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.person, color: Colors.white),
        ),
        title: Text(sponsor['name']!),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          context.go('/sponsors/${sponsor['slug']}');
        },
      ),
    );
  }
}

class _SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _SectionHeaderDelegate({required this.title});
  
  final String title;
  
  @override
  double get minExtent => 56;
  
  @override
  double get maxExtent => 56;
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);
    return Material(
      color: theme.scaffoldBackgroundColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  
  @override
  bool shouldRebuild(covariant _SectionHeaderDelegate oldDelegate) {
    return title != oldDelegate.title;
  }
}