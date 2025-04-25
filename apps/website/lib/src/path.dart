import 'package:flutterkaigi_2025_website/text.dart' show Language;
import './path_stub.dart' if (dart.library.js_interop) './path_web.dart';

export './path_stub.dart' if (dart.library.js_interop) './path_web.dart';

class Path {
  final List<String> _path;
  Path(this._path);

  List<String> get pattern => _path;

  bool get isRoot => _path.isEmpty;

  Path.fromPathname(String pathname)
    : _path = pathname.split('/').where((n) => n.isNotEmpty).toList();

  factory Path.go(List<String> path) => currentPath.go(Path(path));

  /// パスに含まれている言語情報
  Language? get lang {
    if (isRoot) return null;

    return switch (_path.first) {
      'en' => Language.en,
      'ja' => Language.ja,
      _ => null,
    };
  }

  /// 言語情報を含むパス
  Path withLang(Language nextLang) => switch (lang) {
    Language _ => Path([nextLang.name, ..._path.skip(1)]),
    _ => Path([nextLang.name, ..._path]),
  };

  /// 言語情報を含まないパス
  Path withoutLang() {
    if (lang != null) return Path(_path.sublist(1));
    return this;
  }

  /// 新しいパスを生成
  /// - [path] 新しいパス
  Path go(Path nextPath) => switch ((lang, nextPath.lang)) {
    (Language currentLang, null) => nextPath.withLang(currentLang),
    _ => nextPath,
  };

  @override
  String toString() => '/${_path.join('/')}';
}
