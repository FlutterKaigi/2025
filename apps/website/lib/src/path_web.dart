import 'dart:js_interop';

import 'package:flutterkaigi_2025_website/src/path.dart';
import 'package:web/web.dart';

/// 現在のパス
Path get currentPath {
  final pathname = window.location.pathname;
  console.debug('currentPath: $pathname'.toJS);
  return Path.fromPathname(pathname);
}
