import 'package:app/core/gen/i18n/i18n.g.dart';
import 'package:app_catalog/widgetbook.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    TranslationProvider(
      child: const WidgetbookApp(),
    ),
  );
}
