import 'package:app/core/designsystem/theme/color_schemes.dart';
import 'package:app/core/gen/assets/fonts.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() {
  final baseTypography = Typography.material2021(
    platform: defaultTargetPlatform,
  );
  final baseTextTheme = baseTypography.white;
  FontVariation fontVariationForWeight(FontWeight weight) =>
      FontVariation('wght', (weight.index + 1) * 100);

  final textTheme = TextTheme(
    bodyLarge: baseTextTheme.bodyLarge!.copyWith(
      fontVariations: [
        fontVariationForWeight(FontWeight.normal),
      ],
    ),
    bodyMedium: baseTextTheme.bodyMedium!.copyWith(
      fontVariations: [fontVariationForWeight(FontWeight.normal)],
    ),
    bodySmall: baseTextTheme.bodySmall!.copyWith(
      fontVariations: [
        fontVariationForWeight(FontWeight.normal),
      ],
    ),
    labelLarge: baseTextTheme.labelLarge!.copyWith(
      fontVariations: [
        fontVariationForWeight(FontWeight.normal),
      ],
    ),
    labelMedium: baseTextTheme.labelMedium!.copyWith(
      fontVariations: [
        fontVariationForWeight(FontWeight.normal),
      ],
    ),
    labelSmall: baseTextTheme.labelSmall!.copyWith(
      fontVariations: [
        fontVariationForWeight(FontWeight.normal),
      ],
    ),
    titleLarge: baseTextTheme.titleLarge!.copyWith(
      fontVariations: [
        fontVariationForWeight(FontWeight.normal),
      ],
    ),
    titleMedium: baseTextTheme.titleMedium!.copyWith(
      fontVariations: [
        fontVariationForWeight(FontWeight.normal),
      ],
    ),
    titleSmall: baseTextTheme.titleSmall!.copyWith(
      fontVariations: [
        fontVariationForWeight(FontWeight.normal),
      ],
    ),
  );

  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    useMaterial3: true,
    useSystemColors: true,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
    ),
    splashFactory: NoSplash.splashFactory,
    fontFamily: FontFamily.notoSansMono,
    fontFamilyFallback: const [
      FontFamily.notoSansJP,
    ],
    textTheme: textTheme,
  );
}
