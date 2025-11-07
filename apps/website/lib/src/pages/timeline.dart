import 'package:flutterkaigi_2025_website/src/components/external_link.dart';
import 'package:flutterkaigi_2025_website/src/components/open_in_new.dart';
import 'package:flutterkaigi_2025_website/src/config/config.dart';
import 'package:flutterkaigi_2025_website/src/config/sessions_data.dart'
    show venuesWithSessions;
import 'package:flutterkaigi_2025_website/src/config/timeline_converter.dart';
import 'package:flutterkaigi_2025_website/src/constants/styles.dart';
import 'package:flutterkaigi_2025_website/text.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

// 行番号と列番号を計算してgrid配置を返す
// row: 時間スロット（5分刻み）、column: 会場
String _makeGridPlacement(
  int venueIndex,
  Duration start,
  Duration time,
  int minMinutes,
) {
  // 行番号: 時間スロット（5分刻み）+ 2（ヘッダー行分）
  final startRow = (start.inMinutes ~/ 5) - (minMinutes ~/ 5) + 2;
  final endRow = startRow + (time.inMinutes ~/ 5);

  // 列番号: 会場インデックス + 2（時間列分）
  final column = venueIndex + 2;

  // grid-areaは row-start / col-start / row-end / col-end
  // col-endは次のラインを指すので +1 が必要
  return '$startRow / $column / $endRow / ${column + 1}';
}

String _makeTimeLabel(Duration time) {
  // イベント基準時刻 + 相対時間 = 実際の時刻
  final actualTime = eventBaseTime.add(time);
  final h = actualTime.hour;
  final m = actualTime.minute;
  return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
}

/// 会場一覧を正しい表示順序で取得
/// 順序: ASSIGN Hall, RevenueCat Hall, Skia, Impeller
List<({String id, String name})> _getVenues() {
  final venueMap = {
    for (final v in venuesWithSessions) v.id: v.name,
  };

  // 正しい順序でvenueを並び替え
  final orderedVenueIds = [
    'e1a11efe-b1eb-43e1-ae60-9d2233e5dfe7', // ASSIGN Hall
    '0505c447-b699-4803-aab9-9cbdf9452c1b', // RevenueCat Hall
    '6426cd21-f1fe-4d84-b74b-ff459cc0d3e2', // Skia
    '98807fe6-b381-40a7-8c33-30a024b9ca4f', // Impeller
  ];

  return orderedVenueIds
      .where((id) => venueMap.containsKey(id))
      .map((id) => (id: id, name: venueMap[id]!))
      .toList();
}

Iterable<Component> _timelineRooms(
  BuildContext context,
) {
  final venues = _getVenues();
  return venues.asMap().entries.map((entry) {
    final index = entry.key;
    final venue = entry.value;
    return li(
      styles: Styles(
        padding: Spacing.only(left: 1.rem),
        fontFamily: lexendFontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 1.2.rem,
        raw: {
          'grid-row': '1',
          'grid-column': '${index + 2}',
        },
      ),
      [text(venue.name)],
    );
  });
}

