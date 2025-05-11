import 'package:flutterkaigi_2025_website/config_stub.dart'
    if (dart.library.js_interop) './config_web.dart';
import 'package:flutterkaigi_2025_website/text.dart' show Language;

String makeTitle([String? sub]) =>
    sub == null ? site.title : '$sub - ${site.title}';

/// サイト情報
const site = (
  title: 'FlutterKaigi 2025',
  since: '2021',
  until: '2025',
  organizer: 'FlutterKaigi 実行委員会',
  snsLinks: [
    (
      title: 'X',
      url: 'https://x.com/FlutterKaigi',
      icon: '/img/icon_sns_x.svg',
    ),
    (
      title: 'GitHub',
      url: 'https://github.com/FlutterKaigi',
      icon: '/img/icon_sns_github.svg',
    ),
    (
      title: 'Discord',
      url: 'https://discord.com/invite/Nr7H8JTJSF',
      icon: '/img/icon_sns_discord.svg',
    ),
    (
      title: 'Medium',
      url: 'https://medium.com/flutterkaigi',
      icon: '/img/icon_sns_medium.svg',
    ),
  ],
  externalLinks: [
    (
      title: (ja: '行動規範', en: 'Code of Conduct'),
      url: (
        ja: 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja',
        en: 'https://docs.flutterkaigi.jp/Code-of-Conduct',
      ),
    ),
    (
      title: (ja: 'プライバシーポリシー', en: 'Privacy Policy'),
      url: (
        ja: 'https://docs.flutterkaigi.jp/Privacy-Policy.ja',
        en: 'https://docs.flutterkaigi.jp/Privacy-Policy',
      ),
    ),
    (
      title: (ja: '相談窓口', en: 'Contact'),
      url: (
        ja:
            'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform',
        en: null,
      ),
    ),
    (
      title: (ja: 'リポジトリー', en: 'Repository'),
      url: (ja: 'https://github.com/FlutterKaigi/2025', en: null),
    ),
  ],
);

/// イベント情報
final event = (
  title: 'FlutterKaigi 2025',
  tagLine: 'Dash into Innovation.',
  date: DateTime.parse('2025-11-13T10:00:00+0900').toLocal(),
  place: (
    name: (ja: 'OtemachiPLACE HALL & CONFERENCE', en: null),
    url: 'https://otemachi-place-hc.jp/',
  ),
  blog: (
    sponsorship: (
      title: (ja: 'スポンサー募集について', en: 'About Sponsor Recruitment'),
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
      title: (ja: 'スポンサー募集開始', en: 'Call for Sponsors Opens'),
      date: DateTime.parse('2026-05-19T00:00:00+0900').toLocal(),
    ),
    (
      title: (ja: 'プロポーザル募集開始', en: 'Call for Proposals Opens'),
      date: DateTime.parse('2025-06-23T00:00:00+0900').toLocal(),
    ),
    (
      title: (ja: 'チケット販売開始', en: 'Ticket Sales Begin'),
      date: DateTime.parse('2025-07-28T00:00:00+0900').toLocal(),
    ),
    (
      title: (ja: '前夜祭', en: 'Pre-event Party'),
      date: DateTime.parse('2025-11-12T19:00:00+0900').toLocal(),
    ),
    (
      title: (ja: 'FlutterKaigi 2025当日', en: 'FlutterKaigi 2025 Event Day'),
      date: DateTime.parse('2025-11-13T10:00:00+0900').toLocal(),
    ),
  ],
  pastEvents: [
    (title: '2024', url: 'https://2024.flutterkaigi.jp/'),
    (title: '2023', url: 'https://2023.flutterkaigi.jp/'),
    (title: '2022', url: 'https://2022.flutterkaigi.jp/'),
    (title: '2021', url: 'https://2021.flutterkaigi.jp/'),
  ],
);

/// ユーザー設定
final user = _User();

final class _User {
  Language lang = systemLang;
}
