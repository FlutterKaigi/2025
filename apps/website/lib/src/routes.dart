import 'package:flutterkaigi_2025_website/config.dart' as config;
import 'package:flutterkaigi_2025_website/src/path.dart';
import 'package:flutterkaigi_2025_website/src/routes/_404.dart' as not_found;
import 'package:flutterkaigi_2025_website/src/routes/contents.dart' as config;
import 'package:flutterkaigi_2025_website/src/routes/index.dart' as index;
import 'package:flutterkaigi_2025_website/text.dart' show Language;
import 'package:web/web.dart';

typedef Handler = ({String title, HTMLElement Function() handle});

typedef Routes = Handler Function(Path path);

Handler routes(Path path) => switch (path.pattern) {
  [] => index.handler,
  ['contents', final String id] => config.handler(id),
  ['en', ...final sub] => () {
    config.user.lang = Language.en;
    return routes(Path(sub));
  }(),
  ['ja', ...final sub] => () {
    config.user.lang = Language.ja;
    return routes(Path(sub));
  }(),
  _ => not_found.handler,
};
