import 'package:web/web.dart';
import './src/routes/index.dart';
import './src/routes/contents.dart';
import './src/path.dart';
import './src/routes/_404.dart';
import 'package:flutterkaigi_2025_website/text.dart' show Language;
import 'package:flutterkaigi_2025_website/config.dart' as config;

typedef _Page = (HTMLElement, {String title});

_Page _routes(Path path) => switch (path.pattern) {
  [] => (index, title: config.makeTitle()),
  ['contents'] => (contents(''), title: config.makeTitle('Contents')),
  ['contents', String id] => (contents(id), title: config.makeTitle('Contents')),
  ['en', ...final sub] => () {
    config.user.lang = Language.en;
    return _routes(Path(sub));
  }(),
  ['ja', ...final sub] => () {
    config.user.lang = Language.ja;
    return _routes(Path(sub));
  }(),
  _ => (notFound, title: config.makeTitle('Not Found')),
};

get app => _app;

HTMLElement _app = () {
  window.onPopState.listen((_) => rerender());
  return _routing(_routes, currentPath);
}();

HTMLElement _routing(_Page Function(Path) routes, Path path) {
  final timeLabel = 'dart routing $path';

  try {
    console.time(timeLabel);

    if (path == currentPath) return _app;
    final page = routes(path);

    document.title = page.title;
    window.history.pushState(null, '', path.toString());

    return page.$1;
  } finally {
    console.timeEnd(timeLabel);
  }
}

void rerender([Path? path]) {
  final element = _routing(_routes, path ?? currentPath);
  _app.replaceWith(element);
  _app = element;
}
