import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/components/open_in_new.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

String _makeGridArea(Place place, Duration start, [Duration? end]) {
  end = (end ?? start) - const Duration(minutes: 5);
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
          padding: Spacing.only(left: 1.rem),
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
      const Duration(hours: 10, minutes: 45),
      const Duration(hours: 11),
      const Duration(hours: 11, minutes: 45),
      const Duration(hours: 11, minutes: 30),
      const Duration(hours: 12, minutes: 15),
      const Duration(hours: 13, minutes: 30),
      const Duration(hours: 14),
      const Duration(hours: 14, minutes: 15),
      const Duration(hours: 14, minutes: 45),
      const Duration(hours: 15, minutes: 15),
      const Duration(hours: 15, minutes: 45),
      const Duration(hours: 16),
      const Duration(hours: 16, minutes: 30),
      const Duration(hours: 16, minutes: 45),
      const Duration(hours: 17, minutes: 15),
      const Duration(hours: 17, minutes: 30),
      const Duration(hours: 18),
    ].map(
      (d) => li(
        styles: Styles(
          position: Position.sticky(left: 0.em),
          fontSize: Unit.inherit,
          height: 1.em,
          whiteSpace: WhiteSpace.inherit,
          raw: {'grid-area': 'time-${d.inMinutes}'},
          radius: BorderRadius.all(Radius.circular(1.em)),
          backgroundColor: const Color.variable(
            '--background-color',
          ).withOpacity(0.25),
        ),
        [text(_makeTimeLabel(d))],
      ),
    );

class Timeline extends StatelessComponent {
  const Timeline({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    Color shadowColor(Place place) => switch (place) {
      Place.hallA || Place.roomA => const Color.variable(
        '--primary-color',
      ).withLightness(0.7),
      Place.hallB || Place.roomB => const Color.variable(
        '--secondary-color',
      ).withLightness(0.6),
    };

    Component item(
      Component child, {
      required Place place,
      required Duration start,
      required Duration time,
      Styles? styles,
    }) => li(
      styles: Styles(
        backgroundColor: const Color.variable('--background-color'),
        margin: Spacing.only(left: 1.rem, top: 1.rem),
        padding: Spacing.symmetric(horizontal: 1.rem, vertical: 0.5.rem),
        fontSize: Unit.inherit,
        whiteSpace: WhiteSpace.inherit,
        minWidth: 12.em,
        textOverflow: TextOverflow.ellipsis,
        overflow: Overflow.hidden,
        radius: BorderRadius.all(Radius.circular(1.rem)),
        shadow: BoxShadow(
          offsetX: 0.rem,
          offsetY: 0.25.rem,
          blur: 0.5.rem,
          color: shadowColor(place),
        ),
        minHeight: (time.inMinutes / 5 * 1.75).rem,
        raw: {
          'grid-area': _makeGridArea(
            place,
            start,
            start + time,
          ),
        },
      ),
      [
        child,
        span(
          [text('(${time.inMinutes} min)')],
          styles: const Styles(
            fontSize: Unit.inherit,
            color: Colors.gray,
            whiteSpace: WhiteSpace.noWrap,
          ),
        ),
      ],
    );

    Component breakItem({
      required Duration start,
      required Duration time,
      (Place, Place) place = (Place.hallA, Place.roomB),
    }) {
      final end = start + time - const Duration(minutes: 5);
      return li(
        styles: Styles(
          backgroundColor: Colors.white,
          margin: Spacing.only(left: 1.rem, top: 1.rem, bottom: 0.5.rem),
          padding: Spacing.all(0.25.rem),
          fontSize: Unit.inherit,
          fontFamily: lexendFontFamily,
          whiteSpace: WhiteSpace.inherit,
          textOverflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          overflow: Overflow.hidden,
          radius: BorderRadius.all(Radius.circular(1.rem)),
          raw: {
            'grid-area':
                '${place.$1.id}-${start.inMinutes}'
                ' / ${place.$1.id}-${start.inMinutes}'
                ' / ${place.$2.id}-${end.inMinutes}'
                ' / ${place.$2.id}-${end.inMinutes}',
          },
        ),
        [contents.breakz.text(context).toComponent],
      );
    }

    yield ul(
      styles: Styles(
        overflow: const Overflow.only(x: Overflow.scroll),
        padding: Spacing.all(1.5.em),
        radius: BorderRadius.all(Radius.circular(2.rem)),
        raw: {
          'animation': 'scroll-shadow-inset linear',
          'animation-timeline': 'scroll(self x)',
        },
        display: Display.grid,
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
      ),
      [
        ..._timelineRooms(context),
        ..._timeline,
        breakItem(
          start: const Duration(hours: 10, minutes: 45),
          time: const Duration(minutes: 15),
        ),
        breakItem(
          start: const Duration(hours: 11, minutes: 30),
          time: const Duration(minutes: 15),
        ),
        breakItem(
          start: const Duration(hours: 12, minutes: 15),
          time: const Duration(hours: 1, minutes: 15),
        ),
        breakItem(
          start: const Duration(hours: 14),
          time: const Duration(minutes: 15),
          place: (Place.hallA, Place.roomA),
        ),
        breakItem(
          start: const Duration(hours: 14, minutes: 45),
          time: const Duration(minutes: 30),
          place: (Place.hallA, Place.roomA),
        ),
        breakItem(
          start: const Duration(hours: 15, minutes: 45),
          time: const Duration(minutes: 15),
          place: (Place.hallA, Place.roomA),
        ),
        breakItem(
          start: const Duration(hours: 16, minutes: 30),
          time: const Duration(minutes: 15),
        ),
        breakItem(
          start: const Duration(hours: 17, minutes: 15),
          time: const Duration(minutes: 15),
        ),
        ...event.timeline.map((entry) {
          final url = entry.url;
          final content = url != null
              ? ExternalLink(
                  url: url,
                  content: entry.title.text(context).toComponent,
                  styles: const Styles(
                    color: Color.variable('--text-color'),
                    fontSize: Unit.inherit,
                    whiteSpace: WhiteSpace.inherit,
                  ),
                )
              : entry.title.text(context).toComponent;

          return item(
            content,
            place: entry.place,
            start: entry.start,
            time: entry.time,
          );
        }),
      ],
    );

    yield p(
      styles: Styles(
        margin: Spacing.only(top: 2.rem),
        display: Display.flex,
        flexDirection: FlexDirection.column,
        alignItems: AlignItems.center,
      ),
      [
        Link(
          to: event.cfp.url,
          target: Target.blank,
          child: button(
            styles: Styles(
              display: Display.flex,
              position: const Position.relative(),
              cursor: Cursor.pointer,
              justifyContent: JustifyContent.center,
              gap: Gap.all(1.rem),
              color: Colors.white,
              fontSize: 1.rem,
            ),
            classes: 'primary-button',
            [
              event.cfp.title.text(context).toComponent,
              const OpenInNew(),
            ],
          ),
        ),
      ],
    );
  }
}
