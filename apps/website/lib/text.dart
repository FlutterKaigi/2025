// ignore_for_file: lines_longer_than_80_chars

import 'package:flutterkaigi_2025_website/src/path.dart' show Path;
import 'package:intl/intl.dart' show DateFormat;
import 'package:jaspr/jaspr.dart' as jaspr;

final _engDateFormat = DateFormat.yMMMMd('en_US');

/// 表示言語
enum Language { ja, en }

/// テキストコンテンツ
/// - `ja` 日本語 (デフォルト言語)
/// - `en` 英語
typedef Content = ({String ja, String? en});

const contents = (
  lang: (ja: 'JA', en: 'EN'),
  dateLabel: (ja: '開催日', en: 'Date'),
  placeLabel: (ja: '会場', en: 'Place'),
  scheduleLabel: (ja: 'スケジュール', en: 'Schedule'),
  moveToTop: (ja: 'トップ', en: 'Top'),

  proposalContents: (
    ja:
        'FlutterKaigi 2025でのセッションスピーカーを募集開始しました！\n'
        'FlutterKaigiは、技術者が自分の知識と経験を共有するためのカンファレンスです。\n'
        'テーマはFlutterやDartに関連していれば何でもOKです。'
        '初心者向けのヒントから上級者向けのテクニック、チュートリアル、ライブラリの紹介、'
        'ベストプラクティス、挑戦した事例など、聞いて面白く、他の開発者に有益な内容を'
        '募集しています。\n'
        'ただし、自社製品の宣伝を目的としたトークや、FlutterやDartと無関係なトピックは'
        '避けてください。（Flutter開発支援ツールについては除きます。）',
    en:
        'We are now accepting session speaker proposals for FlutterKaigi 2025!\n'
        'FlutterKaigi is a conference where technologists share their knowledge and '
        'experiences.\n'
        'Any topic related to Flutter or Dart is welcome. '
        'From beginner tips to advanced techniques, tutorials, library introductions, '
        'best practices, and challenging case studies, we are looking for content that is '
        'interesting to hear and beneficial to other developers.\n'
        'Please avoid talks that are primarily for promoting your company products or '
        'topics unrelated to Flutter or Dart. '
        '(Flutter development support tools are an exception.)',
  ),
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
