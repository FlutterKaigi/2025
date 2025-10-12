import 'dart:ui';
import 'package:app/features/sponsor/data/sponsor.dart';
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
    return ClipRect(
      child: Stack(
        fit: StackFit.expand,
        children: [
          _SponsorFlexibleSpaceBackground(
            sponsor: sponsor,
          ),
          _SponsorFlexibleSpaceCover(
            sponsor: sponsor,
          ),
        ],
      ),
    );
  }
}

class _SponsorFlexibleSpaceBackground extends StatelessWidget {
  const _SponsorFlexibleSpaceBackground({
    required this.sponsor,
  });

  final Sponsor sponsor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final settings = context
        .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    final deltaExtent = settings.deltaExtent;
    final t = settings.t;

    return LayoutBuilder(
      builder: (context, constraints) {
        // 背景画像の高さ
        final backgroundImageHeight = constraints.maxHeight > settings.maxExtent
            ? constraints.maxHeight
            : settings.maxExtent;

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

        final blurAmount = (constraints.maxHeight - settings.maxExtent) / 10.0;

        return Stack(
          children: [
            // 背景色
            const Positioned.fill(
              child: ColoredBox(
                color: Colors.white,
              ),
            ),

            // 背景画像
            Positioned(
              top: parallax,
              left: 0,
              right: 0,
              height: backgroundImageHeight,
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

            // 背景ブラー
            if (constraints.maxHeight > settings.maxExtent)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: blurAmount,
                    sigmaY: blurAmount,
                  ),
                  child: const ColoredBox(color: Colors.transparent),
                ),
              ),

            // 黒半透明オーバーレイ
            Positioned.fill(
              child: ColoredBox(
                color: colorScheme.surfaceContainer.withAlpha(
                  (t * 255).truncate(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SponsorFlexibleSpaceCover extends HookWidget {
  const _SponsorFlexibleSpaceCover({required this.sponsor});

  final Sponsor sponsor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final settings = context
        .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    final t = settings.t;

    // スポンサー名
    final sponsorNameTextKey = GlobalObjectKey(sponsor.name);
    final sponsorNameText = Text(
      key: sponsorNameTextKey,
      sponsor.name,
      style: theme.textTheme.titleLarge?.copyWith(
        color: t < 0.6 ? colorScheme.onInverseSurface : colorScheme.onSurface,
        fontWeight: FontWeight.bold,
      ),
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

    const contentHorizontalMargin = 16.0;
    const leadingWidth = 56.0;
    const basicPlanNameChipBottomMargin = 16.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        // ベーシックプラン名の透明度
        final basicPlanNameChipOpacity = (1.0 - t).clamp(0.0, 1.0);

        // スポンサー名のスケール
        final scaleValue = Tween<double>(
          begin: 1.2,
          end: 1,
        ).transform(t);

        // スポンサー名の左位置
        final nameLeft = Tween<double>(
          begin: contentHorizontalMargin,
          end: leadingWidth,
        ).transform(t);

        // スポンサー名の下位置
        final nameBottomBegin =
            basicPlanNameChipBottomMargin + basicPlanNameChipHeight.value + 8.0;
        final nameBottomEnd =
            (kToolbarHeight - sponsorNameTextHeight.value) / 2;

        final nameBottom = Tween<double>(
          begin: nameBottomBegin,
          end: nameBottomEnd,
        ).transform(t);

        return Stack(
          children: [
            Positioned(
              left: contentHorizontalMargin,
              bottom: basicPlanNameChipBottomMargin,
              child: Opacity(
                // 高さが取得できていない場合は位置がずれているため透明にする
                opacity: basicPlanNameChipHeight.value == 0
                    ? 0
                    : basicPlanNameChipOpacity,
                child: basicPlanNameChip,
              ),
            ),
            Positioned(
              left: nameLeft,
              bottom: nameBottom,
              child: Transform.scale(
                scale: scaleValue,
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  // スケール値を考慮して幅を計算
                  width:
                      (constraints.maxWidth -
                          nameLeft -
                          contentHorizontalMargin) /
                      scaleValue,
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
          ],
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
    ToolSponsor() => 'Tool',
    OtherSponsor() => 'Other',
    IndividualSponsor() => 'Individual',
  };
}

extension _FlexibleSpaceBarSettingsX on FlexibleSpaceBarSettings {
  /// 最大値と最小値の差
  double get deltaExtent => maxExtent - minExtent;

  /// 現在のスクロール量を 0.0 から 1.0 の範囲に正規化した値
  double get t => deltaExtent == 0.0
      ? 1.0
      : (1.0 - (currentExtent - minExtent) / deltaExtent).clamp(0.0, 1.0);
}
