import 'package:web/web.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:flutterkaigi_2025_website/config.dart' as config;
import '../components.dart';
import '../path.dart';
import '../layouts.dart';
import '../routes.dart' show Handler;

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
    ..append(internalLink(text(contents.moveToTop), path: Path.go([]))),
);
