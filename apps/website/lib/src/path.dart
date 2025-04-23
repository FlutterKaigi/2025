import 'package:web/web.dart';
import 'package:flutterkaigi_2025_website/text.dart' show Language;

/// 現在のパス
Path get currentPath => Path.fromPathname(window.location.pathname);

class Path {
  final List<String> _path;
  Path(this._path);

  List<String> get pattern => _path;

  bool get isRoot => _path.isEmpty;

  Path.fromPathname(String pathname)
    : _path = pathname.split('/').where((n) => n.isNotEmpty).toList();

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
  Path withLang(Language lang) {
    if (isRoot) return Path([lang.name]);
    if (this.lang == lang) return this;
    return Path([lang.name, ..._path]);
  }

  /// 言語情報を含まないパス
  Path withoutLang() {
    if (isRoot) return this;
    if (['ja', 'en'].contains(_path.first)) return Path(_path.sublist(1));
    return this;
  }

  /// 新しいパスを生成
  /// - [path] 新しいパス
  Path newPath(Path newPath) => switch ((currentPath.lang, lang)) {
    (Language currentLang, null) => newPath.withLang(currentLang),
    _ => newPath,
  };

  @override
  String toString() => '/${_path.join('/')}';
}
