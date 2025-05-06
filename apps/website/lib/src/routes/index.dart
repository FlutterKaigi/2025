import 'dart:async';

import 'package:flutterkaigi_2025_website/app.dart' show onRemove;
import 'package:flutterkaigi_2025_website/config.dart';
import 'package:flutterkaigi_2025_website/src/components.dart';
import 'package:flutterkaigi_2025_website/src/components/wave.dart';
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
    ..appendAll([
      _mainContent..style.minHeight = '70vh',
      waveCanvas,
      _schedule,
    ]),
);

HTMLElement get _mainContent =>
    HTMLElement.article()
      ..style.display = 'flex'
      ..style.flexDirection = 'column'
      ..style.justifyContent = 'center'
      ..style.alignItems = 'center'
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
        HTMLDListElement()
          ..style.display = 'grid'
          ..style.gridGap = '0.5rem'
          ..style.gridTemplateColumns = 'repeat(2, 1fr)'
          ..style.marginTop = '1rem'
          ..style.fontSize = '1.2rem'
          ..appendAll([
            HTMLElement.dt()..textContent = text(contents.placeLabel),
            HTMLElement.dd()..append(
              externalLink(text(event.place.name), url: event.place.url)
                ..style.fontSize = 'inherit',
            ),
          ]),
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

  HTMLElement digit(String digit) =>
      HTMLSpanElement()
        ..style.color = 'var(--primary-color)'
        ..style.animation = '3s linear 1s forwards color-change'
        ..style.display = 'block'
        ..style.width = '1.5em'
        ..style.textAlign = 'center'
        ..style.fontSize = '2rem'
        ..textContent = digit;

  HTMLElement newDigit(HTMLElement currentDigit, String d) {
    if (currentDigit.textContent == d) {
      return currentDigit;
    }

    final newDigit = digit(d);
    currentDigit.replaceWith(newDigit);
    return newDigit;
  }

  var days = digit('${count.days}');
  var hours = digit('${count.hours}');
  var minutes = digit('${count.minutes}');
  var seconds = digit('${count.seconds}');

  final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    final count = countdown(event.date.difference(DateTime.now()));
    days = newDigit(days, '${count.days}');
    hours = newDigit(hours, '${count.hours}');
    minutes = newDigit(minutes, '${count.minutes}');
    seconds = newDigit(seconds, '${count.seconds}');
  });
  onRemove(timer.cancel);

  HTMLElement cell(HTMLElement element, String text) =>
      HTMLSpanElement()
        ..style.display = 'flex'
        ..style.flexDirection = 'column'
        ..style.alignItems = 'center'
        ..style.fontSize = '0.9rem'
        ..appendAll([element, Text(text)]);

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
                    ..style.textAlign = 'center'
                    ..textContent = formatDate(schedule.date),
                  HTMLElement.dd()..textContent = text(schedule.title),
                ],
              )
              .expand((e) => e),
        ),
    ]);
