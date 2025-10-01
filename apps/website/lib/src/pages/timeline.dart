import 'dart:math';
import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';

String _makeGridArea(Place place, Duration start, [Duration? end]) {
  end ??= start;
  return '${place.id}-${start.inMinutes}'
      ' / ${place.id}-${start.inMinutes}'
      ' / ${place.id}-${end.inMinutes}'
      ' / ${place.id}-${end.inMinutes}';
}

String _makeTimeLabel(Duration time) {
  final h = time.inHours;
  final m = time.inMinutes % 60;
  return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
}

Iterable<Component> _timelineRooms(BuildContext context) =>
    [
      Place.hallA,
      Place.hallB,
      Place.roomA,
      Place.roomB,
    ].map(
      (place) => li(
        styles: Styles(
          fontFamily: lexendFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 1.2.rem,
          raw: {'grid-area': place.id},
        ),
        [place.name.text(context).toComponent],
      ),
    );

final _timeline =
    [
      const Duration(hours: 10),
      const Duration(hours: 10, minutes: 15),
      const Duration(hours: 10, minutes: 40),
      const Duration(hours: 11),
      const Duration(hours: 11, minutes: 45),
      const Duration(hours: 11, minutes: 25),
      const Duration(hours: 12, minutes: 10),
      const Duration(hours: 13, minutes: 30),
      const Duration(hours: 13, minutes: 55),
      const Duration(hours: 14, minutes: 15),
      const Duration(hours: 14, minutes: 40),
      const Duration(hours: 15, minutes: 15),
      const Duration(hours: 15, minutes: 40),
      const Duration(hours: 16),
      const Duration(hours: 16, minutes: 25),
      const Duration(hours: 17, minutes: 30),
      const Duration(hours: 18),
    ].map(
      (d) => li(
        styles: Styles(
          fontSize: Unit.inherit,
          whiteSpace: WhiteSpace.inherit,
          raw: {'grid-area': 'time-${d.inMinutes}'},
        ),
        [text(_makeTimeLabel(d))],
      ),
    );

class Timeline extends StatelessComponent {
  const Timeline({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    Color randomColor() => (Random().nextBool()
        ? const Color.variable('--primary-color').withLightness(0.95)
        : const Color.variable('--secondary-color').withLightness(0.9));

    Component item(
      Component child, {
      required Place place,
      required Duration start,
      required Duration end,
      Styles? styles,
    }) => li(
      styles: Styles(
        backgroundColor: randomColor(),
        padding: Spacing.all(0.25.rem),
        fontSize: Unit.inherit,
        whiteSpace: WhiteSpace.inherit,
        textOverflow: TextOverflow.ellipsis,
        overflow: Overflow.hidden,
        raw: {
          'grid-area': _makeGridArea(
            place,
            start,
            end,
          ),
        },
      ).combine(styles ?? const Styles()),
      [child],
    );

    yield ul(
      styles: Styles(
        display: Display.grid,
        gap: Gap.all(0.5.rem),
        gridTemplate: GridTemplate(
          areas: GridAreas([
            // ignore_for_file: lines_longer_than_80_chars
            'time ${Place.hallA.id} ${Place.hallB.id} ${Place.roomA.id} ${Place.roomB.id}',
            ...List.generate(97, (i) {
              final minutes = Duration(hours: 10, minutes: i * 5).inMinutes;
              return 'time-$minutes'
                  ' ${Place.hallA.id}-$minutes ${Place.hallB.id}-$minutes'
                  ' ${Place.roomA.id}-$minutes ${Place.roomB.id}-$minutes';
            }),
          ]),
        ),
        fontSize: 0.75.rem,
        whiteSpace: WhiteSpace.noWrap,
      ),
      [
        ..._timelineRooms(context),
        ..._timeline,
        item(
          text('ハンズオン'),
          place: Place.roomB,
          start: const Duration(hours: 13, minutes: 30),
          end: const Duration(hours: 15, minutes: 40),
        ),
        item(
          text('キーノート'),
          place: Place.hallA,
          start: const Duration(hours: 10, minutes: 15),
          end: const Duration(hours: 10, minutes: 40),
        ),
        item(
          text('キーノート (サテライト)'),
          place: Place.hallB,
          start: const Duration(hours: 10, minutes: 15),
          end: const Duration(hours: 10, minutes: 40),
        ),
        item(
          text('挨拶'),
          place: Place.hallA,
          start: const Duration(hours: 10),
          end: const Duration(hours: 10, minutes: 10),
        ),
        item(
          text('挨拶 (サテライト)'),
          place: Place.hallB,
          start: const Duration(hours: 10),
          end: const Duration(hours: 10, minutes: 10),
        ),
        ...event.timeline.map(
          (entry) => item(
            ExternalLink(
              url: entry.url,
              content: text(entry.title),
              styles: const Styles(
                color: Color.variable('--text-color'),
                fontSize: Unit.inherit,
                whiteSpace: WhiteSpace.inherit,
              ),
            ),
            place: entry.place,
            start: entry.start,
            end: entry.end,
            styles: Styles(
              minHeight:
                  ((entry.end.inMinutes - entry.start.inMinutes) / 5 * 1.5).rem,
            ),
          ),
        ),
      ],
    );
  }
}
