import 'dart:ui';
import 'package:dashboard/features/sponsor/data/sponsor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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

class _SponsorFlexibleSpace extends HookWidget {
  const _SponsorFlexibleSpace({required this.sponsor});

  final Sponsor sponsor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // スポンサー名
    final sponsorNameTextKey = GlobalObjectKey(sponsor.name);
    final sponsorNameText = Text(
      key: sponsorNameTextKey,
      sponsor.name,
      style: theme.textTheme.titleLarge,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );

    final sponsorNameTextHeight = useState<double>(0);
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final textRenderBox =
              sponsorNameTextKey.currentContext?.findRenderObject()
                  as RenderBox?;
          if (textRenderBox != null) {
            sponsorNameTextHeight.value = textRenderBox.size.height;
          }
        });
        return null;
      },
      [
        sponsor.name,
        theme.textTheme.titleLarge,
      ],
    );

    // ベーシックプラン名
    final basicPlanNameChipKey = GlobalObjectKey(sponsor.basicPlanName);
    final basicPlanNameChip = Chip(
      key: basicPlanNameChipKey,
      label: Text(sponsor.basicPlanName),
      side: BorderSide(color: colorScheme.outline),
      backgroundColor: colorScheme.surfaceContainerLow,
      labelStyle: theme.textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurface,
      ),
    );

    final basicPlanNameChipHeight = useState<double>(0);
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final chipRenderBox =
              basicPlanNameChipKey.currentContext?.findRenderObject()
                  as RenderBox?;
          if (chipRenderBox != null) {
            basicPlanNameChipHeight.value = chipRenderBox.size.height;
          }
        });
        return null;
      },
      [
        sponsor.basicPlanName,
        theme.textTheme.labelMedium,
      ],
    );

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
        var flexibleSpaceHeight = settings.maxExtent;
        if (stretchModes.contains(StretchMode.zoomBackground) &&
            constraints.maxHeight > flexibleSpaceHeight) {
          flexibleSpaceHeight = constraints.maxHeight;
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
            height: flexibleSpaceHeight,
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

        // サイズのアニメーション（1.2 → 1.0）
        const expandedTitleScale = 1.2;
        final scaleValue = Tween<double>(
          begin: expandedTitleScale,
          end: 1,
        ).transform(t);

        // スポンサー名の位置移動アニメーション
        final nameLeft = Tween<double>(
          begin: 16, // 初期位置（左端）
          end: 56, // leading右端（leadingボタンの幅56）
        ).transform(t);

        const chipBottomMargin = 16.0;

        // 初期位置はベーシックプラン名の 8 ポイント上の位置
        final nameTopBegin =
            settings.maxExtent -
            chipBottomMargin -
            basicPlanNameChipHeight.value -
            8.0 -
            sponsorNameTextHeight.value;
        // 最終位置は SliverAppBar の縦中央
        // => ステータスバーの高さ + ( アプリバーの高さ - タイトルの高さ ) / 2
        final statusBarHeight = MediaQuery.paddingOf(context).top;
        final nameTopEnd =
            statusBarHeight +
            (kToolbarHeight - sponsorNameTextHeight.value) / 2;

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
              child: SizedBox(
                // スケール値を考慮して幅を計算
                width: (constraints.maxWidth - nameLeft - 16) / scaleValue,
                // 高さを固定して中央配置を安定させる
                // 実際の高さが取得できていない場合は null で自動調整
                height: sponsorNameTextHeight.value > 0
                    ? sponsorNameTextHeight.value
                    : null,
                child: Opacity(
                  // 高さが取得できていない場合は位置がずれているため透明にする
                  opacity: sponsorNameTextHeight.value == 0 ? 0 : 1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: sponsorNameText,
                  ),
                ),
              ),
            ),
          ),
        );

        // ベーシックプラン名の透明度
        final basicPlanNameChipOpacity = (1.0 - t).clamp(0.0, 1.0);

        children.add(
          Positioned(
            left: 16,
            bottom: 16,
            child: Opacity(
              // 高さが取得できていない場合は位置がずれているため透明にする
              opacity: basicPlanNameChipHeight.value == 0
                  ? 0
                  : basicPlanNameChipOpacity,
              child: basicPlanNameChip,
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
