import 'package:web/web.dart';
import './src/routes/index.dart';
import './src/routes/contents.dart';
import './src/path.dart';
import './src/routes/_404.dart';
import 'package:flutterkaigi_2025_website/text.dart' show Language;
import 'package:flutterkaigi_2025_website/config.dart' as config;

typedef _Handler = ({String title, HTMLElement Function() handle});

_Handler _routes(Path path) => switch (path.pattern) {
  [] => (title: config.makeTitle(), handle: () => index),
  ['contents'] => (
    title: config.makeTitle('Contents'),
    handle: () => contents(''),
  ),
  ['contents', String id] => (
    title: config.makeTitle('Contents'),
    handle: () => contents(id),
  ),
  ['en', ...final sub] => () {
    config.user.lang = Language.en;
    return _routes(Path(sub));
  }(),
  ['ja', ...final sub] => () {
    config.user.lang = Language.ja;
    return _routes(Path(sub));
  }(),
  _ => (title: config.makeTitle('Not Found'), handle: () => notFound),
};

get app => _app;

HTMLElement _app = () {
  window.onPopState.listen((_) => rerendering());
  return _routing(_routes, currentPath);
}();

HTMLElement _routing(_Handler Function(Path) routes, Path path) {
  final timeLabel = 'dart routing $path';

  try {
    console.time(timeLabel);

    // if (path == currentPath) return _app;
    final page = routes(path);

    document.title = page.title;

    return page.handle();
  } finally {
    console.timeEnd(timeLabel);
  }
}

void rerendering([Path? path]) {
  if (path != null) window.history.pushState(null, '', path.toString());
  final element = _routing(_routes, path ?? currentPath);
  _app.replaceWith(element);
  _app = element;
}
