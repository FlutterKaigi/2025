import 'dart:async';

import 'package:dashboard/core/gen/l10n/l10n.dart';
import 'package:dashboard/core/router/router.dart';
import 'package:dashboard/features/sponsor/data/sponsor.dart';
import 'package:dashboard/features/sponsor/data/sponsor_provider.dart';
import 'package:dashboard/features/sponsor/ui/sponsor_flexible_space_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// スポンサー詳細画面
///
/// 主な役割:
/// - スポンサー企業の詳細情報を表示する
/// - 編集画面への導線を提供する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/dashboard/SCREENS.md)
class SponsorDetailScreen extends ConsumerWidget {
  const SponsorDetailScreen({
    required this.slug,
    super.key,
  });

  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sponsor = ref.watch(
      sponsorsProvider.select(
        (s) {
          return switch (s) {
            AsyncData(:final value) => value.firstWhere((s) => s.slug == slug),
            _ => null,
          };
        },
      ),
    );
    return switch (sponsor) {
      null => const Center(child: CircularProgressIndicator()),
      final Sponsor s => _SponsorDetail(sponsor: s),
    };
  }
}

class _SponsorDetail extends ConsumerWidget {
  const _SponsorDetail({required this.sponsor});

  final Sponsor sponsor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final l10n = L10n.of(context);

    final header = SliverAppBar(
      stretch: true,
      expandedHeight: 240,
      automaticallyImplyLeading: false,
      leading: IconButton.filledTonal(
        style: IconButton.styleFrom(
          backgroundColor: colorScheme.secondaryContainer,
          foregroundColor: colorScheme.onSurface,
        ),
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back),
      ),
      flexibleSpace: SponsorFlexibleSpaceBar(
        sponsor: sponsor,
      ),
    );

    final titleStyle = textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.bold,
      color: colorScheme.onSurfaceVariant,
    );

    final bodyTextStyle = textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurface,
    );

    final bodyContent = switch (sponsor) {
      final CompanySponsor company => [
        // 会社概要
        const SizedBox(height: 8),
        Text(
          l10n.sponsorDescription,
          style: titleStyle,
        ),
        const SizedBox(height: 8),
        Text(
          company.description,
          style: bodyTextStyle,
        ),
        const SizedBox(height: 8),

        // ウェブサイト
        const SizedBox(height: 8),
        Text(
          l10n.sponsorWebsite,
          style: titleStyle,
        ),
        const SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: company.websiteUrl.toString(),
            style: bodyTextStyle?.copyWith(
              color: colorScheme.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                unawaited(
                  launchUrl(
                    company.websiteUrl,
                    mode: LaunchMode.externalApplication,
                  ),
                );
              },
          ),
        ),
      ],
      final IndividualSponsor individual => [
        // 意気込み
        const SizedBox(height: 8),
        Text(
          l10n.sponsorEnthusiasm,
          style: titleStyle,
        ),
        const SizedBox(height: 8),
        Text(
          individual.enthusiasm,
          style: bodyTextStyle,
        ),
        const SizedBox(height: 8),

        // ウェブサイト
        const SizedBox(height: 8),
        Text(
          l10n.sponsorWebsite,
          style: titleStyle,
        ),
        const SizedBox(height: 8),
        if (individual.websiteUrl == null)
          Text(
            l10n.sponsorWebsiteNotSet,
            style: bodyTextStyle?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          )
        else
          Text.rich(
            TextSpan(
              text: individual.websiteUrl.toString(),
              style: bodyTextStyle?.copyWith(
                color: colorScheme.primary,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  unawaited(
                    launchUrl(
                      individual.websiteUrl!,
                      mode: LaunchMode.externalApplication,
                    ),
                  );
                },
            ),
          ),
      ],
    };

    final body = SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(bodyContent),
      ),
    );

    const spacer = SliverFillRemaining(
      hasScrollBody: false,
      child: SizedBox.shrink(),
    );

    // 以下の条件のいずれかを満たす場合に編集可能とする
    // - ログインユーザーが　　Admin, Staff のいずれかのロールを持っている
    // - ログインユーザーが Sponsor のロールを持っている、かつ、ログインユーザーのメールアドレスと
    //   スポンサーのメールアドレスのドメイン部分が一致している
    //
    // TODO: 本番データとの繋ぎ込みを行う際に修正する
    final isEditable =
        sponsor is CompanySponsor || sponsor is IndividualSponsor;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          header,
          body,
          spacer,
        ],
      ),
      bottomNavigationBar: isEditable
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.secondaryContainer,
                  foregroundColor: colorScheme.onSurface,
                ),
                icon: const Icon(Icons.edit),
                label: Text(l10n.sponsorEditButtonLabel),
                onPressed: () {
                  SponsorEditRoute(slug: sponsor.slug).go(context);
                },
              ),
            )
          : null,
    );
  }
}
