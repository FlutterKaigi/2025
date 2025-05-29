import 'package:flutterkaigi_2025_website/src/path.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:test/test.dart';

void main() {
  group('Path.withLang', testPathWithLang);
  group('Path.withoutLang', testPathWithoutLang);
  group('Path.go', testPathGo);
}

void testPathWithLang() {
  final tests = [
    (const Path([]), Language.en, '/en'),
    (const Path([]), Language.ja, '/ja'),
    (const Path(['en']), Language.en, '/en'),
    (const Path(['ja']), Language.ja, '/ja'),
    (const Path(['en']), Language.ja, '/ja'),
    (const Path(['ja']), Language.en, '/en'),
    (const Path(['tests']), Language.en, '/en/tests'),
    (const Path(['tests']), Language.ja, '/ja/tests'),
    (const Path(['en', 'tests']), Language.en, '/en/tests'),
    (const Path(['ja', 'tests']), Language.ja, '/ja/tests'),
    (const Path(['en', 'tests']), Language.ja, '/ja/tests'),
    (const Path(['ja', 'tests']), Language.en, '/en/tests'),
  ];

  for (final (path, lang, want) in tests) {
    test('$path with $lang', () {
      expect(path.withLang(lang).toString(), equals(want));
    });
  }
}

void testPathWithoutLang() {
  final tests = [
    (const Path([]), '/'),
    (const Path(['en']), '/'),
    (const Path(['ja']), '/'),
    (const Path(['tests']), '/tests'),
    (const Path(['tests']), '/tests'),
    (const Path(['en', 'tests']), '/tests'),
    (const Path(['ja', 'tests']), '/tests'),
  ];

  for (final (path, want) in tests) {
    test('$path without lang', () {
      expect(path.withoutLang().toString(), equals(want));
    });
  }
}

void testPathGo() {
  final tests = [
    (const Path([]), <String>[], '/'),
    (const Path(['ja']), <String>[], '/ja'),
    (const Path(['en']), <String>[], '/en'),
    (const Path(['ja']), ['en'], '/en'),
    (const Path(['en']), ['ja'], '/ja'),
    (const Path(['ja']), ['tests'], '/ja/tests'),
    (const Path(['en']), ['tests'], '/en/tests'),
    (const Path(['ja']), ['en', 'tests'], '/en/tests'),
    (const Path(['en']), ['ja', 'tests'], '/ja/tests'),
  ];

  for (final (path, newPath, want) in tests) {
    test('$path => $newPath', () {
      expect(path.go(Path(newPath)).toString(), equals(want));
    });
  }
}
