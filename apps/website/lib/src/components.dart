import 'dart:js_interop';
import 'package:flutterkaigi_2025_website/app.dart' show rerendering;
import 'package:flutterkaigi_2025_website/src/path.dart' show Path;
import 'package:web/web.dart';

extension HTMLElementAppendAll on HTMLElement {
  void appendAll(Iterable<JSAny> elements) {
    for (final e in elements) {
      append(e);
    }
  }
}

/// サイト外リンク
HTMLAnchorElement externalLink(
  String text, {
  required String url,
  String target = '_blank',
}) =>
    HTMLAnchorElement()
      ..style.textDecoration = 'underline'
      ..style.color = 'var(--link-color)'
      ..style.cursor = 'pointer'
      ..target = target
      ..href = url
      ..textContent = text;

/// サイト内リンク
/// - [content] リンクコンテンツ
/// - [path] リンクパス
/// - [target] リンクターゲット
HTMLAnchorElement internalLink(
  JSAny content, {
  required Path path,
  String target = '_top',
}) =>
    HTMLAnchorElement()
      ..style.textDecoration = 'underline'
      ..style.color = 'var(--link-color)'
      ..style.cursor = 'pointer'
      ..target = target
      ..href = path.toString()
      ..append(content)
      ..onClick.listen((event) {
        event.preventDefault();
        rerendering(path);
      });
