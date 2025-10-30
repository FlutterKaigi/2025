import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/components/open_in_new.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

String _makeGridArea(String venueId, Duration start, [Duration? end]) {
  end = (end ?? start) - const Duration(minutes: 5);
  return '$venueId-${start.inMinutes}'
      ' / $venueId-${start.inMinutes}'
      ' / $venueId-${end.inMinutes}'
      ' / $venueId-${end.inMinutes}';
}

String _makeTimeLabel(Duration time) {
  final h = time.inHours;
  final m = time.inMinutes % 60;
  return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
}

/// タイムラインエントリから一意のvenue一覧を抽出
Iterable<({String id, String name})> _extractVenues(
  List<TimelineEntry> timeline,
) {
  final venueMap = <String, String>{};
  for (final entry in timeline) {
    venueMap[entry.venueId] = entry.venueName;
  }
  return venueMap.entries.map((e) => (id: e.key, name: e.value));
}

Iterable<Component> _timelineRooms(
  BuildContext context,
  List<TimelineEntry> timeline,
) => _extractVenues(timeline).map(
  (venue) => li(
    styles: Styles(
      padding: Spacing.only(left: 1.rem),
      fontFamily: lexendFontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 1.2.rem,
      raw: {'grid-area': venue.id},
    ),
    [text(venue.name)],
  ),
);

/// 時間ラベルを動的に生成
Iterable<Component> _generateTimeLabels(int minMinutes, int maxMinutes) {
  final labels = <Component>[];
  for (var minutes = minMinutes; minutes <= maxMinutes; minutes += 5) {
    // 主要な時間（00分、15分、30分、45分）のみラベルを表示
    if (minutes % 15 == 0) {
      labels.add(
        li(
          styles: Styles(
            position: Position.sticky(left: 0.em),
            fontSize: Unit.inherit,
            height: 1.em,
            whiteSpace: WhiteSpace.inherit,
            raw: {'grid-area': 'time-$minutes'},
            radius: BorderRadius.all(Radius.circular(1.em)),
            backgroundColor: const Color.variable(
              '--background-color',
            ).withOpacity(0.25),
          ),
          [text(_makeTimeLabel(Duration(minutes: minutes)))],
        ),
      );
    }
  }
  return labels;
}

class Timeline extends StatelessComponent {
  const Timeline({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final timeline = event.timeline;
    final venues = _extractVenues(timeline).toList();

    // venueIndexに基づいて色を決定（偶数/奇数で区別）
    Color shadowColor(String venueId) {
      final index = venues.indexWhere((v) => v.id == venueId);
      return index.isEven
          ? const Color.variable('--primary-color').withLightness(0.7)
          : const Color.variable('--secondary-color').withLightness(0.6);
    }

    Component item(
      Component child, {
      required String venueId,
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
          color: shadowColor(venueId),
        ),
        minHeight: (time.inMinutes / 5 * 1.75).rem,
        raw: {
          'grid-area': _makeGridArea(
            venueId,
            start,
            start + time,
          ),
        },
      ),
      [child],
    );

    Component breakItem({
      required Duration start,
      required Duration time,
      String? startVenueId,
      String? endVenueId,
    }) {
      final firstVenueId = startVenueId ?? venues.first.id;
      final lastVenueId = endVenueId ?? venues.last.id;
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
                '$firstVenueId-${start.inMinutes}'
                ' / $firstVenueId-${start.inMinutes}'
                ' / $lastVenueId-${end.inMinutes}'
                ' / $lastVenueId-${end.inMinutes}',
          },
        ),
        [contents.breakz.text(context).toComponent],
      );
    }

    // タイムラインから最小・最大時刻を取得
    var minMinutes = 600; // 10:00 (デフォルト)
    var maxMinutes = 1080; // 18:00 (デフォルト)

    if (timeline.isNotEmpty) {
      minMinutes = timeline
          .map((e) => e.start.inMinutes)
          .reduce((a, b) => a < b ? a : b);
      maxMinutes = timeline
          .map((e) => (e.start + e.time).inMinutes)
          .reduce((a, b) => a > b ? a : b);

      // 5分単位に切り捨て・切り上げ
      minMinutes = (minMinutes ~/ 5) * 5;
      maxMinutes = ((maxMinutes + 4) ~/ 5) * 5;
    }

    // 動的にGrid areasを生成
    final venueIds = venues.map((v) => v.id).join(' ');
    final timeSlotCount = ((maxMinutes - minMinutes) ~/ 5) + 1;

    final gridAreas = [
      'time $venueIds',
      ...List.generate(timeSlotCount, (i) {
        final minutes = minMinutes + (i * 5);
        final venueColumns = venues.map((v) => '${v.id}-$minutes').join(' ');
        return 'time-$minutes $venueColumns';
      }),
    ];

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
          areas: GridAreas(gridAreas),
        ),
        fontSize: 0.75.rem,
      ),
      [
        ..._timelineRooms(context, timeline),
        ..._generateTimeLabels(minMinutes, maxMinutes),
        breakItem(
          start: const Duration(hours: 10, minutes: 45),
          time: const Duration(minutes: 15),
        ),
        breakItem(
          start: const Duration(hours: 11, minutes: 30),
          time: const Duration(minutes: 15),
          startVenueId: venues.isNotEmpty ? venues.first.id : null,
          endVenueId: venues.length >= 3 ? venues[2].id : venues.lastOrNull?.id,
        ),
        breakItem(
          start: const Duration(hours: 12, minutes: 15),
          time: const Duration(hours: 1, minutes: 15),
        ),
        breakItem(
          start: const Duration(hours: 14),
          time: const Duration(minutes: 15),
          startVenueId: venues.isNotEmpty ? venues.first.id : null,
          endVenueId: venues.length >= 3 ? venues[2].id : venues.lastOrNull?.id,
        ),
        breakItem(
          start: const Duration(hours: 14, minutes: 45),
          time: const Duration(minutes: 30),
          startVenueId: venues.isNotEmpty ? venues.first.id : null,
          endVenueId: venues.length >= 3 ? venues[2].id : venues.lastOrNull?.id,
        ),
        breakItem(
          start: const Duration(hours: 15, minutes: 45),
          time: const Duration(minutes: 15),
        ),
        breakItem(
          start: const Duration(hours: 16, minutes: 30),
          time: const Duration(minutes: 15),
        ),
        breakItem(
          start: const Duration(hours: 17, minutes: 15),
          time: const Duration(minutes: 15),
        ),
        ...timeline.map((entry) {
          final url = entry.url;
          final content = ul(
            [
              li([
                if (url != null)
                  ExternalLink(
                    url: url,
                    content: entry.title.text(context).toComponent,
                    styles: const Styles(
                      color: Color.variable('--text-color'),
                      fontSize: Unit.inherit,
                      whiteSpace: WhiteSpace.inherit,
                    ),
                  )
                else
                  entry.title.text(context).toComponent,
                li(
                  [
                    '${entry.time.inMinutes} min'.toComponent,
                    if (entry.satellite)
                      (
                        ja: ' / サテライト会場',
                        en: ' / Satellite Venue',
                      ).text(context).toComponent,
                  ],
                  styles: const Styles(
                    fontSize: Unit.inherit,
                    color: Colors.gray,
                    whiteSpace: WhiteSpace.noWrap,
                  ),
                ),
              ]),
            ],
            styles: const Styles(
              display: Display.flex,
              flexDirection: FlexDirection.column,
            ),
          );

          return item(
            content,
            venueId: entry.venueId,
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
