import 'package:flutterkaigi_2025_website/text.dart' show Language;
import 'package:web/web.dart';

Language get systemLang => switch (window.navigator.language.split('-').first) {
  'en' => Language.en,
  _ => Language.ja,
};
