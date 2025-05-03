import 'package:flutterkaigi_2025_website/config.dart';
import 'package:flutterkaigi_2025_website/src/components.dart';
import 'package:flutterkaigi_2025_website/src/layouts.dart';
import 'package:flutterkaigi_2025_website/src/routes.dart' show Handler;
import 'package:web/web.dart';

Handler handler(String msg) => (
  title: makeTitle("Dash say '$msg'"),
  handle: () => dashsay(msg),
);

HTMLElement dashsay(String msg) => basicLayout(
  HTMLElement.main()
    ..style.display = 'flex'
    ..style.flexDirection = 'row'
    ..style.gap = '1rem'
    ..style.justifyContent = 'center'
    ..style.alignItems = 'center'
    ..style.padding = '1rem'
    ..appendAll([
      HTMLParagraphElement()
        ..style.padding = '1rem'
        ..style.border = '1px solid var(--border-color)'
        ..style.borderRadius = '1rem 1rem 0 1rem'
        ..style.fontSize = '2em'
        ..textContent = Uri.decodeFull(msg),
      HTMLImageElement()
        ..style.width = '16em'
        ..style.animation = '1.5s ease-in-out infinite alternate bounding'
        ..alt = 'FlutterKaigi Dash'
        ..src = '/img/flutterkaigi_dash.png',
    ]),
);
