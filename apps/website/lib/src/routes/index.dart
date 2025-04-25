import 'package:web/web.dart';
import 'package:flutterkaigi_2025_website/app.dart' show onRemove;
import 'dart:async';
import 'package:flutterkaigi_2025_website/config.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import '../components.dart';
import '../layouts.dart';
import '../path.dart';

/// 秒数まで表示する
HTMLElement _countdown() {
  String countdown(Duration diff) {
    final days = diff.inDays;
    final hours = diff.inHours.remainder(24);
    final minutes = diff.inMinutes.remainder(60);
    final seconds = diff.inSeconds.remainder(60);
    return text((
      ja: '開催まで $days 日と $hours 時間 $minutes 分 $seconds 秒',
      en: 'Countdown $days days $hours hours $minutes minutes $seconds seconds',
    ));
  }

  final element =
      HTMLSpanElement()
        ..style.fontSize = '1.5rem'
        ..textContent = countdown(event.date.difference(DateTime.now()));

  final timer = Timer.periodic(
    const Duration(seconds: 1),
    (timer) =>
        element.textContent = countdown(event.date.difference(DateTime.now())),
  );
  onRemove(() => timer.cancel());

  return element;
}

HTMLElement get index => basicLayout(
  HTMLElement.main()
    ..style.display = 'flex'
    ..style.flexDirection = 'column'
    ..style.justifyContent = 'center'
    ..style.alignItems = 'center'
    ..style.gap = '0.5rem'
    ..append(
      HTMLHeadingElement.h1()
        ..style.fontSize = '2rem'
        ..textContent = event.title,
    )
    ..append(
      internalLink(
        text((ja: 'コンテンツ例', en: 'e.g. Contents')),
        path: Path.go(const ['contents', '1']),
      ),
    )
    ..append(
      internalLink(
        text((ja: '404の例', en: 'e.g. 404')),
        path: Path.go(const ['contents', '1', 'x']),
      ),
    )
    ..append(_countdown())
    ..append(
      externalLink(
        event.blog.sponsorship.title,
        url: event.blog.sponsorship.url,
      ),
    )
    ..append(
      HTMLImageElement()
        ..style.width = '40rem'
        ..src = '/img/flutterkaigi_dash.png',
    )
    ..append(
      HTMLParagraphElement()
        ..style.fontSize = '1.5rem'
        ..textContent = text(contents.date),
    ),
);
