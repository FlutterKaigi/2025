import 'package:flutterkaigi_2025_website/src/path.dart';
import 'package:flutterkaigi_2025_website/src/routes.dart';
import 'package:web/web.dart';

HTMLElement get app => _app;

HTMLElement _app = () {
  window.onPopState.listen((_) => rerendering());
  return _routing(routes, currentPath);
}();

HTMLElement _routing(Routes routes, Path path) {
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
  _resetState();

  if (path != null) {
    window.history.pushState(null, '', path.toString());
  }

  final element = _routing(routes, path ?? currentPath);
  _app.replaceWith(element);
  _app = element;
}

final _onRemoves = <void Function()>[];

void _resetState() {
  for (final callback in _onRemoves) {
    callback();
  }
  _onRemoves.clear();
}

/// 画面更新時に実行されるコールバックを登録する
void onRemove(void Function() callback) {
  _onRemoves.add(callback);
}
