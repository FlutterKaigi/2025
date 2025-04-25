import 'package:flutterkaigi_2025_website/config.dart' show user, event;

/// 表示言語
enum Language { ja, en }

/// テキストコンテンツ
/// - [ja] 日本語 (デフォルト言語)
/// - [en] 英語
typedef Content = ({String ja, String? en});

final contents = (
  lang: const (ja: 'JA', en: 'EN'),
  dateLabel: (ja: '開催日', en: 'Date'),
  date: (
    ja: '${event.date.year}年${event.date.month}月${event.date.day}日 開催決定!',
    en: null,
  ),
  repository: (ja: 'Repository', en: null),
  moveToTop: (ja: 'トップ', en: 'Top'),
);

/// テキストコンテンツを取得する
String text(Content content) => switch (user.lang) {
  Language.en => content.en ?? content.ja,
  _ => content.ja,
};
