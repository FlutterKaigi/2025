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
