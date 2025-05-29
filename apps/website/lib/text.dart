import 'package:flutterkaigi_2025_website/src/config/config.dart' show user;

const _month = {
  1: 'Jan',
  2: 'Feb',
  3: 'Mar',
  4: 'Apr',
  5: 'May',
  6: 'Jun',
  7: 'Jul',
  8: 'Aug',
  9: 'Sep',
  10: 'Oct',
  11: 'Nov',
  12: 'Dec',
};

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
);

String formatDate(DateTime date, [Language? lang]) =>
    switch (lang ?? user.lang) {
      Language.en => '${_month[date.month]} ${date.day}, ${date.year}',
      _ => '${date.year}年${date.month}月${date.day}日',
    };

extension ContentEx on Content {
  /// テキストコンテンツを取得する
  String get text => switch (user.lang) {
    Language.en => this.en ?? this.ja,
    _ => this.ja,
  };
}
