// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'FlutterKaigi 2025 Dashboard';

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
  String get sponsorDescription => '会社概要';

  @override
  String get sponsorEnthusiasm => '意気込み';

  @override
  String get sponsorWebsite => 'ウェブサイト';

  @override
  String get sponsorWebsiteNotSet => '設定されていません';

  @override
  String get sponsorEditButtonLabel => 'スポンサー情報を編集する';

  @override
  String get sponsorEditScreenTitle => 'スポンサー編集';

  @override
  String get sponsorEditSaveButtonLabel => '保存する';

  @override
  String get sponsorName => 'スポンサー名';

  @override
  String get accountProfileEdit => 'プロフィールを編集する';

  @override
  String get accountInvitationCodeInput => '招待コードを入力する';

  @override
  String get accountInvitationCodeApplied => '招待コードが適用されました';

  @override
  String get accountInvitationCodeApplyFailed => '招待コードの適用に失敗しました';

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
  String get accountInvitationDialogTitle => '招待コードを入力';

  @override
  String get accountInvitationCode => '招待コード';

  @override
  String get accountInvitationCodeHint => 'FLUTTER2025';

  @override
  String get accountInvitationCodeValidation => '招待コードを入力してください';

  @override
  String get accountCancel => 'キャンセル';

  @override
  String get accountApply => '適用';
}
