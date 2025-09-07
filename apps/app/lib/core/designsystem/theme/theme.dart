import 'package:app/core/designsystem/theme/color_schemes.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() =>
    ThemeData.dark(
      useMaterial3: true,
    ).copyWith(
      brightness: Brightness.dark,
      colorScheme: darkColorScheme,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        scrolledUnderElevation: 0,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      splashFactory: NoSplash.splashFactory,
    );
