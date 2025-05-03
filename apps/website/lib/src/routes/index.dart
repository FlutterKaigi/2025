import 'dart:async';

import 'package:flutterkaigi_2025_website/app.dart' show onRemove;
import 'package:flutterkaigi_2025_website/config.dart';
import 'package:flutterkaigi_2025_website/src/components.dart';
import 'package:flutterkaigi_2025_website/src/layouts.dart';
import 'package:flutterkaigi_2025_website/src/routes.dart' show Handler;
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:web/web.dart';

Handler get handler => (title: makeTitle(), handle: () => index);

HTMLElement get index => basicLayout(
  HTMLElement.main()
    ..style.display = 'flex'
    ..style.flexDirection = 'column'
    ..style.alignItems = 'center'
    ..style.gap = '2rem'
    ..appendAll([_mainContent..style.minHeight = '70vh', _schedule]),
);

HTMLElement get _mainContent =>
    HTMLElement.article()
      ..style.display = 'flex'
      ..style.flexDirection = 'column'
      ..style.justifyContent = 'center'
      ..style.alignItems = 'center'
      ..style.padding = '0 2rem'
      ..appendAll([
        HTMLHeadingElement.h1()..append(
          HTMLImageElement()
            ..style.width = '9rem'
            ..alt = '${site.title} logo'
            ..src = '/img/icon_flutterkaigi.svg',
        ),
        HTMLParagraphElement()
          ..style.fontSize = '2rem'
          ..textContent = formatDate(event.date),
        HTMLParagraphElement()
          ..style.marginTop = '1rem'
          ..style.fontSize = '1.2rem'
          ..textContent = text((
            ja: '${contents.placeLabel.ja} ${event.place.name.ja}',
            en: '${contents.placeLabel.en} ${event.place.name.en}',
          )),
        HTMLParagraphElement()
          ..style.position = 'relative'
          ..style.marginTop = '1rem'
          ..appendAll([
            externalLink(
              text(event.blog.sponsorship.title),
              url: text(event.blog.sponsorship.url),
            ),
            HTMLImageElement()
              ..style.position = 'absolute'
              ..style.left = '100%'
              ..style.bottom = '-50%'
              ..style.height = '5rem'
              ..alt = 'FlutterKaigi Dash'
              ..src = '/img/flutterkaigi_dash.png',
          ]),
        _countdown..style.marginTop = '1rem',
      ]);

/// 秒数まで表示する
HTMLElement get _countdown {
  ({int days, int hours, int minutes, int seconds}) countdown(Duration diff) {
    final days = diff.inDays;
    final hours = diff.inHours.remainder(24);
    final minutes = diff.inMinutes.remainder(60);
    final seconds = diff.inSeconds.remainder(60);
    return (days: days, hours: hours, minutes: minutes, seconds: seconds);
  }

  final count = countdown(event.date.difference(DateTime.now()));

  final days =
      HTMLSpanElement()
        ..style.color = 'var(--secondary-color)'
        ..textContent = '${count.days}';
  final hours =
      HTMLSpanElement()
        ..style.color = 'var(--secondary-color)'
        ..textContent = '${count.hours}';
  final minutes =
      HTMLSpanElement()
        ..style.color = 'var(--secondary-color)'
        ..textContent = '${count.minutes}';
  final seconds =
      HTMLSpanElement()
        ..style.color = 'var(--primary-color)'
        ..textContent = '${count.seconds}';

  final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    final count = countdown(event.date.difference(DateTime.now()));
    days.textContent = '${count.days}';
    hours.textContent = '${count.hours}';
    minutes.textContent = '${count.minutes}';
    seconds.textContent = '${count.seconds}';
  });
  onRemove(timer.cancel);

  HTMLElement cell(HTMLElement element, String text) =>
      HTMLSpanElement()
        ..style.display = 'flex'
        ..style.flexDirection = 'column'
        ..style.alignItems = 'center'
        ..style.fontSize = '0.9rem'
        ..appendAll([
          element
            ..style.display = 'block'
            ..style.width = '1.5em'
            ..style.textAlign = 'center'
            ..style.fontSize = '2rem',
          Text(text),
        ]);

  return HTMLParagraphElement()
    ..style.display = 'flex'
    ..style.flexDirection = 'row'
    ..style.gap = '1rem'
    ..style.justifyContent = 'center'
    ..appendAll([
      cell(days, 'days'),
      cell(hours, 'hours'),
      cell(minutes, 'minutes'),
      cell(seconds, 'seconds'),
    ]);
}

HTMLElement get _schedule =>
    HTMLElement.article()..appendAll([
      HTMLHeadingElement.h1()
        ..style.fontSize = '1.5rem'
        ..textContent = text(contents.scheduleLabel),
      HTMLDListElement()
        ..style.display = 'grid'
        ..style.gridGap = '0.5rem'
        ..style.gridTemplateColumns = 'repeat(2, 1fr)'
        ..style.marginTop = '1rem'
        ..appendAll(
          event.schedule
              .map(
                (schedule) => [
                  HTMLElement.dt()
                    ..style.whiteSpace = 'nowrap'
                    ..style.textAlign = 'right'
                    ..textContent = text(schedule.title),
                  HTMLElement.dd()..textContent = formatDate(schedule.date),
                ],
              )
              .expand((e) => e),
        ),
    ]);
