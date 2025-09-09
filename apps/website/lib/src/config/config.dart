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
  ),
  tickets: (
    title: (
      ja: 'チケットを購入する',
      en: 'Get Tickets',
    ),
    url: 'https://2025-app.flutterkaigi.jp/tickets',
  ),
  cfp: (
    title: (
      ja: 'プロポーザル一覧を見る',
      en: 'See Proposals',
    ),
    url: 'https://fortee.jp/flutterkaigi-2025/proposal/all',
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
  staff: _staff,
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
    url: 'https://recruit.demae-can.co.jp/',
    sns: (x: null),
    pr: (
      ja:
          '出前館はクイックコマースサービスとして領域を拡大し、'
          '当社のコーポレートミッション「テクノロジーで時間価値を高める」に基づき、'
          '利用いただいた皆さまに対して“時間価値の最大化“を実現していきたいと考えています。\n'
          '地域活性化とともに、少子高齢化や買い物難民の増加をはじめとした地域や社会課題の解決に向き合い、'
          '社会にとって不可欠なライフインフラとして日本経済の発展に貢献できるサービスを目指して挑戦を続けています。',
      en: null,
    ),
    logo: '/img/sponsor/demae-can.png',
    type: SponsorType.platinum,
    disable: false,
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
    url: 'https://www.revenuecat.com/jp/',
    sns: (x: 'RevenueCat'),
    pr: (
      ja:
          'RevenueCatは、iOS、Android、Webに対応した、'
          '世界有数のコンシューマーアプリ収益化プラットフォームを提供する米国企業です。'
          'サブスクリプション、消耗型アイテム、買い切り、ポイントに対応した課金・分析・コンバージョン最適化の一元管理を可能にします。'
          'ChatGPTやNotionを含む5万本以上のアプリに導入され、100億ドル以上の年間追跡売上を処理しています。詳しくはrevenuecat.com/jpをご覧ください。',
      en: null,
    ),
    logo: '/img/sponsor/revenuecat.png',
    type: SponsorType.platinum,
    disable: false,
  ),
  (
    name: '',
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
    url: 'https://corporate.iiba.space/',
    sns: (x: 'nanaizw'),
    pr: (
      ja:
          '株式会社iibaは、全国10万件超の子育てスポット情報を集約するマップアプリを運営しています。'
          '自治体・企業と連携し、地域経済を動かすプラットフォームへ成長中です。'
          'FlutterでUXを磨き、バウチャー決済や位置情報解析などを高速実装。'
          '社会課題を事業で解決しスケールさせる開発に挑みたい方、ぜひお話ししましょう！',
      en: null,
    ),
    logo: '/img/sponsor/iiba.png',
    type: SponsorType.gold,
    disable: false,
  ),
  (
    name: 'シンプレクス株式会社',
    url: 'https://www.simplex.inc/',
    sns: (x: 'SimplexHoldings'),
    pr: (
      ja:
          'シンプレクスは1997年の創業以来、メガバンクや大手総合証券を筆頭に、'
          '日本を代表する金融機関のテクノロジーパートナーとしてビジネスを展開してきました。'
          '現在では、金融領域で培った豊富なノウハウを活用し、金融機関以外の領域でもソリューションを展開しています。',
      en: null,
    ),
    logo: '/img/sponsor/simplex.png',
    type: SponsorType.gold,
    disable: false,
  ),
  (
    name: 'Codemagic',
    url: 'https://codemagic.io',
    sns: (x: 'codemagicio'),
    pr: (
      ja:
          // ignore: missing_whitespace_between_adjacent_strings
          'Codemagic はモバイルアプリ向けの高速 CI/CD です。'
          // ignore: missing_whitespace_between_adjacent_strings
          'iOS、Android、Flutter、React Native アプリをシームレスにビルド・テスト・リリースできます。'
          'ワークフローを自動化し、時間を節約して、自信を持ってリリースしましょう。',
      en: null,
    ),
    logo: '/img/sponsor/codemagic.png',
    type: SponsorType.gold,
    disable: false,
  ),
  (
    name: '株式会社MagicPod',
    url: 'https://magicpod.com/',
    sns: (x: 'MagicPodJP'),
    pr: (
      ja:
          'MagicPodは、モバイルアプリ・ブラウザ（ウェブアプリ）テストの両方に対応したAIテスト自動化プラットフォームを提供しています。'
          // ignore: missing_whitespace_between_adjacent_strings
          '自然言語だけでテストの作成・編集・実行ができる「MagicPod Autopilot」機能や、'
          'AIによる自動修正、クラウドでのサービス提供によるメンテナンス性の高さで、リリースサイクルの高速化を支援しています。',
      en: null,
    ),
    logo: '/img/sponsor/magic-pod.png',
    type: SponsorType.gold,
    disable: false,
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
    url: 'https://jobs.m3.com/product/',
    sns: (x: 'm3_engineering'),
    pr: (
      ja:
          'エムスリーは"インターネットを活用し、健康で楽しく長生きする人を１人でも増やし、不必要な医療コストを１円でも減らすこと"をミッションに、'
          'テクノロジーの力で日本および世界の医療の変革にチャレンジしています。',
      en: null,
    ),
    logo: '/img/sponsor/m3.png',
    type: SponsorType.silver,
    disable: false,
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
    url: 'https://youtrust.co.jp/',
    sns: (x: 'YOUTRUSTinc'),
    pr: (
      ja:
          '技術で世界を変えるFlutterエンジニアを応援！YOUTRUSTはキャリアSNSで技術者のつながりを創り、'
          'Flutter開発者の挑戦と成長を心から応援しています。',
      en: null,
    ),
    logo: '/img/sponsor/youtrust.png',
    type: SponsorType.silver,
    disable: false,
  ),
  (
    name: 'ソニー株式会社',
    url: 'https://www.sony.co.jp/',
    sns: (x: null),
    pr: (
      ja:
          'ソニー株式会社は「テクノロジーの力で未来のエンタテインメントをクリエイターと共創する」ことをミッションとし、'
          '世界中の人に感動を届けることをめざしています。\n'
          '新たな映像や音を表現するテクノロジーとサービスに挑戦し続け、世界中の人々を感動させるエンタテイメントの未来を、'
          'クリエイターと共に創造しています。',
      en: null,
    ),
    logo: '/img/sponsor/sony.png',
    type: SponsorType.silver,
    disable: false,
  ),
  (
    name: 'チームラボ株式会社',
    url: 'https://www.team-lab.com/',
    sns: (x: 'teamlab_recruit'),
    pr: (
      ja:
          '最新のテクノロジーを活用したソリューション、大規模なシステム開発、都市計画や、ICT空間設計などを行う。'
          'チームラボのFlutter活用事例はGoogle I/Oでも紹介されました。'
          ' https://youtu.be/OyS812ZoTzw',
      en: null,
    ),
    logo: '/img/sponsor/team-lab.png',
    type: SponsorType.silver,
    disable: false,
  ),
  (
    name: 'SODA inc.',
    url: 'https://soda-inc.jp/',
    sns: (x: null),
    pr: (
      ja:
          '「SNKRDUNK（スニーカーダンク）」は、'
          'スニーカーやアパレルを中心とするファッション領域やトレーディングカード・フィギュアなどを中心に、'
          '個人間での売買を簡単に行える国内最大級のファッション・コレクティブルマーケットプレイスです。',
      en: null,
    ),
    logo: '/img/sponsor/soda.png',
    type: SponsorType.silver,
    disable: false,
  ),
  (
    name: '株式会社hacomono',
    url: 'https://www.hacomono.co.jp/',
    sns: (x: 'hacomono_Dev'),
    pr: (
      ja:
          // ignore: missing_whitespace_between_adjacent_strings
          'hacomonoはウェルネス産業向けVertical SaaS企業です。'
          '会員管理のデジタル化を提供し、ジュニアスクールや公共施設等に導入されています。'
          '7月に発表のtoC向け新サービス「FitFits」の開発にFlutterを採用しています。',
      en: null,
    ),
    logo: '/img/sponsor/hacomono.png',
    type: SponsorType.silver,
    disable: false,
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
    url: 'https://i-bis.jp/',
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
  (
    name: '株式会社メンバーズ',
    url: 'https://www.members.co.jp/',
    sns: (x: 'Members_corp'),
    pr: (
      ja:
          '「DX現場支援で顧客と共に社会変革をリードする」を掲げ、デジタル人材の伴走によるDX現場支援事業を展開。'
          '高い専門スキルを持つデジタル人材が取引先企業のチームの一員として、内製によるDX推進を伴走支援しDX投資のROI最大化に貢献します。',
      en: null,
    ),
    logo: '/img/sponsor/members.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: '株式会社TRUSTDOCK',
    url: 'https://biz.trustdock.io/company',
    sns: (x: null),
    pr: (
      ja:
          'TRUSTDOCKは急成長するeKYC市場で、toB向け本人確認APIやtoC向けデジタルIDウォレットを開発し、'
          '社会のデジタル化を推進しています。フルリモートの環境で、社会に必要とされるプロダクトを一緒に開発しませんか？',
      en: null,
    ),
    logo: '/img/sponsor/trustdock.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: '',
    url: '',
    sns: (x: null),
    pr: (ja: '', en: null),
    logo: '',
    type: SponsorType.bronze,
    disable: true,
  ),
  (
    name: '株式会社Leafea',
    url: 'https://leafea.co.jp/',
    sns: (x: null),
    pr: (
      ja:
          'Leafea（リーフィ）は、物価高騰・低賃金時代における生活コスト削減を支援する福利厚生SaaSを展開するスタートアップ企業です。'
          'Flutterを活用したモバイルアプリ開発とAIの活用に注力しております。',
      en: null,
    ),
    logo: '/img/sponsor/leafea.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: '東急株式会社',
    url: 'https://10q89s.jp/',
    sns: (x: 'urban_89s'),
    pr: (
      ja:
          // ignore: missing_whitespace_between_adjacent_strings
          '東急(株)URBAN HACKSは「街づくりのDX」を実現するための内製開発チームです。'
          '東急グループの次の100年を変革する大プロジェクト。'
          'あなたの技術や知識を活かし、一緒に世界一の街づくりを目指してみませんか？',
      en: null,
    ),
    logo: '/img/sponsor/tokyu.png',
    type: SponsorType.bronze,
    disable: false,
  ),
  (
    name: '株式会社UPSIDER',
    url: 'https://corp.up-sider.com/',
    sns: (x: 'upsider_inc'),
    pr: (
      ja:
          '株式会社UPSIDERは「挑戦者を支える世界的な金融プラットフォームを創る」をミッションに、'
          '法人カード「UPSIDER」や請求書カード払いサービス「支払い.com」等の'
          '金融サービスやUPSIDER AI 経理などの新規サービスを展開。',
      en: null,
    ),
    logo: '/img/sponsor/upsider.png',
    type: SponsorType.bronze,
    disable: false,
  ),
];

