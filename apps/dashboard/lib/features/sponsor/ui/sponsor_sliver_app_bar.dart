import 'dart:ui';
import 'package:dashboard/features/sponsor/data/sponsor.dart';
import 'package:flutter/material.dart';

class SponsorSliverAppBar extends StatelessWidget {
  const SponsorSliverAppBar({
    required this.sponsor,
    required this.onBackPressed,
    super.key,
  });

  final Sponsor sponsor;
  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SliverAppBar(
      stretch: true,
      expandedHeight: 240,
      pinned: true,
      automaticallyImplyLeading: false,
      leading: IconButton.filledTonal(
        style: IconButton.styleFrom(
          backgroundColor: colorScheme.secondaryContainer,
          foregroundColor: colorScheme.onSurface,
        ),
        onPressed: onBackPressed,
        icon: const Icon(Icons.arrow_back),
      ),
      flexibleSpace: _SponsorFlexibleSpace(sponsor: sponsor),
    );
  }
}

class _SponsorFlexibleSpace extends StatelessWidget {
  const _SponsorFlexibleSpace({required this.sponsor});

  final Sponsor sponsor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
        const stretchModes = <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ];

        final deltaExtent = settings.maxExtent - settings.minExtent;
        final t = deltaExtent == 0.0
            ? 1.0
            : (1.0 -
                      (settings.currentExtent - settings.minExtent) /
                          deltaExtent)
                  .clamp(0.0, 1.0);

        final children = <Widget>[];

        // 背景画像の高さ
        var height = settings.maxExtent;
        if (stretchModes.contains(StretchMode.zoomBackground) &&
            constraints.maxHeight > height) {
          height = constraints.maxHeight;
        }

        // パララックス効果
        final parallax = -Tween<double>(
          begin: 0,
          end: deltaExtent / 4.0,
        ).transform(t);

        // 透過度（フェード）
        final fadeStart = deltaExtent == 0
            ? 0.0
            : (1.0 - kToolbarHeight / deltaExtent).clamp(0.0, 1.0);
        const fadeEnd = 1.0;
        final opacity = deltaExtent == 0
            ? 1.0
            : 1.0 - Interval(fadeStart, fadeEnd).transform(t);

        // 背景画像
        children.add(
          Positioned(
            top: parallax,
            left: 0,
            right: 0,
            height: height,
            child: Opacity(
              opacity: opacity,
              child: Image.network(
                sponsor.logoUrl.toString(),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 64,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          ),
        );

        // 背景ブラー
        if (stretchModes.contains(StretchMode.blurBackground) &&
            constraints.maxHeight > settings.maxExtent) {
          final blurAmount =
              (constraints.maxHeight - settings.maxExtent) / 10.0;
          children.add(
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: blurAmount,
                  sigmaY: blurAmount,
                ),
                child: const ColoredBox(color: Colors.transparent),
              ),
            ),
          );
        }

        // 黒半透明オーバーレイ
        children.add(
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
            ),
          ),
        );

        // sponsor.nameとChipの配置（スクロールで位置変更）
        final chipOpacity = (1.0 - t).clamp(0.0, 1.0);

        // サイズのアニメーション（1.2 → 1.0）
        const expandedTitleScale = 1.2;
        final scaleValue = Tween<double>(
          begin: expandedTitleScale,
          end: 1,
        ).transform(t);

        // sponsor.nameの位置移動アニメーション
        final nameLeft = Tween<double>(
          begin: 16, // 初期位置（左端）
          end: 56, // leading右端（leadingボタンの幅56）
        ).transform(t);

        const chipHeight = 48.0;
        const chipBottomMargin = 16.0;
        const nameHeight = 24.0; // titleLargeの概算高さ

        // 初期位置は Chip の 8 ポイント上の位置
        final nameTopBegin =
            settings.maxExtent -
            chipBottomMargin -
            chipHeight -
            8.0 -
            nameHeight;
        // 最終位置は SliverAppBar の縦中央
        // => ステータスバーの高さ + ( アプリバーの高さ - タイトルの高さ ) / 2
        final statusBarHeight = MediaQuery.paddingOf(context).top;
        final nameTopEnd = statusBarHeight + (kToolbarHeight - nameHeight) / 2;

        final nameTop = Tween<double>(
          begin: nameTopBegin,
          end: nameTopEnd,
        ).transform(t);

        children.add(
          Positioned(
            left: nameLeft,
            top: nameTop,
            child: Transform.scale(
              scale: scaleValue,
              alignment: Alignment.centerLeft,
              child: Text(
                '${sponsor.name} ${sponsor.name}',
                style: theme.textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );

        // Chip（SliverAppBarの裏側に隠れる効果）
        children.add(
          Positioned(
            left: 16,
            bottom: 16,
            child: Opacity(
              opacity: chipOpacity,
              child: Chip(
                label: Text(sponsor.basicPlanName),
                side: BorderSide(
                  color: colorScheme.outline,
                ),
                backgroundColor: colorScheme.surfaceContainerLow,
                labelStyle: theme.textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ),
        );

        return ClipRect(
          child: Stack(
            fit: StackFit.expand,
            children: children,
          ),
        );
      },
    );
  }
}

extension _BasicPlanName on Sponsor {
  String get basicPlanName => switch (this) {
    PlatinumSponsor() => 'Platinum',
    GoldSponsor() => 'Gold',
    SilverSponsor() => 'Silver',
    BronzeSponsor() => 'Bronze',
    OtherSponsor() => 'Other',
    IndividualSponsor() => 'Individual',
  };
}
