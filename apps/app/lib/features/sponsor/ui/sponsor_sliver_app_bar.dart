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

  final CompanySponsor sponsor;
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

  final CompanySponsor sponsor;

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

  final CompanySponsor sponsor;

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

    const contentHorizontalMargin = 16.0;
    const leadingWidth = 56.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        // スポンサー名の左位置（常にleadingWidthに固定）
        const nameLeft = leadingWidth;

        // スポンサー名の下位置（常にヘッダー中央に固定）
        final nameBottom = (kToolbarHeight - sponsorNameTextHeight.value) / 2;

        // スクロール完了が近づくにつれて表示
        // t=0.0(展開)のとき透明、t=1.0(収縮)のとき不透明
        final nameOpacity = sponsorNameTextHeight.value == 0
            ? 0.0
            : t.clamp(0.0, 1.0);

        // ignore: avoid_single_child
        return Stack(
          children: [
            Positioned(
              left: nameLeft,
              bottom: nameBottom,
              child: SizedBox(
                width:
                    constraints.maxWidth - nameLeft - contentHorizontalMargin,
                height: sponsorNameTextHeight.value > 0
                    ? sponsorNameTextHeight.value
                    : null,
                child: Opacity(
                  opacity: nameOpacity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: sponsorNameText,
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

extension _FlexibleSpaceBarSettingsX on FlexibleSpaceBarSettings {
  /// 最大値と最小値の差
  double get deltaExtent => maxExtent - minExtent;

  /// 現在のスクロール量を 0.0 から 1.0 の範囲に正規化した値
  double get t => deltaExtent == 0.0
      ? 1.0
      : (1.0 - (currentExtent - minExtent) / deltaExtent).clamp(0.0, 1.0);
}
