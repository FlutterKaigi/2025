import 'package:flutterkaigi_2025_website/text.dart' show Language;
import './config_stub.dart' if (dart.library.js_interop) './config_web.dart';

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
  date: DateTime.utc(2038, 11).toLocal(),
  place: (name: (ja: '東京', en: 'Tokyo'), url: 'https://example.com'),
  blog: (
    sponsorship: (
      title: 'FlutterKaigi 2025 スポンサー募集について',
      url:
          'https://medium.com/flutterkaigi/flutterkaigi-2025-スポンサー募集について-034330881a94',
    ),
  ),
  schedule: [
    (
      title: (ja: 'スポンサー募集開始', en: null),
      date: DateTime.utc(2038, 1, 1).toLocal(),
    ),
    (
      title: (ja: 'プロポーザル募集開始', en: null),
      date: DateTime.utc(2038, 1, 2).toLocal(),
    ),
    (
      title: (ja: 'チケット販売開始', en: null),
      date: DateTime.utc(2038, 1, 3).toLocal(),
    ),
    (
      title: (ja: 'FlutterKaigi 2025当日', en: null),
      date: DateTime.utc(2038, 11, 1).toLocal(),
    ),
  ],
);

/// ユーザー設定
final user = _User();

final class _User {
  Language lang = systemLang;
}
