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

class Timeline extends StatelessComponent {
  const Timeline({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    Color randomColor() => (Random().nextBool()
        ? const Color.variable('--primary-color').withLightness(0.95)
        : const Color.variable('--secondary-color').withLightness(0.9));

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
        ...[
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
        ),
        li(
          styles: Styles(
            backgroundColor: randomColor(),
            padding: Spacing.all(0.25.rem),
            fontSize: Unit.inherit,
            whiteSpace: WhiteSpace.inherit,
            textOverflow: TextOverflow.ellipsis,
            overflow: Overflow.hidden,
            raw: {
              'grid-area': _makeGridArea(
                Place.roomB,
                const Duration(hours: 13, minutes: 30),
                const Duration(hours: 15, minutes: 40),
              ),
            },
          ),
          [text('ハンズオン')],
        ),
        li(
          styles: Styles(
            backgroundColor: randomColor(),
            padding: Spacing.all(0.25.rem),
            fontSize: Unit.inherit,
            whiteSpace: WhiteSpace.inherit,
            textOverflow: TextOverflow.ellipsis,
            overflow: Overflow.hidden,
            raw: {
              'grid-area': _makeGridArea(
                Place.hallA,
                const Duration(hours: 10, minutes: 15),
                const Duration(hours: 10, minutes: 40),
              ),
            },
          ),
          [text('キーノート')],
        ),
        li(
          styles: Styles(
            backgroundColor: randomColor(),
            padding: Spacing.all(0.25.rem),
            fontSize: Unit.inherit,
            whiteSpace: WhiteSpace.inherit,
            textOverflow: TextOverflow.ellipsis,
            overflow: Overflow.hidden,
            raw: {
              'grid-area': _makeGridArea(
                Place.hallB,
                const Duration(hours: 10, minutes: 15),
                const Duration(hours: 10, minutes: 40),
              ),
            },
          ),
          [text('キーノート (サテライト)')],
        ),
        li(
          styles: Styles(
            backgroundColor: randomColor(),
            padding: Spacing.all(0.25.rem),
            fontSize: Unit.inherit,
            whiteSpace: WhiteSpace.inherit,
            textOverflow: TextOverflow.ellipsis,
            overflow: Overflow.hidden,
            raw: {
              'grid-area': _makeGridArea(
                Place.hallA,
                const Duration(hours: 10),
                const Duration(hours: 10, minutes: 10),
              ),
            },
          ),
          [text('挨拶')],
        ),
        li(
          styles: Styles(
            backgroundColor: randomColor(),
            padding: Spacing.all(0.25.rem),
            fontSize: Unit.inherit,
            whiteSpace: WhiteSpace.inherit,
            textOverflow: TextOverflow.ellipsis,
            overflow: Overflow.hidden,
            raw: {
              'grid-area': _makeGridArea(
                Place.hallB,
                const Duration(hours: 10),
                const Duration(hours: 10, minutes: 10),
              ),
            },
          ),
          [text('挨拶 (サテライト)')],
        ),
        ...[
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
        ),
        ...event.timeline.map(
          (entry) => li(
            styles: Styles(
              backgroundColor: randomColor(),
              padding: Spacing.all(0.25.rem),
              fontSize: Unit.inherit,
              whiteSpace: WhiteSpace.inherit,
              minHeight:
                  ((entry.end.inMinutes - entry.start.inMinutes) / 5 * 1.5).rem,
              textOverflow: TextOverflow.ellipsis,
              overflow: Overflow.hidden,
              raw: {
                'grid-area': _makeGridArea(entry.place, entry.start, entry.end),
              },
            ),
            [
              ExternalLink(
                url: entry.url,
                content: text(entry.title),
                styles: const Styles(
                  color: const Color.variable('--text-color'),
                  fontSize: Unit.inherit,
                  whiteSpace: WhiteSpace.inherit,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
