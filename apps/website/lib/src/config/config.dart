import 'package:db_types/db_types.dart';
import 'package:flutterkaigi_2025_website/src/config/sessions_data.dart'
    show timelineEvents, venuesWithSessions;
import 'package:flutterkaigi_2025_website/src/config/sponsors_data.dart'
    show companySponsors;
import 'package:flutterkaigi_2025_website/src/config/staffs_data.dart'
    show staffMembers;
import 'package:flutterkaigi_2025_website/src/config/timeline_converter.dart';
import 'package:flutterkaigi_2025_website/text.dart' show Content, Place;

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
    url: 'https://fortee.jp/flutterkaigi-2025/proposal',
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
  news: _news,
  timeline: _timelineFromBff,
);

const _news = [
  (
    title: 'FlutterKaigi 2025 交流企画のご紹介 🎉',
    url:
        'https://medium.com/flutterkaigi/flutterkaigi-2025-交流企画のご紹介-43e957131718',
  ),
  (
    title: 'FlutterKaigi 2025 会場受付のご案内',
    url:
        'https://medium.com/flutterkaigi/flutterkaigi-2025-会場受付のご案内-b02df49db95a',
  ),
  (
    title: 'FlutterKaigi 2025 プロモーション・スクリーンについて 📺',
    url:
        'https://medium.com/flutterkaigi/flutterkaigi-2025-プロモーションディスプレイについて-2108b9a6a68d',
  ),
  (
    title: 'FlutterKaigi 2025 企画紹介 🎉',
    url: 'https://medium.com/flutterkaigi/flutterkaigi-2025-企画紹介-28eeb1c7c585',
  ),
  (
    title: 'FlutterKaigi 2025 スカラシップ制度のお知らせ',
    url:
        'https://medium.com/flutterkaigi/flutterkaigi-2025-スカラシップ制度のお知らせ-672a6321bad8',
  ),
  (
    title: 'FlutterKaigi 2025 ハンズオンへの参加登録のご案内',
    url:
        'https://medium.com/flutterkaigi/flutterkaigi-2025-ハンズオンへの参加登録のご案内-6fe97a67b6eb',
  ),
  (
    title: 'FlutterKaigi 2025 前夜祭について',
    url:
        'https://medium.com/flutterkaigi/flutterkaigi-2025-前夜祭について-625bc597c862',
  ),
  (
    title: 'FlutterKaigi 2025のチケットを9月9日(火)に販売開始します',
    url:
        'https://medium.com/flutterkaigi/flutterkaigi-2025のチケットを9月9日-火-に販売開始します-6b731c434d48',
  ),
  (
    title: 'FlutterKaigi 2025 当日ボランティアスタッフ募集',
    url:
        'https://medium.com/flutterkaigi/flutterkaigi-2025-当日ボランティアスタッフ募集-02f97b5996a3',
  ),
];

extension PlaceExtension on Place {
  String get id => switch (this) {
    Place.hallA => 'hall-a',
    Place.hallB => 'hall-b',
    Place.roomA => 'room-a',
    Place.roomB => 'room-b',
  };
}

typedef SpeakerEntry = ({
  String name,
  String? avatarUrl,
  String? xId,
});

typedef TimelineEntry = ({
  Content title,
  String? url,
  String venueId,
  String venueName,
  String? description,
  bool satellite,
  Duration start,
  Duration time,
  List<SpeakerEntry> speakers,
});

/// BFF APIから取得したセッション情報を使用したタイムライン
final _timelineFromBff = [
  ...convertTimelineEventsToEntries(timelineEvents),
  ...convertSessionsToTimelineEntries(venuesWithSessions),
];

typedef SponsorInfo = ({
  String name,
  String slug,
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
  community,
  tool,
  other,
}

extension SponsorTypeExtension on SponsorType {
  String get name => switch (this) {
    SponsorType.platinum => 'Platinum',
    SponsorType.gold => 'Gold',
    SponsorType.silver => 'Silver',
    SponsorType.bronze => 'Bronze',
    SponsorType.community => 'Community',
    SponsorType.tool => 'Tool',
    SponsorType.other => 'Sponsor',
  };
}

/// BasicPlanTypeをSponsorTypeに変換する拡張メソッド
extension BasicPlanTypeToSponsorType on BasicPlanType {
  SponsorType toSponsorType() => switch (this) {
    BasicPlanType.platinum => SponsorType.platinum,
    BasicPlanType.gold => SponsorType.gold,
    BasicPlanType.silver => SponsorType.silver,
    BasicPlanType.bronze => SponsorType.bronze,
  };
}

/// CompanySponsorTypeをSponsorTypeに変換する拡張メソッド
extension CompanySponsorTypeToSponsorType on CompanySponsorType {
  SponsorType toSponsorType(BasicPlanType? basicPlanType) => switch (this) {
    CompanySponsorType.basic =>
      basicPlanType?.toSponsorType() ?? SponsorType.bronze,
    CompanySponsorType.community => SponsorType.community,
    CompanySponsorType.tool => SponsorType.tool,
    CompanySponsorType.none => SponsorType.other,
  };
}

/// CompanySponsorDetailをSponsorInfoに変換する
SponsorInfo _convertToSponsorInfo(CompanySponsorDetail detail) {
  return (
    name: detail.name,
    slug: detail.slug,
    url: detail.websiteUrl,
    sns: (x: detail.xAccount),
    pr: (ja: detail.prText, en: null),
    logo: detail.logoUrl,
    type: detail.sponsorType.toSponsorType(detail.basicPlanType),
    disable: false,
  );
}

/// API経由で取得した企業スポンサー情報をSponsorInfoに変換
final _sponsors = companySponsors
    .map<SponsorInfo>(_convertToSponsorInfo)
    .toList();

/// StaffMemberWithSnsLinksをStaffInfoに変換する
StaffInfo _convertToStaffInfo(StaffMemberWithSnsLinks member) {
  // SNSリンクを型ごとにマップに変換
  final snsMap = <SnsType, String>{};
  for (final link in member.snsLinks) {
    snsMap[link.type] = link.value;
  }

  return (
    name: member.name,
    avatar: member.iconUrl,
    comment: member.greeting ?? '',
    sns: (
      x: snsMap[SnsType.x],
      bluesky: null, // BFFにはまだblueskyがない
      mixi2: null, // BFFにはまだmixi2がない
      medium: snsMap[SnsType.medium],
      qiita: snsMap[SnsType.qiita],
      zenn: snsMap[SnsType.zenn],
      note: snsMap[SnsType.note],
      website: snsMap[SnsType.other],
    ),
  );
}

/// API経由で取得したスタッフメンバー情報をStaffInfoに変換
final _staff = staffMembers.map<StaffInfo>(_convertToStaffInfo).toList();

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
