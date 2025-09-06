import 'dart:async';

import 'package:app/core/gen/l10n/l10n.dart';
import 'package:app/features/sponsor/data/sponsor.dart';
import 'package:app/features/sponsor/data/sponsor_provider.dart';
import 'package:app/features/sponsor/ui/sponsor_sliver_app_bar.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// スポンサー詳細画面
///
/// 主な役割:
/// - スポンサー企業の詳細情報を表示する
///
/// 参考:
/// - [SCREENS.md](https://github.com/FlutterKaigi/2025/blob/main/docs/app/SCREENS.md)
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
            AsyncLoading() => _ScreenState.loading(),
            AsyncData(:final value) => () {
              final sponsor = value.firstWhereOrNull((s) => s.slug == slug);
              return sponsor == null
                  ? _ScreenState.notFound()
                  : _ScreenState.success(sponsor: sponsor);
            }(),
            AsyncError() => _ScreenState.failure(error: s.error),
          };
        },
      ),
    );
    return switch (sponsor) {
      _Loading() => const Center(child: CircularProgressIndicator()),
      _Success(:final sponsor) => _SponsorDetail(sponsor: sponsor),
      _NotFound() => throw UnimplementedError(),
      _Failure(:final error) => Center(child: Text(error.toString())),
    };
  }
}

sealed class _ScreenState {
  const _ScreenState();

  factory _ScreenState.loading() => const _Loading();
  factory _ScreenState.success({required Sponsor sponsor}) =>
      _Success(sponsor: sponsor);
  factory _ScreenState.notFound() => const _NotFound();
  factory _ScreenState.failure({required Object error}) =>
      _Failure(error: error);
}

final class _Loading extends _ScreenState {
  const _Loading();
}

final class _Success extends _ScreenState {
  const _Success({required this.sponsor});

  final Sponsor sponsor;
}

final class _NotFound extends _ScreenState {
  const _NotFound();
}

final class _Failure extends _ScreenState {
  const _Failure({required this.error});

  final Object error;
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

    final header = SponsorSliverAppBar(
      sponsor: sponsor,
      onBackPressed: () {
        context.pop();
      },
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
        // PR 文章
        const SizedBox(height: 8),
        Text(
          l10n.sponsorPrText,
          style: titleStyle,
        ),
        const SizedBox(height: 8),
        Text(
          company.prText,
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
        if (individual.enthusiasm != null) ...[
          const SizedBox(height: 8),
          Text(
            l10n.sponsorEnthusiasm,
            style: titleStyle,
          ),
          const SizedBox(height: 8),
          Text(
            individual.enthusiasm!,
            style: bodyTextStyle,
          ),
          const SizedBox(height: 8),
        ],

        // Xアカウント
        const SizedBox(height: 8),
        Text(
          l10n.sponsorXAccount,
          style: titleStyle,
        ),
        const SizedBox(height: 8),
        if (individual.xAccount == null)
          Text(
            l10n.sponsorXAccountNotSet,
            style: bodyTextStyle?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          )
        else
          Text.rich(
            TextSpan(
              text: '@${individual.xAccount}',
              style: bodyTextStyle?.copyWith(
                color: colorScheme.primary,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  final xUrl = 'https://x.com/${individual.xAccount}';
                  unawaited(
                    launchUrl(
                      Uri.parse(xUrl),
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

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          header,
          body,
          spacer,
        ],
      ),
    );
  }
}
