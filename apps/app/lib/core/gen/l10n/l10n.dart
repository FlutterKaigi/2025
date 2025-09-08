import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ja')];

  /// No description provided for @appName.
  ///
  /// In ja, this message translates to:
  /// **'FlutterKaigi 2025'**
  String get appName;

  /// No description provided for @newsTileTitle.
  ///
  /// In ja, this message translates to:
  /// **'最新のお知らせ'**
  String get newsTileTitle;

  /// No description provided for @newsTileSubtitle.
  ///
  /// In ja, this message translates to:
  /// **'最新のお知らせをご確認ください'**
  String get newsTileSubtitle;

  /// No description provided for @newsScreenTitle.
  ///
  /// In ja, this message translates to:
  /// **'お知らせ'**
  String get newsScreenTitle;

  /// No description provided for @newsEmptyMessage.
  ///
  /// In ja, this message translates to:
  /// **'現在、新しいお知らせはありません。'**
  String get newsEmptyMessage;

  /// No description provided for @eventDescription.
  ///
  /// In ja, this message translates to:
  /// **'2025年、日本国内で Flutter をメインに扱う技術カンファレンス。Flutter や Dart の深い知見を持つ開発者によるセッションを多数企画します。'**
  String get eventDescription;

  /// No description provided for @eventDate.
  ///
  /// In ja, this message translates to:
  /// **'2025年11月13日(金)'**
  String get eventDate;

  /// No description provided for @eventTime.
  ///
  /// In ja, this message translates to:
  /// **'10:00 ~ 18:00'**
  String get eventTime;

  /// No description provided for @eventVenue.
  ///
  /// In ja, this message translates to:
  /// **'大手町プレイス ホール＆カンファレンス'**
  String get eventVenue;

  /// No description provided for @eventAddress.
  ///
  /// In ja, this message translates to:
  /// **'東京都千代田区大手町二丁目3番1号'**
  String get eventAddress;

  /// No description provided for @sponsorPrText.
  ///
  /// In ja, this message translates to:
  /// **'PR 文章'**
  String get sponsorPrText;

  /// No description provided for @sponsorEnthusiasm.
  ///
  /// In ja, this message translates to:
  /// **'意気込み'**
  String get sponsorEnthusiasm;

  /// No description provided for @sponsorWebsite.
  ///
  /// In ja, this message translates to:
  /// **'ウェブサイト'**
  String get sponsorWebsite;

  /// No description provided for @sponsorWebsiteNotSet.
  ///
  /// In ja, this message translates to:
  /// **'設定されていません'**
  String get sponsorWebsiteNotSet;

  /// No description provided for @sponsorXAccount.
  ///
  /// In ja, this message translates to:
  /// **'X アカウント'**
  String get sponsorXAccount;

  /// No description provided for @sponsorXAccountNotSet.
  ///
  /// In ja, this message translates to:
  /// **'設定されていません'**
  String get sponsorXAccountNotSet;

  /// No description provided for @sponsorName.
  ///
  /// In ja, this message translates to:
  /// **'スポンサー名'**
  String get sponsorName;

  /// No description provided for @accountProfileEdit.
  ///
  /// In ja, this message translates to:
  /// **'プロフィールを編集する'**
  String get accountProfileEdit;

  /// No description provided for @accountOthers.
  ///
  /// In ja, this message translates to:
  /// **'Others'**
  String get accountOthers;

  /// No description provided for @accountCodeOfConduct.
  ///
  /// In ja, this message translates to:
  /// **'行動規範'**
  String get accountCodeOfConduct;

  /// No description provided for @accountCodeOfConductUrl.
  ///
  /// In ja, this message translates to:
  /// **'https://docs.flutterkaigi.jp/Code-of-Conduct.ja'**
  String get accountCodeOfConductUrl;

  /// No description provided for @accountPrivacyPolicy.
  ///
  /// In ja, this message translates to:
  /// **'プライバシーポリシー'**
  String get accountPrivacyPolicy;

  /// No description provided for @accountPrivacyPolicyUrl.
  ///
  /// In ja, this message translates to:
  /// **'https://docs.flutterkaigi.jp/Privacy-Policy.ja'**
  String get accountPrivacyPolicyUrl;

  /// No description provided for @accountContact.
  ///
  /// In ja, this message translates to:
  /// **'お問い合わせ'**
  String get accountContact;

  /// No description provided for @accountContactUrl.
  ///
  /// In ja, this message translates to:
  /// **'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform'**
  String get accountContactUrl;

  /// No description provided for @accountOssLicenses.
  ///
  /// In ja, this message translates to:
  /// **'OSS Licenses'**
  String get accountOssLicenses;

  /// No description provided for @guestSignInButton.
  ///
  /// In ja, this message translates to:
  /// **'ゲストで利用する'**
  String get guestSignInButton;

  /// No description provided for @guestUserLabel.
  ///
  /// In ja, this message translates to:
  /// **'ゲストでログイン中'**
  String get guestUserLabel;

  /// No description provided for @authErrorIdentityAlreadyExists.
  ///
  /// In ja, this message translates to:
  /// **'このGoogleアカウントは既に別のユーザーと紐づけられています。ログアウトしてから再度ログインしてください。'**
  String get authErrorIdentityAlreadyExists;

  /// No description provided for @accountLogout.
  ///
  /// In ja, this message translates to:
  /// **'ログアウト'**
  String get accountLogout;

  /// No description provided for @notFoundTitle.
  ///
  /// In ja, this message translates to:
  /// **'ページが見つかりません'**
  String get notFoundTitle;

  /// No description provided for @notFoundMessage.
  ///
  /// In ja, this message translates to:
  /// **'お探しのページは存在しないか、\n移動された可能性があります。'**
  String get notFoundMessage;

  /// No description provided for @notFoundBackToTop.
  ///
  /// In ja, this message translates to:
  /// **'トップに戻る'**
  String get notFoundBackToTop;

  /// No description provided for @errorTitle.
  ///
  /// In ja, this message translates to:
  /// **'サーバー側で問題が発生したようです。'**
  String get errorTitle;

  /// No description provided for @errorMessage.
  ///
  /// In ja, this message translates to:
  /// **'FlutterKaigi スタッフへお問い合わせください。'**
  String get errorMessage;

  /// No description provided for @errorRetry.
  ///
  /// In ja, this message translates to:
  /// **'リトライ'**
  String get errorRetry;

  /// No description provided for @widgetBuildErrorTitle.
  ///
  /// In ja, this message translates to:
  /// **'予期しないエラーが発生しました'**
  String get widgetBuildErrorTitle;

  /// No description provided for @widgetBuildErrorMessage.
  ///
  /// In ja, this message translates to:
  /// **'申し訳ございません。UI 構築中に予期しないエラーが発生しました。\n\nこの問題を解決するため、GitHub の Issue を作成していただけると大変助かります。'**
  String get widgetBuildErrorMessage;

  /// No description provided for @widgetBuildErrorGitHubButton.
  ///
  /// In ja, this message translates to:
  /// **'GitHub の Issue ページを開く'**
  String get widgetBuildErrorGitHubButton;

  /// No description provided for @ticketNoticeTitle.
  ///
  /// In ja, this message translates to:
  /// **'ご注意'**
  String get ticketNoticeTitle;

  /// No description provided for @ticketNoticeMessage.
  ///
  /// In ja, this message translates to:
  /// **'「個人スポンサーチケット」のみでは、FlutterKaigi 2025本編（カンファレンス会場）へのご入場はできません。\n入場をご希望の方は、アーリーチケット（9月末まで販売予定）またはノーマルチケットを別途ご購入ください。\nなお、「個人スポンサーチケット」は、入場を目的とせず FlutterKaigi を応援したい方のご支援も大歓迎です！\n\n前夜祭への参加は「アーリーチケット」のみが対象です。\nノーマルチケットでは前夜祭に参加できませんのでご注意ください。'**
  String get ticketNoticeMessage;

  /// No description provided for @studentRefundTitle.
  ///
  /// In ja, this message translates to:
  /// **'学生向け返金・費用補助について'**
  String get studentRefundTitle;

  /// No description provided for @studentRefundDescription.
  ///
  /// In ja, this message translates to:
  /// **'FlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に返金・費用補助を実施いたします。'**
  String get studentRefundDescription;

  /// No description provided for @studentRefundDetailsButton.
  ///
  /// In ja, this message translates to:
  /// **'詳細を見る'**
  String get studentRefundDetailsButton;

  /// No description provided for @studentRefundDialogContent.
  ///
  /// In ja, this message translates to:
  /// **'🎓 学生向け返金・費用補助について\nFlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に、以下の返金・費用補助を実施いたします。\n\n✅ 対象となる費用\n- チケット代金\n- 交通費（上限あり）\n- 宿泊費（上限あり）\n\n🧑‍🎓 対象となる「学生」の定義\n以下のいずれかに該当し、在学を証明できる方が対象です：\n- 日本国内外の教育機関（小学校・中学校・高等学校・高等専門学校・専門学校・大学・大学院など）に在籍中の方\n- 年齢や就業状況を問わず、学生証または在学証明書を提示できる方\n\n🎟 対象条件\n- FlutterKaigi 2025に実際に参加された方\n- 実際に学生支援スポンサーとの交流企画へ参加された方\n- 前当日の受付にて、有効な学生証や在学証明書をご提示いただいた方\n\n参加記録は運営側で確認いたします。事前申請は不要です。\n\n📩 返金手続きについて\nイベント終了後、対象の方へメールにて返金手続きの詳細をご案内いたします。\n\nその際、以下の情報をご提出いただきます：\n- チケット購入時の情報\n- 交通費・宿泊費の領収書または証明書類\n- 振込先の口座情報\n\n※ 学生証の写しなどの追加提出は不要です（当日提示済みの場合）\n※ 上限金額や詳細条件については、ご案内メールにて個別にご説明します。\n※ ご提出いただいた内容を確認のうえ、順次返金いたします。\n\n📌 ご提出いただく情報には個人情報が含まれます。返金・費用補助の確認および手続きの目的に限り使用し、手続き完了後は速やかに破棄いたします。お申し込みいただくにあたり、これらの取り扱いにご同意いただく必要がありますので、あらかじめご了承ください。\n\n📬 ご不明点がある場合は：staff@flutterkaigi.jp'**
  String get studentRefundDialogContent;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ja':
      return L10nJa();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
