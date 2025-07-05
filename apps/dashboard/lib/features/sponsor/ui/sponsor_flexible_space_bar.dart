import 'dart:ui';
import 'package:dashboard/features/sponsor/data/sponsor.dart';
import 'package:flutter/material.dart';

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

class SponsorFlexibleSpaceBar extends StatelessWidget {
  const SponsorFlexibleSpaceBar({
    required this.sponsor,
    super.key,
    this.expandedTitleScale = 1.2,
    this.stretchModes = const <StretchMode>[
      StretchMode.zoomBackground,
      StretchMode.blurBackground,
      StretchMode.fadeTitle,
    ],
  });

  final Sponsor sponsor;
  final double expandedTitleScale;
  final List<StretchMode> stretchModes;

  @override
  Widget build(BuildContext context) {
    final settings = context
        .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final deltaExtent = settings.maxExtent - settings.minExtent;
    final t = clampDouble(
      1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent,
      0,
      1,
    );
    // 背景
    final children = <Widget>[
      Positioned.fill(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Align(
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
              // ロゴ画像は白背景で渡ってくるため、ブラーで黒くしてスポンサー名を見やすくする
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(),
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
    // タイトルとChip
    final scaleValue = Tween<double>(
      begin: expandedTitleScale,
      end: 1,
    ).transform(t);
    final scaleTransform = Matrix4.identity()..scale(scaleValue, scaleValue, 1);
    // Chipの透明度（collapsed時は非表示）
    final chipOpacity = 1.0 - t;
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
              DefaultTextStyle(
                style: textTheme.titleLarge!.copyWith(
                  color: textTheme.titleLarge!.color!.withOpacity(
                    settings.toolbarOpacity,
                  ),
                ),
                child: Text(sponsor.name),
              ),
              const SizedBox(height: 8),
              AnimatedOpacity(
                opacity: chipOpacity,
                duration: const Duration(milliseconds: 200),
                child: Chip(
                  label: Text(sponsor.basicPlanName),
                  backgroundColor: colorScheme.secondaryContainer,
                  labelStyle: textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return LayoutBuilder(
      builder: (context, constraints) {
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
