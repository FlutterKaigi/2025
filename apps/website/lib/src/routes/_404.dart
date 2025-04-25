import 'package:web/web.dart';
import '../components.dart';
import '../path.dart';
import '../layouts.dart';
import 'package:flutterkaigi_2025_website/text.dart';

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
