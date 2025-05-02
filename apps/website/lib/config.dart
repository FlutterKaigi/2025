import 'package:flutterkaigi_2025_website/config_stub.dart'
    if (dart.library.js_interop) './config_web.dart';
import 'package:flutterkaigi_2025_website/text.dart' show Language;

String makeTitle([String? sub]) =>
    sub == null ? site.title : '$sub - ${site.title}';

/// サイト情報
const site = (
  title: 'FlutterKaigi 2025',
  since: '2025',
  organizer: 'FlutterKaigi',
  repository: (url: 'https://github.com/FlutterKaigi/2025'),
);

/// イベント情報
final event = (
  title: 'FlutterKaigi 2025',
  // FIXME 正しい日付を入れる
  date: DateTime.parse('2038-11-01T10:00:00+0900').toLocal(),
  place: (name: (ja: '東京', en: 'Tokyo'), url: 'https://example.com'),
  blog: (
    sponsorship: (
      title: (
        ja: 'FlutterKaigi 2025 スポンサー募集について',
        en: 'FlutterKaigi 2025 About Sponsor Recruitment',
      ),
      url: (
        ja:
            'https://medium.com/flutterkaigi/flutterkaigi-2025-スポンサー募集について-034330881a94',
        en:
            'https://medium.com/flutterkaigi/sponsoring-flutterkaigi-2025-da290533feb6',
      ),
    ),
  ),
  schedule: [
    (
      title: (ja: 'スポンサー募集開始', en: null),
      date: DateTime.parse('2038-01-01T12:00:00+0900').toLocal(),
    ),
    (
      title: (ja: 'プロポーザル募集開始', en: null),
      date: DateTime.parse('2038-01-02T12:00:00+0900').toLocal(),
    ),
    (
      title: (ja: 'チケット販売開始', en: null),
      date: DateTime.parse('2038-01-03T12:00:00+0900').toLocal(),
    ),
    (
      title: (ja: '前夜祭', en: null),
      date: DateTime.parse('2038-01-03T12:00:00+0900').toLocal(),
    ),
    (
      title: (ja: 'FlutterKaigi 2025当日', en: null),
      date: DateTime.parse('2038-01-04T12:00:00+0900').toLocal(),
    ),
  ],
);

/// ユーザー設定
final user = _User();

final class _User {
  Language lang = systemLang;
}
