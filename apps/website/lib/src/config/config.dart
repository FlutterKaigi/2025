import 'package:flutterkaigi_2025_website/text.dart' show Content;

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
    topUrl: 'https://medium.com/flutterkaigi',
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
  ({String? x}) sns,
  Content pr,
  String logo,
  SponsorType type,
  bool disable,
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
    url: 'https://yumemi.co.jp/',
    sns: (x: 'yumemiinc'),
    pr: (
      ja:
          '6000万人のみんな知ってるあのサービスも、ゆめみが一緒に作ってます。'
          '大手企業や急成長スタートアップと共創型でWeb/スマホのサービス作りや内製化支援を行っています。'
          '【エンジニアが最も成長できる会社No.1】を目標にした、アジャイル組織として先端を走るエンジニア集団です。',
      en: null,
    ),
    logo: '/img/sponsor/yumemi.png',
    type: SponsorType.platinum,
    disable: false,
  ),
  (
    name: '株式会社出前館',
    url: '',
    sns: (x: null),
    pr: (ja: '', en: null),
    logo: '/img/sponsor/demae-can.png',
    type: SponsorType.platinum,
    disable: true,
  ),
  (
    name: '株式会社アサイン',
    url: 'https://assign-inc.com/',
    sns: (x: null),
    pr: (
      ja:
          'アサインは「人」と「技術」の力で、若手ハイエンド向けのキャリア支援サービスを提供しています。\n\n'
          '転職サイト『ASSIGN』は、単なる転職支援に留まらず、長期のキャリア形成をサポートするために、'
          'キャリア実現に欠かせないパーソナライズされた情報へのアクセスを容易にしています。'
          '技術の力を最大限活用し、ユーザーへの提供価値を向上させています。\n\n'
          '若手ハイエンド特化の転職サイト『ASSIGN』\n'
          '・2019年のサービス開始以来 累計ユーザー数66万人突破\n'
          '・2021年4月からFlutterで開発',
      en: null,
    ),
    logo: '/img/sponsor/assign.png',
    type: SponsorType.platinum,
    disable: false,
  ),
  (
    name: 'RevenueCat, Inc.',
    url: '',
    sns: (x: null),
    pr: (ja: '', en: null),
    logo: '',
    type: SponsorType.platinum,
    disable: true,
  ),
  (
    name: '株式会社サイバーエージェント',
    url: 'https://www.cyberagent.co.jp/',
    sns: (x: 'ca_developers'),
    pr: (
      ja:
          'サイバーエージェントはインターネットを軸に、メディア&IP事業、インターネット広告事業、ゲーム事業と主に3つの事業を展開しています。'
          'その他にもIP・コンテンツ、AI、DXを強化分野として事業創出に取り組んでおり、様々な事業でFlutterの活用事例があります。'
          '社内発の社外向けの勉強会である「CA.flutter」も定期的に開催しています。',
      en: null,
    ),
    logo: '/img/sponsor/cyberagent.png',
    type: SponsorType.gold,
    disable: false,
  ),
  (
    name: '株式会社iiba',
    url: '',
    sns: (x: null),
    pr: (ja: '', en: null),
    logo: '',
    type: SponsorType.gold,
    disable: true,
  ),
  (
    name: 'ZOZO, Inc.',
    url: 'https://corp.zozo.com/',
    sns: (x: 'zozotech'),
    pr: (
      ja:
          'ファッションEC「ZOZOTOWN」、'
          'ファッションコーディネートアプリ「WEAR by ZOZO」など各種サービスの企画・展開のほか、 '
          '「ZOZOSUIT」「ZOZOMAT」「ZOZOGLASS」など計測技術の開発・活用にも取り組んでいます。',
      en: null,
    ),
    logo: '/img/sponsor/zozo.png',
    type: SponsorType.silver,
    disable: false,
  ),
  (
    name: '株式会社GENDA',
    url: 'https://genda.jp/',
    sns: (x: 'GENDA_jp'),
    pr: (
      ja:
          '「世界中の人々の人生をより楽しく」をAspirationに掲げるエンタメ企業。'
          '「GiGO」等のアミューズメント施設運営やカラオケ、キャラクターMD、F&B、'
          'コンテンツ&プロモーションなどエンタメ領域で事業を展開しています。',
      en: null,
    ),
    logo: '/img/sponsor/genda.png',
    type: SponsorType.silver,
    disable: false,
  ),
  (
    name: 'エムスリー株式会社',
    url: '',
    sns: (x: null),
    pr: (ja: '', en: null),
    logo: '/img/sponsor/m3.png',
    type: SponsorType.silver,
    disable: true,
  ),
  (
    name: "株式会社Linc'well",
    url: 'https://linc-well.com/',
    sns: (x: 'lincwell_dev'),
    pr: (
      ja:
          "Linc'wellは「テクノロジーを通じて、医療を一歩前へ」をミッションに掲げ、"
          '医療を効率化し患者の医療体験と医療の質の向上を目指した事業展開を行っています。'
          '2023年リリースのFlutterアプリ「クリフォア」を開発する仲間を募集中です！',
      en: null,
    ),
    logo: '/img/sponsor/lincwell.png',
    type: SponsorType.silver,
    disable: false,
  ),
  (
    name: '株式会社ディー・エヌ・エー',
    url: 'https://dena.com/jp/',
    sns: (x: 'DeNAxTech'),
    pr: (
      ja:
          'DeNAは、事業価値の最大化と課題解決のためのAI活用と独自のデータ分析手法によって、'
          'ゲーム、ライブスコミュニティ、スポーツ・まちづくり、ヘルスケア・メディカルなど幅広い事業を展開しています。',
      en:
          'At DeNA (pronounced "D-N-A") we use AI technology'
          ' and our unique data analysis methods to maximize business value'
          ' and solve problems to engage in a variety of businesses,'
          ' from games and live communities'
          ' to sports & the community and healthcare & medical.',
    ),
    logo: '/img/sponsor/dena.png',
    type: SponsorType.silver,
    disable: false,
  ),
  (
    name: 'CodeRabbit',
    url: 'https://www.coderabbit.ai',
    sns: (x: 'Coderabbitaija'),
    pr: (
      ja:
          'CodeRabbitはAIコードレビューサービスです。'
          'GitHub/GitLabなどのPRに対して、自動的にコードレビューを行います。'
          'レビューの負荷軽減、時間削減、チーム開発効率化に貢献します！',
      en: null,
    ),
    logo: '/img/sponsor/coderabbit.png',
    type: SponsorType.silver,
    disable: false,
  ),
  (
    name: '株式会社YOUTRUST',
    url: '',
    sns: (x: null),
    pr: (ja: '', en: null),
    logo: '',
    type: SponsorType.silver,
    disable: true,
  ),
  (
    name: 'ソニー株式会社',
    url: '',
    sns: (x: null),
    pr: (ja: '', en: null),
    logo: '',
    type: SponsorType.silver,
    disable: true,
  ),
  (
    name: 'チームラボ株式会社',
    url: '',
    sns: (x: null),
    pr: (ja: '', en: null),
    logo: '',
    type: SponsorType.silver,
    disable: true,
  ),
  (
    name: '株式会社MIXI',
    url: 'https://mixi.co.jp/',
    sns: (x: 'mixi_engineers'),
    pr: (
      ja:
          'MIXIは、「豊かなコミュニケーションを広げ、世界を幸せな驚きで包む。」というパーパスのもと、'
          '「mixi」や「モンスターストライク」など、友人や家族間で一緒に楽しむコミュニケーションサービスを提供しています。',
      en: null,
    ),
    logo: '/img/sponsor/mixi.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: 'スタディプラス株式会社',
    url: 'https://info.studyplus.co.jp/',
    sns: (x: 'studyplus_dev'),
    pr: (
      ja:
          'スタディプラスは「学ぶ喜びをすべての人へ」をミッションに、'
          '学習の記録・可視化・共有をサポートするStudyplusを提供しています。'
          '楽しく学びを広げるプラットフォームを一緒に作りませんか？あなたのアイデアが、学びを豊かにする力になります。',
      en: null,
    ),
    logo: '/img/sponsor/studyplus.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: '株式会社ギークニア',
    url: 'https://geekneer.com/',
    sns: (x: 'geekneerjp'),
    pr: (
      ja:
          'ギークニアは、転職エージェントが全員元エンジニアの人材紹介会社です。'
          'エンジニア、ITコンサル、PM、データサイエンティスト、PdM、SRE、QAエンジニアなど'
          'IT専門職の方のキャリアサクセスを応援しております。',
      en: null,
    ),
    logo: '/img/sponsor/geekneer.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: 'Sentry',
    url: 'https://sentry.ichizoku.io/',
    sns: (x: 'SentryJapan'),
    pr: (
      ja:
          'Sentryはリアルタイムエラー追跡と詳細情報提供で迅速な問題特定を実現。'
          '多言語対応でウェブ、モバイル、バックエンドを一気通貫で監視が可能。'
          'Ichizokuとの協業で日本市場向けに特化した強力なサポートを提供し、迅速な対応を実現しています。',
      en: null,
    ),
    logo: '/img/sponsor/sentry.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: 'パイオニア株式会社',
    url: 'https://jpn.pioneer/ja/',
    sns: (x: 'Pioneer_PR'),
    pr: (
      ja:
          '企業ミッション「より多くの人と、感動を」のもと、'
          'カーエレクトロニクス分野を中心に、斬新でユニークな発想とテクノロジーを活かし、'
          '車室内の快適性、感動、安心・安全を実現する製品・サービスを提供することで、新たな価値を提案していく会社です',
      en: null,
    ),
    logo: '/img/sponsor/pioneer.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: '株式会社メドレー',
    url: 'https://www.medley.jp/',
    sns: (x: 'medley_dev'),
    pr: (
      ja:
          'メドレーは、「医療ヘルスケアの未来をつくる」ミッションのもと、'
          'テクノロジーを活用した事業やプロジェクトを通じて、医療ヘルスケア分野の課題を解決していきます。'
          'それにより、「持続可能な医療」の実現と、「納得できる医療」の実現を目指しています。',
      en: null,
    ),
    logo: '/img/sponsor/medley.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: 'Hamee株式会社',
    url: 'https://hamee.co.jp/recruit/love-odawara',
    sns: (x: null),
    pr: (
      ja:
          '私たちHameeのPurposeは「クリエイティブ魂に火をつける」です。\n'
          'クリエイティブ魂は、自分らしさを最大限に発揮し、挑戦し、成し遂げる時に燃え盛ります。\n'
          'この炎を広げ、世界中を熱くすることが私たちの使命です。 ',
      en: null,
    ),
    logo: '/img/sponsor/hamee.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: '株式会社アイビス',
    url: 'https://i-bis.jp/company/profile/',
    sns: (x: 'Ibis_official_'),
    pr: (
      ja:
          'アイビスはFlutterでの開発支援を通じて、関わるすべての人と企業が成長できる持続可能な関係づくりを目指しています。\n'
          '共にアイビスを創る仲間も募集しています。',
      en: null,
    ),
    logo: '/img/sponsor/ibis.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: '株式会社LayerX',
    url: 'https://layerx.co.jp',
    sns: (x: 'LayerX_Tech'),
    pr: (
      ja:
          'LayerXは「すべての経済活動を、デジタル化する。」をミッションに掲げ、'
          'SaaS+Fintechを軸に、AIを中心としたソフトウェア体験を社会実装するスタートアップです。'
          'AIを活用し「時間を創造するモバイルアプリ」を一緒に作りませんか？',
      en: null,
    ),
    logo: '/img/sponsor/layerx.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: 'NTTレゾナントテクノロジー株式会社',
    url: 'https://nttr-tech.co.jp/',
    sns: (x: 'nttr_tech'),
    pr: (
      ja:
          'FlutterKaigi参加者の皆さんへ──NTTレゾナントテクノロジーはUXにこだわるNTTドコモグループの技術カンパニーです。'
          '技術を活かし、共に革新的な体験を創りませんか？フルリモート・フルフレックスで挑戦できる環境が整っています。',
      en: null,
    ),
    logo: '/img/sponsor/ntt-resonant-tech.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: '株式会社IBJ',
    url: 'https://www.ibjapan.jp/',
    sns: (x: 'IBJ_renmei'),
    pr: (
      ja:
          '様々な婚活サービスとライフデザインサービスを提供し、日本の婚姻数の3％、最も多くの結婚カップルを創出しています。\n'
          '「IT×ヒト」を強みにサービス部門だけでなく、アプリやシステムを改修・開発などクリエイターやエンジニアも活躍している会社です。',
      en: null,
    ),
    logo: '/img/sponsor/ibj.png',
    type: SponsorType.bronze,
    disable: false,
  ),
];
