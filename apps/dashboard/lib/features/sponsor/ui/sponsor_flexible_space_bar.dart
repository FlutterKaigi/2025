import 'dart:ui';
import 'package:dashboard/features/sponsor/data/sponsor.dart';
import 'package:flutter/material.dart';

class SponsorFlexibleSpaceBar extends StatelessWidget {
  const SponsorFlexibleSpaceBar({
    required this.sponsor,
    super.key,
  });

  final Sponsor sponsor;

  @override
  Widget build(BuildContext context) {
    final settings = context
        .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    const expandedTitleScale = 1.2;
    const stretchModes = <StretchMode>[
      StretchMode.zoomBackground,
      StretchMode.blurBackground,
      StretchMode.fadeTitle,
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final deltaExtent = settings.maxExtent - settings.minExtent;
        final t =
            (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
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

        // 背景
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

        // タイトルとChip
        final scaleValue = Tween<double>(
          begin: expandedTitleScale,
          end: 1,
        ).transform(t);
        final scaleTransform = Matrix4.identity()
          ..scale(scaleValue, scaleValue, 1);
        // StretchMode.fadeTitle
        var titleOpacity = 1.0;
        if (stretchModes.contains(StretchMode.fadeTitle) &&
            constraints.maxHeight > settings.maxExtent) {
          titleOpacity =
              1.0 -
              ((constraints.maxHeight - settings.maxExtent) / 100.0).clamp(
                0.0,
                1.0,
              );
        }
        children.add(
          Positioned(
            left: 16,
            bottom: 16,
            child: Transform(
              alignment: Alignment.bottomLeft,
              transform: scaleTransform,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Opacity(
                    opacity: titleOpacity,
                    child: DefaultTextStyle(
                      style: textTheme.titleLarge!.copyWith(
                        color: textTheme.titleLarge!.color!.withValues(
                          alpha: settings.toolbarOpacity,
                        ),
                      ),
                      child: Text(sponsor.name),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Chip(
                    label: Text(sponsor.basicPlanName),
                    side: BorderSide(
                      color: colorScheme.outline,
                    ),
                    backgroundColor: colorScheme.surfaceContainerLow,
                    labelStyle: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
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
