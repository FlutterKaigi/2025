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
    (Path([]), Language.en, '/en'),
    (Path([]), Language.ja, '/ja'),
    (Path(['en']), Language.en, '/en'),
    (Path(['ja']), Language.ja, '/ja'),
    (Path(['en']), Language.ja, '/ja'),
    (Path(['ja']), Language.en, '/en'),
    (Path(['tests']), Language.en, '/en/tests'),
    (Path(['tests']), Language.ja, '/ja/tests'),
    (Path(['en', 'tests']), Language.en, '/en/tests'),
    (Path(['ja', 'tests']), Language.ja, '/ja/tests'),
    (Path(['en', 'tests']), Language.ja, '/ja/tests'),
    (Path(['ja', 'tests']), Language.en, '/en/tests'),
  ];

  for (final (path, lang, want) in tests) {
    test('$path with $lang', () {
      expect(path.withLang(lang).toString(), equals(want));
    });
  }
}

void testPathWithoutLang() {
  final tests = [
    (Path([]), '/'),
    (Path(['en']), '/'),
    (Path(['ja']), '/'),
    (Path(['tests']), '/tests'),
    (Path(['tests']), '/tests'),
    (Path(['en', 'tests']), '/tests'),
    (Path(['ja', 'tests']), '/tests'),
  ];

  for (final (path, want) in tests) {
    test('$path without lang', () {
      expect(path.withoutLang().toString(), equals(want));
    });
  }
}

void testPathGo() {
  final tests = [
    (Path([]), <String>[], '/'),
    (Path(['ja']), <String>[], '/ja'),
    (Path(['en']), <String>[], '/en'),
    (Path(['ja']), ['en'], '/en'),
    (Path(['en']), ['ja'], '/ja'),
    (Path(['ja']), ['tests'], '/ja/tests'),
    (Path(['en']), ['tests'], '/en/tests'),
    (Path(['ja']), ['en', 'tests'], '/en/tests'),
    (Path(['en']), ['ja', 'tests'], '/ja/tests'),
  ];

  for (final (path, newPath, want) in tests) {
    test('$path => $newPath', () {
      currentPath = path;
      expect(Path.go(newPath).toString(), equals(want));
    });
  }
}
