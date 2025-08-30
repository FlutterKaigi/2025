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
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
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
    final sponsors = ref.watch(sponsorsProvider);
    return switch (sponsors) {
      AsyncData(:final value) => () {
        final companySponsors = value.whereType<CompanySponsor>().toList();
        final individualSponsors = value
            .whereType<IndividualSponsor>()
            .toList();

        final slivers = <Widget>[
          if (companySponsors.isNotEmpty) ...[
            SliverPersistentHeader(
              pinned: true,
              delegate: _SectionHeaderDelegate(title: '企業スポンサー'),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    _SponsorListItem(sponsor: companySponsors[index]),
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
                (context, index) =>
                    _SponsorListItem(sponsor: individualSponsors[index]),
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
  _SectionHeaderDelegate({required this.title});

  final String title;

  @override
  double get minExtent => 40;
  @override
  double get maxExtent => 40;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.colorScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          title,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class _SponsorListItem extends StatelessWidget {
  const _SponsorListItem({required this.sponsor});

  final Sponsor sponsor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sponsor.name),
      trailing: const Icon(Icons.arrow_right),
      onTap: () {
        SponsorDetailRoute(slug: sponsor.slug).go(context);
      },
    );
  }
}
