import 'package:flutterkaigi_2025_website/config.dart' as config;
import 'package:flutterkaigi_2025_website/src/components.dart';
import 'package:flutterkaigi_2025_website/src/layouts.dart';
import 'package:flutterkaigi_2025_website/src/path.dart';
import 'package:flutterkaigi_2025_website/src/routes.dart' show Handler;
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:web/web.dart';

Handler get handler => (
  title: config.makeTitle('Not Found'),
  handle: () => notFound,
);

HTMLElement get notFound => basicLayout(
  HTMLElement.main()
    ..style.display = 'flex'
    ..style.flexDirection = 'column'
    ..style.justifyContent = 'center'
    ..style.alignItems = 'center'
    ..style.fontSize = '2rem'
    ..style.padding = '1rem'
    ..textContent = '404 Not Found'
    ..append(internalLink(Text(text(contents.moveToTop)), path: Path.go())),
);
