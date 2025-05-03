import 'dart:async';

import 'package:flutterkaigi_2025_website/app.dart' show onRemove;
import 'package:flutterkaigi_2025_website/config.dart';
import 'package:flutterkaigi_2025_website/src/components.dart';
import 'package:flutterkaigi_2025_website/src/layouts.dart';
import 'package:flutterkaigi_2025_website/src/path.dart';
import 'package:flutterkaigi_2025_website/src/routes.dart' show Handler;
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:web/web.dart';

Handler get handler => (title: makeTitle(), handle: () => index);

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
  onRemove(timer.cancel);

  return element;
}

HTMLElement get _schedule {
  final list =
      HTMLUListElement()
        ..style.display = 'grid'
        ..style.paddingLeft = '1rem';
  for (final schedule in event.schedule) {
    list.append(
      HTMLLIElement()
        ..style.display = 'list-item'
        ..style.listStyle = 'circle'
        ..append(HTMLSpanElement()..textContent = text(schedule.title))
        ..append(Text(' : '))
        ..append(HTMLSpanElement()..textContent = schedule.date.toString()),
    );
  }

  final element =
      HTMLDivElement()
        ..append(
          HTMLHeadingElement.h2()
            ..style.fontSize = '1.5rem'
            ..textContent = text(contents.scheduleLabel),
        )
        ..append(list);
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
      HTMLParagraphElement()
        ..style.display = 'grid'
        ..textContent = 'e.g. リンク実装例'
        ..append(
          HTMLUListElement()
            ..style.display = 'grid'
            ..append(
              HTMLLIElement()..append(
                internalLink(
                  text((ja: 'コンテンツ例', en: 'e.g. Contents')),
                  path: Path.go(const ['contents', '1']),
                ),
              ),
            )
            ..append(
              HTMLLIElement()..append(
                internalLink(
                  text((ja: '404の例', en: 'e.g. 404')),
                  path: Path.go(const ['contents', '1', 'x']),
                ),
              ),
            ),
        ),
    )
    ..append(
      HTMLParagraphElement()
        ..style.fontSize = '1.5rem'
        ..textContent = text((
          ja: '${contents.date.ja} 開催決定!',
          en: 'Confirmed on ${contents.date.en}!',
        )),
    )
    ..append(_countdown())
    ..append(
      externalLink(
        text(event.blog.sponsorship.title),
        url: text(event.blog.sponsorship.url),
      ),
    )
    ..append(
      HTMLDivElement()
        ..style.display = 'block'
        ..style.width = '20rem'
        ..style.height = '25rem'
        ..style.overflow = 'hidden'
        ..append(
          HTMLImageElement()
            ..style.width = '20rem'
            ..style.animation = '1s linear infinite alternate bounding'
            ..src = '/img/flutterkaigi_dash.png',
        ),
    )
    ..append(_schedule),
);