/// 時間ラベルを動的に生成
Iterable<Component> _generateTimeLabels(int minMinutes, int maxMinutes) {
  final labels = <Component>[];
  for (var minutes = minMinutes; minutes <= maxMinutes; minutes += 5) {
    // 主要な時間（00分、15分、30分、45分）のみラベルを表示
    if (minutes % 15 == 0) {
      // 行番号を計算: (分数 / 5) + 2（ヘッダー行分）
      final rowIndex = (minutes ~/ 5) - (minMinutes ~/ 5) + 2;
      labels.add(
        li(
          styles: Styles(
            position: Position.sticky(left: 0.em),
            fontSize: Unit.inherit,
            height: 1.em,
            whiteSpace: WhiteSpace.inherit,
            raw: {
              'grid-row': '$rowIndex',
              'grid-column': '1',
            },
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
    final venues = _getVenues();

    // venueIndexに基づいて色を決定（偶数/奇数で区別）
    Color borderColor(String venueId) {
      final index = venues.indexWhere((v) => v.id == venueId);
      return index.isEven
          ? const Color.value(0xF4CED6)
          : const Color.value(0xCAE1FE);
    }

    Color backgroundColor(String venueId) {
      final index = venues.indexWhere((v) => v.id == venueId);
      return index.isEven
          ? const Color.value(0xF7E3E9)
          : const Color.value(0xE1EDFE);
    }

    // minMinutesは後で定義されるので、クロージャで取得できる
    Component item(
      Component child, {
      required String venueId,
      required Duration start,
      required Duration time,
      required int minMinutes,
      Styles? styles,
    }) {
      final venueIndex = venues.indexWhere((v) => v.id == venueId);
      return li(
        styles: Styles(
          backgroundColor: backgroundColor(venueId),
          margin: Spacing.only(left: 0.5.rem, right: 0.5.rem, bottom: 0.5.rem),
          padding: Spacing.symmetric(horizontal: 1.rem, vertical: 0.75.rem),
          whiteSpace: WhiteSpace.inherit,
          minWidth: 12.em,
          textOverflow: TextOverflow.ellipsis,
          overflow: Overflow.hidden,
          radius: BorderRadius.all(Radius.circular(0.5.rem)),
          border: Border(
            color: borderColor(venueId),
            width: 2.px,
          ),
          minHeight: (time.inMinutes / 5 * 1.75).rem,
          raw: {
            'grid-area': _makeGridPlacement(
              venueIndex,
              start,
              time,
              minMinutes,
            ),
          },
        ),
        [child],
      );
    }

    Component breakItem({
      required Duration start,
      required Duration time,
      required int minMinutes,
      String? startVenueId,
      String? endVenueId,
      Content? title,
    }) {
      final firstVenueId = startVenueId ?? venues.first.id;
      final lastVenueId = endVenueId ?? venues.last.id;
      final firstIndex = venues.indexWhere((v) => v.id == firstVenueId);
      final lastIndex = venues.indexWhere((v) => v.id == lastVenueId);

      // 行番号を計算（実際の時間分を占有）
      final startRow = (start.inMinutes ~/ 5) - (minMinutes ~/ 5) + 2;
      final endRow = startRow + (time.inMinutes ~/ 5);

      // 列番号: 最初の会場から最後の会場まで
      final startColumn = firstIndex + 2;
      final endColumn = lastIndex + 2;

      return li(
        styles: Styles(
          backgroundColor: Colors.white,
          display: Display.flex,
          alignItems: AlignItems.center,
          justifyContent: JustifyContent.center,
          margin: Spacing.only(left: 0.5.rem, right: 0.5.rem, bottom: 0.25.rem),
          padding: Spacing.all(0.25.rem),
          fontSize: Unit.inherit,
          fontFamily: lexendFontFamily,
          whiteSpace: WhiteSpace.inherit,
          textOverflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          overflow: Overflow.hidden,
          radius: BorderRadius.all(Radius.circular(0.5.rem)),
          border: Border(
            color: const Color.variable('--border-color'),
            width: 2.px,
          ),
          raw: {
            'grid-area':
                '$startRow / $startColumn / $endRow / ${endColumn + 1}',
          },
        ),
        [(title ?? contents.breakz).text(context).toComponent],
      );
    }

    // タイムラインから最小・最大時刻を取得
    // 基準時刻: 9:00 (JST)
    var minMinutes = 0; // 9:00 = 基準時刻 + 0分
    var maxMinutes = 540; // 18:00 = 基準時刻 + 540分 (9時間)

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

    // 開場（9:00 = Duration.zero）を確実に表示するため、minMinutesを0にする
    minMinutes = 0;

    // Grid rows/columnsを生成
    final timeSlotCount = ((maxMinutes - minMinutes) ~/ 5) + 1;

    // 各行: ヘッダー行 + 時間スロット行（autoで各要素の高さに応じて変化）
    final gridRows = 'auto ${List.filled(timeSlotCount, 'auto').join(' ')}';

    // 各列: 時間列 + 会場列
    final gridColumns = 'auto ${List.filled(venues.length, '1fr').join(' ')}';

    yield ul(
      styles: Styles(
        overflow: const Overflow.only(x: Overflow.scroll),
        padding: Spacing.all(1.5.em),
        radius: BorderRadius.all(Radius.circular(2.rem)),
        raw: {
          'animation': 'scroll-shadow-inset linear',
          'animation-timeline': 'scroll(self x)',
          'grid-template-rows': gridRows,
          'grid-template-columns': gridColumns,
        },
        display: Display.grid,
        fontSize: 0.75.rem,
      ),
      [
        ..._timelineRooms(context),
        ..._generateTimeLabels(minMinutes, maxMinutes),
        // 基準時刻: 9:00 (JST)
        // 9:00 = 9:00 + 0:00 (開場)
        breakItem(
          start: Duration.zero,
          time: const Duration(hours: 1),
          minMinutes: minMinutes,
          title: (ja: '開場', en: 'Door Open'),
        ),
        // 10:30 = 9:00 + 1:30
        breakItem(
          start: const Duration(hours: 1, minutes: 30),
          time: const Duration(minutes: 15),
          minMinutes: minMinutes,
        ),
        // 11:15 = 9:00 + 2:15 (全会場)
        breakItem(
          start: const Duration(hours: 2, minutes: 15),
          time: const Duration(minutes: 15),
          minMinutes: minMinutes,
        ),
        // 12:00 = 9:00 + 3:00 (ランチ)
        breakItem(
          start: const Duration(hours: 3),
          time: const Duration(hours: 1, minutes: 15),
          minMinutes: minMinutes,
        ),
        // 13:45 = 9:00 + 4:45
        breakItem(
          start: const Duration(hours: 4, minutes: 45),
          time: const Duration(minutes: 15),
          minMinutes: minMinutes,
          startVenueId: venues.isNotEmpty ? venues.first.id : null,
          endVenueId: venues.length >= 3 ? venues[2].id : venues.lastOrNull?.id,
        ),
        // 14:30 = 9:00 + 5:30
        breakItem(
          start: const Duration(hours: 5, minutes: 30),
          time: const Duration(minutes: 30),
          minMinutes: minMinutes,
          startVenueId: venues.isNotEmpty ? venues.first.id : null,
          endVenueId: venues.length >= 3 ? venues[2].id : venues.lastOrNull?.id,
        ),
        // 15:30 = 9:00 + 6:30
        breakItem(
          start: const Duration(hours: 6, minutes: 30),
          time: const Duration(minutes: 30),
          minMinutes: minMinutes,
        ),
        // 16:30 = 9:00 + 7:30
        breakItem(
          start: const Duration(hours: 7, minutes: 30),
          time: const Duration(minutes: 15),
          minMinutes: minMinutes,
        ),
        // 17:15 = 9:00 + 8:15
        breakItem(
          start: const Duration(hours: 8, minutes: 15),
          time: const Duration(minutes: 15),
          minMinutes: minMinutes,
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
            minMinutes: minMinutes,
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
