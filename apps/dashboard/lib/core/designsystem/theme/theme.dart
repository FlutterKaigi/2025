import 'package:dashboard/core/designsystem/theme/color_schemes.dart';
import 'package:flutter/material.dart';

/// Create a light theme.
ThemeData lightTheme({ColorScheme? colorScheme}) => _createTheme(
  colorScheme: colorScheme ?? lightColorScheme,
);

/// Create a dark theme.
ThemeData darkTheme({ColorScheme? colorScheme}) => _createTheme(
  colorScheme: colorScheme ?? darkColorScheme,
);

ThemeData _createTheme({
  required ColorScheme colorScheme,
}) => ThemeData.from(
  colorScheme: colorScheme,
);
