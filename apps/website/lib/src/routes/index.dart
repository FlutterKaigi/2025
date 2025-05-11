import 'dart:async';

import 'package:flutterkaigi_2025_website/app.dart' show onRemove;
import 'package:flutterkaigi_2025_website/config.dart';
import 'package:flutterkaigi_2025_website/src/components.dart';
import 'package:flutterkaigi_2025_website/src/layouts.dart';
import 'package:flutterkaigi_2025_website/src/routes.dart' show Handler;
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:web/web.dart';

const _tagLineAnimationCurve = 'cubic-bezier(0.64, 0.25, 0.18, 1.22)';

Handler get handler => (title: makeTitle(), handle: () => index);

HTMLElement get index => basicLayout(
  HTMLElement.main()
    ..style.display = 'flex'
    ..style.flexDirection = 'column'
    ..style.alignItems = 'center'
    ..style.gap = '2rem'
    ..appendAll([
      _mainContent,
      sectionLayout('Schedule', _schedule)..style.marginTop = '2rem',
    ]),
);

HTMLElement get _mainContent {
  final tagLineWords = event.tagLine.split(' ');

  return HTMLElement.article()
    ..style.display = 'flex'
    ..style.flexDirection = 'column'
    ..style.justifyContent = 'center'
    ..style.alignItems = 'center'
    ..appendAll([
      HTMLHeadingElement.h1()
        ..style.position = 'relative'
        ..style.whiteSpace = 'nowrap'
        ..style.fontFamily = 'Lexend'
        ..style.textAlign = 'center'
        ..style.marginTop = '6rem'
        ..style.padding = '6rem 8rem'
        ..style.backgroundImage = 'url(/img/brush.webp)'
        ..style.backgroundSize = 'contain'
        ..style.backgroundRepeat = 'no-repeat'
        ..appendAll([
          for (var i = 0; i < tagLineWords.length; i++)
            HTMLSpanElement()
              ..textContent = tagLineWords[i]
              ..style.display = 'block'
              ..style.opacity = '0'
              ..style.transform = 'translateX(100vw)'
              ..style.fontStyle = 'italic'
              ..style.fontSize = 'clamp(2.5rem, 6vw, 4.5rem)'
              ..style.color = 'white'
              ..style.animationDelay = '${i * 0.3}s'
              ..style.animationName = 'slide-in'
              ..style.animationDuration = '0.5s'
              ..style.animationTimingFunction = _tagLineAnimationCurve
              ..style.animationFillMode = 'forwards',
        ]),
      HTMLHeadingElement.h2()
        ..textContent = event.title
        ..style.fontSize = '2rem'
        ..style.fontWeight = 'bold'
        ..style.fontFamily = 'Lexend'
        ..style.marginTop = '6rem',
      HTMLParagraphElement()
        ..style.fontSize = '1.5rem'
        ..style.fontWeight = 'bold'
        ..style.fontFamily = 'Lexend, sans-serif'
        ..style.marginTop = '2rem'
        ..appendAll([
          Text('in '),
          externalLink(text(event.place.name), url: event.place.url)
            ..style.fontSize = 'inherit'
            ..style.color = 'inherit',
        ]),
      HTMLElement.section()
        ..style.position = 'relative'
        ..style.marginTop = '6rem'
        ..appendAll([
          HTMLAnchorElement()
            ..textContent = text(event.blog.sponsorship.title)
            ..href = text(event.blog.sponsorship.url)
            ..className = 'gradient-button'
            ..style.color = 'white'
            ..style.cursor = 'pointer'
            ..style.fontSize = '1rem',
        ]),
      _countdown
        ..className = 'bubble'
        ..style.marginTop = '8rem',
      HTMLImageElement()
        ..style.marginTop = '2rem'
        ..style.height = '5rem'
        ..alt = 'FlutterKaigi Dash'
        ..src = '/img/flutterkaigi_dash.png',
    ]);
}

String _formatDigit(int digit) => digit.toString().padLeft(2, '0');

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

  HTMLElement colon() =>
      HTMLSpanElement()
        ..style.color = 'var(--secondary-color)'
        ..style.fontSize = '2rem'
        ..textContent = ':';

  HTMLElement digit(int digit) =>
      HTMLSpanElement()
        ..style.color = 'var(--secondary-color)'
        ..style.fontSize = '2rem'
        ..textContent = _formatDigit(digit);

  HTMLElement newDigit(HTMLElement currentDigit, int d) {
    if (currentDigit.textContent == _formatDigit(d)) {
      return currentDigit;
    }

    final newDigit = digit(d);
    currentDigit.replaceWith(newDigit);
    return newDigit;
  }

  var days = digit(count.days);
  var hours = digit(count.hours);
  var minutes = digit(count.minutes);
  var seconds = digit(count.seconds);

  final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    final count = countdown(event.date.difference(DateTime.now()));
    days = newDigit(days, count.days);
    hours = newDigit(hours, count.hours);
    minutes = newDigit(minutes, count.minutes);
    seconds = newDigit(seconds, count.seconds);
  });
  onRemove(timer.cancel);

  return HTMLDivElement()..appendAll([
    HTMLSpanElement()
      ..style.display = 'inline-flex'
      ..style.alignItems = 'baseline'
      ..style.fontSize = '0.9rem'
      ..style.marginRight = '1rem'
      ..style.gap = '0.5rem'
      ..appendAll([days, Text('days')]),
    hours,
    colon(),
    minutes,
    colon(),
    seconds,
  ]);
}

HTMLElement get _schedule =>
    HTMLDListElement()
      ..style.display = 'grid'
      ..style.gridGap = '0.5rem'
      ..style.gridTemplateColumns = 'repeat(2, 1fr)'
      ..style.marginTop = '1rem'
      ..style.marginBottom = '4rem'
      ..appendAll(
        event.schedule
            .map(
              (schedule) => [
                HTMLElement.dt()
                  ..style.textAlign = 'center'
                  ..style.lineHeight = '2rem'
                  ..textContent = formatDate(schedule.date),
                HTMLElement.dd()..textContent = text(schedule.title),
              ],
            )
            .expand((e) => e),
      );
