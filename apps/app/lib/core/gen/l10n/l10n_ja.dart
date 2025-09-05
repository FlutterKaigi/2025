// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'FlutterKaigi 2025';

  @override
  String get newsTileTitle => '最新のお知らせ';

  @override
  String get newsTileSubtitle => '最新のお知らせをご確認ください';

  @override
  String get newsScreenTitle => 'お知らせ';

  @override
  String get newsEmptyMessage => '現在、新しいお知らせはありません。';

  @override
  String get eventDescription =>
      '2025年、日本国内で Flutter をメインに扱う技術カンファレンス。Flutter や Dart の深い知見を持つ開発者によるセッションを多数企画します。';

  @override
  String get eventDate => '2025年11月13日(金)';

  @override
  String get eventTime => '10:00 ~ 18:00';

  @override
  String get eventVenue => '大手町プレイス ホール＆カンファレンス';

  @override
  String get eventAddress => '東京都千代田区大手町二丁目3番1号';

  @override
  String get sponsorPrText => 'PR 文章';

  @override
  String get sponsorEnthusiasm => '意気込み';

  @override
  String get sponsorWebsite => 'ウェブサイト';

  @override
  String get sponsorWebsiteNotSet => '設定されていません';

  @override
  String get sponsorXAccount => 'X アカウント';

  @override
  String get sponsorXAccountNotSet => '設定されていません';

  @override
  String get sponsorName => 'スポンサー名';

  @override
  String get accountProfileEdit => 'プロフィールを編集する';

  @override
  String get accountOthers => 'Others';

  @override
  String get accountCodeOfConduct => '行動規範';

  @override
  String get accountCodeOfConductUrl =>
      'https://docs.flutterkaigi.jp/Code-of-Conduct.ja';

  @override
  String get accountPrivacyPolicy => 'プライバシーポリシー';

  @override
  String get accountPrivacyPolicyUrl =>
      'https://docs.flutterkaigi.jp/Privacy-Policy.ja';

  @override
  String get accountContact => 'お問い合わせ';

  @override
  String get accountContactUrl =>
      'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';

  @override
  String get accountOssLicenses => 'OSS Licenses';

  @override
  String get guestSignInButton => 'ゲストで利用する';

  @override
  String get guestUserLabel => 'ゲストでログイン中';

  @override
  String get authErrorIdentityAlreadyExists =>
      'このGoogleアカウントは既に別のユーザーと紐づけられています。ログアウトしてから再度ログインしてください。';

  @override
  String get accountLogout => 'ログアウト';
}
