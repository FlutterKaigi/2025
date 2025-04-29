import 'package:test/test.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:flutterkaigi_2025_website/src/path.dart';

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
    (Path([]), Path([]), '/'),
    (Path(['ja']), Path([]), '/ja'),
    (Path(['en']), Path([]), '/en'),
    (Path(['ja']), Path(['en']), '/en'),
    (Path(['en']), Path(['ja']), '/ja'),
    (Path(['ja']), Path(['tests']), '/ja/tests'),
    (Path(['en']), Path(['tests']), '/en/tests'),
    (Path(['ja']), Path(['en', 'tests']), '/en/tests'),
    (Path(['en']), Path(['ja', 'tests']), '/ja/tests'),
  ];

  for (final (path, newPath, want) in tests) {
    test('$path => $newPath', () {
      expect(path.go(newPath).toString(), equals(want));
    });
  }
}
