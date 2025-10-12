import 'dart:async';

import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app/core/ui/main/error_screen.dart';
import 'package:app/core/ui/main/not_found_screen.dart';
import 'package:app/features/sponsor/data/sponsor.dart';
import 'package:app/features/sponsor/data/sponsor_provider.dart';
import 'package:app/features/sponsor/ui/sponsor_sliver_app_bar.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
      _NotFound() => const NotFoundScreen(),
      _Failure() => ErrorScreen(
        onRetry: () => ref.invalidate(sponsorsProvider, asReload: true),
      ),
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

extension _BasicPlanName on Sponsor {
  String get basicPlanName => switch (this) {
    PlatinumSponsor() => 'Platinum',
    GoldSponsor() => 'Gold',
    SilverSponsor() => 'Silver',
    BronzeSponsor() => 'Bronze',
    ToolSponsor() => 'Tool',
    OtherSponsor() => 'Other',
    IndividualSponsor() => 'Individual',
  };
}

class _SponsorDetail extends HookConsumerWidget {
  const _SponsorDetail({required this.sponsor});

  final Sponsor sponsor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final t = Translations.of(context);

    // スクロール位置を監視
    final scrollController = useScrollController();
    final scrollOffset = useState<double>(0);

    useEffect(
      () {
        void listener() {
          scrollOffset.value = scrollController.offset;
        }

        scrollController.addListener(listener);
        return () => scrollController.removeListener(listener);
      },
      [scrollController],
    );

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

    // SliverAppBarの展開高さを考慮した透明度計算
    const sliverAppBarExpandedHeight = 240.0;
    const sliverAppBarCollapsedHeight = kToolbarHeight;
    const maxScrollForAppBar =
        sliverAppBarExpandedHeight - sliverAppBarCollapsedHeight;

    // スクロール位置に応じた進捗（0.0 = 展開、1.0 = 収縮）
    final scrollProgress = (scrollOffset.value / maxScrollForAppBar).clamp(
      0.0,
      1.0,
    );

    // スポンサー名のヘッダー高さ
    final sponsorHeaderHeight = MediaQuery.of(context).textScaler.scale(40);
    print(sponsorHeaderHeight);

    // スポンサー名のセクション（領域ごと消える）
    final sponsorHeader = SliverToBoxAdapter(
      child: Container(
        height: sponsorHeaderHeight * (1.0 - scrollProgress),
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ClipRect(
          child: Transform.translate(
            offset: Offset(0, -sponsorHeaderHeight * scrollProgress),
            child: Text(
              sponsor.name,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );

    final bodyContent = switch (sponsor) {
      final CompanySponsor company => [
        // ティアチップ
        Align(
          alignment: Alignment.topLeft,
          child: Chip(
            label: Text(sponsor.basicPlanName),
            side: BorderSide(color: colorScheme.outline),
            backgroundColor: colorScheme.surfaceContainerLow,
            labelStyle: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // PR 文章
        Text(
          t.sponsor.prText,
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
          t.sponsor.website,
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
        // ティアチップ
        Chip(
          label: Text(sponsor.basicPlanName),
          side: BorderSide(color: colorScheme.outline),
          backgroundColor: colorScheme.surfaceContainerLow,
          labelStyle: textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),

        // 意気込み
        if (individual.enthusiasm != null) ...[
          Text(
            t.sponsor.enthusiasm,
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
          t.sponsor.xAccount,
          style: titleStyle,
        ),
        const SizedBox(height: 8),
        if (individual.xAccount == null)
          Text(
            t.sponsor.xAccountNotSet,
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
        controller: scrollController,
        slivers: [
          header,
          sponsorHeader,
          body,
          spacer,
        ],
      ),
    );
  }
}
