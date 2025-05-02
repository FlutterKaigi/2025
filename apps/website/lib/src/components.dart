import 'package:flutterkaigi_2025_website/app.dart' show rerendering;
import 'package:flutterkaigi_2025_website/src/path.dart' show Path;
import 'package:web/web.dart';

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
/// - [text] リンクテキスト
/// - [path] リンクパス
/// - [target] リンクターゲット
HTMLAnchorElement internalLink(
  String text, {
  required Path path,
  String target = '_top',
}) =>
    HTMLAnchorElement()
      ..style.textDecoration = 'underline'
      ..style.color = 'var(--link-color)'
      ..style.cursor = 'pointer'
      ..target = target
      ..href = path.toString()
      ..textContent = text
      ..onClick.listen((event) {
        event.preventDefault();
        final element = event.target! as HTMLAnchorElement;
        rerendering(Path.fromPathname(URL(element.href).pathname));
      });