typedef StaffInfo = ({
  String name,
  String avatar,
  String comment,
  ({
    String? x,
    String? bluesky,
    String? mixi2,
    String? medium,
    String? qiita,
    String? zenn,
    String? note,
    String? website,
  })
  sns,
});

const _staff = <StaffInfo>[
  (
    name: 'kuno',
    avatar: '/img/staff/Kunodayo_oboete.png',
    comment: '盛り上げていきマッショイ！！！！！！！！！！！！！！！',
    sns: (
      x: 'Kunodayo_oboete',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: 'kuno',
      zenn: 'kuno',
      note: null,
      website: null,
    ),
  ),
  (
    name: 'CardsEditor',
    avatar: '/img/staff/cardseditor.jpg',
    comment: '',
    sns: (
      x: 'cardseditor',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: null,
      zenn: null,
      note: null,
      website: null,
    ),
  ),
  (
    name: 'ENDO Takumi',
    avatar: '/img/staff/endotakumi_dev.png',
    comment: '',
    sns: (
      x: 'endotakumi_dev',
      bluesky: null,
      mixi2: null,
      medium: 'endo.takumi.info',
      qiita: 'ENDOTAKUMI',
      zenn: 'endotakumi',
      note: 'endo_takumi',
      website: 'https://endotakumi.github.io/',
    ),
  ),
  (
    name: '白崎 紀充',
    avatar: '/img/staff/magnet_0113_eng.png',
    comment: '',
    sns: (
      x: 'magnet_0113_eng',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: null,
      zenn: null,
      note: null,
      website: null,
    ),
  ),
  (
    name: 'm.kosuke',
    avatar: '/img/staff/kosuke_mtm.jpg',
    comment: 'フロサポ🐬',
    sns: (
      x: 'kosuke_mtm',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: 'mkosuke',
      zenn: 'mkosuke',
      note: 'shcahill',
      website: null,
    ),
  ),
  (
    name: 'Sohichiro/そーちゃん',
    avatar: '/img/staff/sohichiro.jpg',
    comment: '今年もやっていき！',
    sns: (
      x: 'sohichiro',
      bluesky: 'sohichiro',
      mixi2: null,
      medium: 'sohichiro',
      qiita: 'sohichiro',
      zenn: 'sohichiro',
      note: 'sohichiro',
      website: null,
    ),
  ),
  (
    name: 'おかやまん',
    avatar: '/img/staff/blendthink.jpg',
    comment: '開発楽しむ！',
    sns: (
      x: 'blendthink',
      bluesky: 'blendthink',
      mixi2: null,
      medium: 'blendthink',
      qiita: 'blendthink',
      zenn: 'blendthink',
      note: 'blendthink',
      website: null,
    ),
  ),
  (
    name: 'ちっぴー',
    avatar: '/img/staff/chippy_ao.png',
    comment: 'アプリの人として頑張ります。',
    sns: (
      x: 'chippy_ao',
      bluesky: null,
      mixi2: null,
      medium: 'chippy-ao',
      qiita: null,
      zenn: 'chippy',
      note: null,
      website: null,
    ),
  ),
  (
    name: 'もぐもぐ',
    avatar: '/img/staff/YumNumm.jpg',
    comment: '2025年もよろしくお願いします!',
    sns: (
      x: 'YumNumm',
      bluesky: 'YumNumm',
      mixi2: null,
      medium: 'YumNumm',
      qiita: 'YumNumm',
      zenn: 'YumNumm',
      note: null,
      website: 'https://yumnumm.dev',
    ),
  ),
  (
    name: 'jiyuujin',
    avatar: '/img/staff/jiyuujinlab.png',
    comment: '',
    sns: (
      x: 'jiyuujinlab',
      bluesky: 'jiyuujin',
      mixi2: null,
      medium: 'jiyuujin',
      qiita: 'jiyuujin',
      zenn: 'jiyuujin',
      note: 'uraneko',
      website: 'https://yuma-kitamura.nekohack.me/',
    ),
  ),
  (
    name: 'Keito',
    avatar: '/img/staff/techkeito.jpg',
    comment: 'アプリ開発チームやってました！宜しくお願い致します！',
    sns: (
      x: 'techkeito',
      bluesky: null,
      mixi2: null,
      medium: 'techkeito',
      qiita: 'katekun',
      zenn: 'keito',
      note: null,
      website: null,
    ),
  ),
  (
    name: 'うめちゃん',
    avatar: '/img/staff/umechanhika.png',
    comment: '参加者の皆さんが楽しめる会になるように頑張ります！',
    sns: (
      x: 'umechanhika',
      bluesky: null,
      mixi2: null,
      medium: 'umechanhika',
      qiita: 'umechanhika',
      zenn: 'umechanhika',
      note: 'umechanhika',
      website:
          'https://umechanhika.notion.site/903ff47c623343c695ba9d4f5292e9b5',
    ),
  ),
  (
    name: 'たっつー',
    avatar: '/img/staff/tatsutakein.png',
    comment: 'アプリチーム頑張ります 💪',
    sns: (
      x: 'tatsutakein',
      bluesky: 'tatsutakein',
      mixi2: null,
      medium: 'tatsutakein',
      qiita: 'tatsutakein',
      zenn: 'tatsutakein',
      note: 'tatsutakein',
      website: 'https://tatsutakein.jp/',
    ),
  ),
  (
    name: 'asuka',
    avatar: '/img/staff/a_skua.png',
    comment: 'I □ Flutter',
    sns: (
      x: 'a_skua',
      bluesky: 'askua.dev',
      mixi2: null,
      medium: null,
      qiita: null,
      zenn: null,
      note: null,
      website: null,
    ),
  ),
  (
    name: 'Kurogoma4D',
    avatar: '/img/staff/Krgm4D.png',
    comment: 'アプリつくります',
    sns: (
      x: 'Krgm4D',
      bluesky: 'krgm4d.dev',
      mixi2: null,
      medium: null,
      qiita: null,
      zenn: 'kurogoma4d',
      note: null,
      website: 'https://krgm4d.dev',
    ),
  ),
  (
    name: 'いせりゅー',
    avatar: '/img/staff/isekiryu.png',
    comment: '個人開発で「FoodGram」のアプリを作っています！',
    sns: (
      x: 'isekiryu',
      bluesky: 'iseryu.bsky.social',
      mixi2: null,
      medium: 'iseryuuuuu3',
      qiita: 'isekiryu',
      zenn: 'iseki',
      note: 'iseryu',
      website: null,
    ),
  ),
  (
    name: 'katsuumy',
    avatar: '/img/staff/katsuumy.png',
    comment: '',
    sns: (
      x: 'katsuumy',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: null,
      zenn: null,
      note: null,
      website: null,
    ),
  ),
  (
    name: 'okaryo',
    avatar: '/img/staff/okaryoX.png',
    comment: '💪☺️👍',
    sns: (
      x: 'okaryoX',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: 'okaryo',
      zenn: null,
      note: null,
      website: 'https://github.com/okaryo',
    ),
  ),
  (
    name: 'K9i',
    avatar: '/img/staff/K9i_apps.png',
    comment: '🐙',
    sns: (
      x: 'K9i_apps',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: 'K9i',
      zenn: 'k9i',
      note: null,
      website: 'https://github.com/K9i-0',
    ),
  ),
  (
    name: 'minn',
    avatar: '/img/staff/minn_flutter.jpg',
    comment: '',
    sns: (
      x: 'minn_flutter',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: 'minn',
      zenn: 'minn',
      note: null,
      website: null,
    ),
  ),
  (
    name: 'Shohei Ogawa',
    avatar: '/img/staff/heyhey1028.png',
    comment: 'ヒトと技術とお酒が好き',
    sns: (
      x: 'heyhey1028',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: 'heyhey1028',
      zenn: 'heyhey1028',
      note: null,
      website: null,
    ),
  ),
  (
    name: 'masa-futa',
    avatar: '/img/staff/ma12441469.jpg',
    comment: "wai wai ٩( 'ω' )و",
    sns: (
      x: 'ma12441469',
      bluesky: null,
      mixi2: null,
      medium: 'masakunn1215',
      qiita: 'masakunn1215',
      zenn: null,
      note: null,
      website: null,
    ),
  ),
  (
    name: 'ゆう',
    avatar: '/img/staff/yu_s1127.jpg',
    comment: 'よろしくお願いいたします！',
    sns: (
      x: 'yu_s1127',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: null,
      zenn: null,
      note: null,
      website: null,
    ),
  ),
  (
    name: 'Tommy (Thomas Aquinas)',
    avatar: '/img/staff/ThomasS2558.png',
    comment: '',
    sns: (
      x: 'ThomasS2558',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: null,
      zenn: null,
      note: null,
      website: null,
    ),
  ),
  (
    name: 'おはぎ(あきばこ)',
    avatar: '/img/staff/a_key_bako.jpg',
    comment: '',
    sns: (
      x: 'a_key_bako',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: null,
      zenn: null,
      note: null,
      website: null,
    ),
  ),
  (
    name: 'yasuda makoto',
    avatar: '/img/staff/1234567890kuro.jpg',
    comment: '',
    sns: (
      x: '1234567890kuro',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: null,
      zenn: null,
      note: null,
      website: null,
    ),
  ),
  (
    name: 'offich',
    avatar: '/img/staff/offichy.png',
    comment: 'よろしくお願いいたします！',
    sns: (
      x: 'offichy',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: null,
      zenn: null,
      note: null,
      website: 'https://offich.me',
    ),
  ),
  (
    name: 'sw',
    avatar: '/img/staff/s4y_wt.png',
    comment: '',
    sns: (
      x: 's4y_wt',
      bluesky: null,
      mixi2: null,
      medium: null,
      qiita: null,
      zenn: null,
      note: null,
      website: null,
    ),
  ),
];
