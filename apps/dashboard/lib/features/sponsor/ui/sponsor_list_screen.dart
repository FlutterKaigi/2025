import 'package:dashboard/core/router/router.dart';
import 'package:dashboard/features/sponsor/data/sponsor.dart';
import 'package:dashboard/features/sponsor/data/sponsor_provider.dart';
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

        return ListView(
          children: [
            if (companySponsors.isNotEmpty) ...[
              const _SectionHeader(title: '企業スポンサー'),
              ...companySponsors.map((s) => _SponsorListItem(sponsor: s)),
            ],
            if (individualSponsors.isNotEmpty) ...[
              const _SectionHeader(title: '個人スポンサー'),
              ...individualSponsors.map((s) => _SponsorListItem(sponsor: s)),
            ],
          ],
        );
      }(),
      AsyncLoading() => const Center(child: CircularProgressIndicator()),
      AsyncError(:final error) => Center(child: Text(error.toString())),
    };
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
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
