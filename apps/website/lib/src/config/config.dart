typedef LangBlock = ({String ja, String en});

sealed class LinkBase {}

final class SnsLink implements LinkBase {
  const SnsLink({required this.title, required this.url, required this.icon});
  final String title;
  final String url;
  final String icon;
}

final class RelatedLink implements LinkBase {
  const RelatedLink({required this.title, required this.url});
  final LangBlock title;
  final LangBlock url;
}

final class PastEventLink implements LinkBase {
  const PastEventLink({required this.title, required this.url});
  final String title;
  final String url;
}

final _eventDate = DateTime.parse('2025-11-13T10:00:00+0900').toLocal();

String makeTitle([String? sub]) =>
    sub == null ? site.title : '$sub - ${site.title}';

/// サイト情報
const site = (
  title: 'FlutterKaigi 2025',
  since: '2021',
  until: '2025',
  organizer: 'FlutterKaigi 実行委員会',
  snsLinks: <LinkBase>[
    SnsLink(
      title: 'X',
      url: 'https://x.com/FlutterKaigi',
      icon: '/img/icon_sns_x.svg',
    ),
    SnsLink(
      title: 'GitHub',
      url: 'https://github.com/FlutterKaigi',
      icon: '/img/icon_sns_github.svg',
    ),
    SnsLink(
      title: 'Discord',
      url: 'https://discord.com/invite/Nr7H8JTJSF',
      icon: '/img/icon_sns_discord.svg',
    ),
    SnsLink(
      title: 'Medium',
      url: 'https://medium.com/flutterkaigi',
      icon: '/img/icon_sns_medium.svg',
    ),
  ],
  externalLinks: <LinkBase>[
    RelatedLink(
      title: (ja: '行動規範', en: 'Code of Conduct'),
      url: (
        ja: 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja',
        en: 'https://docs.flutterkaigi.jp/Code-of-Conduct',
      ),
    ),
    RelatedLink(
      title: (ja: 'プライバシーポリシー', en: 'Privacy Policy'),
      url: (
        ja: 'https://docs.flutterkaigi.jp/Privacy-Policy.ja',
        en: 'https://docs.flutterkaigi.jp/Privacy-Policy',
      ),
    ),
    RelatedLink(
      title: (ja: '反社会的勢力の排除に関して', en: 'Exclusion of Anti-Social Forces'),
      url: (
        ja: 'https://docs.flutterkaigi.jp/Exclusion-of-Anti-Social-Forces.ja',
        en: 'https://docs.flutterkaigi.jp/Exclusion-of-Anti-Social-Forces',
      ),
    ),
    RelatedLink(
      title: (ja: '相談窓口', en: 'Contact'),
      url: (
        ja: 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform',
        en: 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform',
      ),
    ),
    RelatedLink(
      title: (ja: 'リポジトリー', en: 'Repository'),
      url: (
        ja: 'https://github.com/FlutterKaigi/2025',
        en: 'https://github.com/FlutterKaigi/2025',
      ),
    ),
  ],
);

/// イベント情報
final event = (
  title: 'FlutterKaigi 2025',
  tagLine: 'Dash into Innovation.',
  date: _eventDate,
  place: (
    name: (ja: 'Otemachi PLACE HALL & CONFERENCE', en: null),
    url: 'https://otemachi-place-hc.jp/',
  ),
  blog: (
    sponsorship: (
      title: (ja: 'スポンサー募集について', en: 'About Sponsor Recruitment'),
      url: (
        ja: 'https://medium.com/flutterkaigi/flutterkaigi-2025-スポンサー募集について-034330881a94',
        en: 'https://medium.com/flutterkaigi/sponsoring-flutterkaigi-2025-da290533feb6',
      ),
    ),
  ),
  applyForCfp: (
    title: (
      ja: 'CfPの申し込みはこちら',
      en: 'Click here to apply for CfP',
    ),
    url: (
      //TODO リンクを載せる
      ja: '',
      en: '',
    ),
  ),
  schedule: [
    (
      title: (ja: 'スポンサー募集開始', en: 'Call for Sponsors Opens'),
      date: DateTime.parse('2025-05-19T00:00:00+0900').toLocal(),
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
      date: _eventDate,
    ),
  ],
  pastEvents: <LinkBase>[
    const PastEventLink(title: '2024', url: 'https://2024.flutterkaigi.jp/'),
    const PastEventLink(title: '2023', url: 'https://2023.flutterkaigi.jp/'),
    const PastEventLink(title: '2022', url: 'https://2022.flutterkaigi.jp/'),
    const PastEventLink(title: '2021', url: 'https://2021.flutterkaigi.jp/'),
  ],
  sponsors: _sponsors,
);

typedef SponsorInfo = ({
  String name,
  String url,
  ({String x}) sns,
  String pr,
  String logo,
  SponsorType type,
});

enum SponsorType {
  platinum,
  gold,
  silver,
  bronze,
}

extension SponsorTypeExtension on SponsorType {
  String get name => switch (this) {
    SponsorType.platinum => 'Platinum',
    SponsorType.gold => 'Gold',
    SponsorType.silver => 'Silver',
    SponsorType.bronze => 'Bronze',
  };
}

const _sponsors = <SponsorInfo>[
  (
    name: '株式会社ゆめみ',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/yumemi.png',
    type: SponsorType.platinum,
  ),
  (
    name: '株式会社出前館',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/demae-can.png',
    type: SponsorType.platinum,
  ),
  (
    name: '株式会社サイバーエージェント',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/cyberagent.png',
    type: SponsorType.gold,
  ),
  (
    name: 'ZOZO, Inc.',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/zozo.png',
    type: SponsorType.silver,
  ),
  (
    name: '株式会社GENDA',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/genda.png',
    type: SponsorType.silver,
  ),
  (
    name: 'エムスリー株式会社',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/m3.png',
    type: SponsorType.silver,
  ),
  (
    name: "株式会社Linc'well",
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/lincwell.png',
    type: SponsorType.silver,
  ),
  (
    name: '株式会社ディー・エヌ・エー',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/dena.png',
    type: SponsorType.silver,
  ),
  (
    name: 'CodeRabbit',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/coderabbit.png',
    type: SponsorType.silver,
  ),
  (
    name: '株式会社MIXI',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/mixi.png',
    type: SponsorType.bronze,
  ),
  (
    name: 'スタディプラス株式会社',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/studyplus.png',
    type: SponsorType.bronze,
  ),
  (
    name: '株式会社ギークニア',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/geekneer.png',
    type: SponsorType.bronze,
  ),
  (
    name: 'Sentry',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/sentry.png',
    type: SponsorType.bronze,
  ),
  (
    name: 'パイオニア株式会社',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/pioneer.png',
    type: SponsorType.bronze,
  ),
  (
    name: '株式会社メドレー',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/medley.png',
    type: SponsorType.bronze,
  ),
  (
    name: 'Hamee株式会社',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/hamee.png',
    type: SponsorType.bronze,
  ),
  (
    name: '株式会社アイビス',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/ibis.png',
    type: SponsorType.bronze,
  ),
  (
    name: '株式会社LayerX',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/layerx.png',
    type: SponsorType.bronze,
  ),
  (
    name: 'NTTレゾナントテクノロジー株式会社',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/ntt-resonant-tech.png',
    type: SponsorType.bronze,
  ),
  (
    name: '株式会社IBJ',
    url: '',
    sns: (x: ''),
    pr: '',
    logo: '/img/sponsor/ibj.png',
    type: SponsorType.bronze,
  ),
];
