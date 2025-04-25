import 'package:web/web.dart';
import './path.dart';
import 'dart:js_interop';

/// 現在のパス
Path get currentPath {
  final pathname = window.location.pathname;
  console.debug('currentPath: $pathname'.toJS);
  return Path.fromPathname(pathname);
}
