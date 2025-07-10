import 'package:dashboard/core/designsystem/theme/theme.dart';
import 'package:dashboard/core/gen/l10n/l10n.dart';
import 'package:dashboard_catalog/widgetbook.directories.g.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Widgetbook.material(
        directories: directories,
        darkTheme: darkTheme(),
        themeMode: ThemeMode.dark,
        addons: <WidgetbookAddon>[
          DeviceFrameAddon(
            devices: [
              Devices.ios.iPhoneSE,
              Devices.ios.iPhone13,
              Devices.ios.iPad,
              Devices.android.smallPhone.copyWith(name: 'small Android phone'),
              Devices.android.mediumPhone.copyWith(
                name: 'medium Android phone',
              ),
              Devices.android.largeTablet.copyWith(
                name: 'large Android tablet',
              ),
            ],
          ),
          InspectorAddon(enabled: true),
          MaterialThemeAddon(
            themes: <WidgetbookTheme<ThemeData>>[
              WidgetbookTheme<ThemeData>(
                name: 'Dark',
                data: darkTheme(),
              ),
              WidgetbookTheme<ThemeData>(
                name: 'Light',
                data: ThemeData(),
              ),
            ],
          ),
          LocalizationAddon(
            localizationsDelegates: L10n.localizationsDelegates,
            locales: L10n.supportedLocales,
            initialLocale: L10n.supportedLocales.first,
          ),
          TextScaleAddon(
            min: 1,
            divisions: 4,
          ),
          // MEMO: https://github.com/widgetbook/widgetbook/issues/1222
          BuilderAddon(
            name: 'Navigator Addon',
            builder: (context, child) => Navigator(
              onGenerateRoute: (_) => PageRouteBuilder(
                pageBuilder: (context, _, __) => child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
