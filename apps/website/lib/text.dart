// ignore_for_file: lines_longer_than_80_chars

import 'package:flutterkaigi_2025_website/src/path.dart' show Path;
import 'package:intl/intl.dart' show DateFormat;
import 'package:jaspr/jaspr.dart' as jaspr;

final _engDateFormat = DateFormat.yMMMMd('en_US');

/// 表示言語
enum Language { ja, en }

extension LanguageEx on Language {
  String get string => switch (this) {
    Language.ja => contents.lang.ja,
    Language.en => contents.lang.en,
  };
}

/// テキストコンテンツ
/// - `ja` 日本語 (デフォルト言語)
/// - `en` 英語
typedef Content = ({String ja, String? en});

/// 会場
enum Place {
  hallA,
  hallB,
  roomA,
  roomB,
}

extension PlaceEx on Place {
  Content get name => switch (this) {
    Place.hallA => (ja: 'ASSIGN Hall', en: null),
    Place.hallB => (ja: 'RevenueCat Hall', en: null),
    Place.roomA => (ja: 'Skia', en: null),
    Place.roomB => (ja: 'Impeller', en: null),
  };
}

const contents = (
  lang: (ja: 'JA', en: 'EN'),
  dateLabel: (ja: '開催日', en: 'Date'),
  placeLabel: (ja: '会場', en: 'Place'),
  scheduleLabel: (ja: 'スケジュール', en: 'Schedule'),
  jobBoards: (ja: 'ジョブボード', en: 'Job Boards'),
  moveToTop: (ja: 'トップ', en: 'Top'),

  proposalContents: (
    ja:
        'FlutterKaigi 2025でのセッションスピーカーの募集は締め切りました。\n'
        '採択セッションの決定までしばらくお待ち下さい。',
    en:
        'The call for speakers for FlutterKaigi 2025 has ended.\n'
        'Please wait for the announcement of the accepted sessions.',
  ),
  dayZeroPlanning: (
    ja: 'Day0 企画中！',
    en: 'Now planning Day0 :)',
  ),
  checkNews: (
    ja: '全てのお知らせを見る',
    en: 'See all news',
  ),
  breakz: (ja: '休憩', en: 'Break'),
);

String formatDate(
  jaspr.BuildContext context,
  DateTime date, [
  Language? lang,
]) => switch (lang ?? Path.fromPathname(context.url).lang) {
  Language.en => _engDateFormat.format(date),
  _ => '${date.year}年${date.month}月${date.day}日',
};

extension ContentEx on Content {
  /// テキストコンテンツを取得する
  String text(jaspr.BuildContext context) =>
      switch (Path.fromPathname(context.url).lang) {
        Language.en => this.en ?? this.ja,
        _ => this.ja,
      };
}

extension StringToComponent on String {
  jaspr.Component get toComponent => jaspr.text(this);
}
