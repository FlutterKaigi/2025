///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'i18n.g.dart';

// Path: <root>
typedef TranslationsJa = Translations; // ignore: unused_element

class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(
         overrides == null,
         'Set "translation_overrides: true" in order to enable this feature.',
       ),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ja,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ja>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({
    TranslationMetadata<AppLocale, Translations>? meta,
  }) => Translations(meta: meta ?? this.$meta);

  // Translations
  late final TranslationsAccountJa account = TranslationsAccountJa.internal(
    _root,
  );
  late final TranslationsAuthJa auth = TranslationsAuthJa.internal(_root);
  late final TranslationsCommonJa common = TranslationsCommonJa.internal(_root);
  late final TranslationsEventJa event = TranslationsEventJa.internal(_root);
  late final TranslationsLicenseJa license = TranslationsLicenseJa.internal(
    _root,
  );
  late final TranslationsNewsJa news = TranslationsNewsJa.internal(_root);
  late final TranslationsSessionJa session = TranslationsSessionJa.internal(
    _root,
  );
  late final TranslationsSponsorJa sponsor = TranslationsSponsorJa.internal(
    _root,
  );
  late final TranslationsTicketJa ticket = TranslationsTicketJa.internal(_root);
  late final TranslationsVenueJa venue = TranslationsVenueJa.internal(_root);
}

// Path: account
class TranslationsAccountJa {
  TranslationsAccountJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'プロフィールを編集する'
  String get profileEdit => 'プロフィールを編集する';

  /// ja: 'ゲストでログイン中'
  String get guestUserLabel => 'ゲストでログイン中';

  /// ja: 'Contributors'
  String get contributors => 'Contributors';

  late final TranslationsAccountStaffMembersJa staffMembers =
      TranslationsAccountStaffMembersJa.internal(_root);

  /// ja: 'Others'
  String get others => 'Others';

  /// ja: '行動規範'
  String get codeOfConduct => '行動規範';

  /// ja: 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja'
  String get codeOfConductUrl =>
      'https://docs.flutterkaigi.jp/Code-of-Conduct.ja';

  /// ja: 'プライバシーポリシー'
  String get privacyPolicy => 'プライバシーポリシー';

  /// ja: 'https://docs.flutterkaigi.jp/Privacy-Policy.ja'
  String get privacyPolicyUrl =>
      'https://docs.flutterkaigi.jp/Privacy-Policy.ja';

  /// ja: 'お問い合わせ'
  String get contact => 'お問い合わせ';

  /// ja: 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform'
  String get contactUrl =>
      'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';

  /// ja: 'OSS Licenses'
  String get ossLicenses => 'OSS Licenses';

  /// ja: '退会申請'
  String get withdrawal => '退会申請';

  /// ja: 'ログアウト'
  String get logout => 'ログアウト';

  /// ja: 'アカウント設定'
  String get settings => 'アカウント設定';

  /// ja: 'ソースコードを見る'
  String get sourceCode => 'ソースコードを見る';

  late final TranslationsAccountLoginRequiredJa loginRequired =
      TranslationsAccountLoginRequiredJa.internal(_root);
  late final TranslationsAccountProfileJa profile =
      TranslationsAccountProfileJa.internal(_root);
  late final TranslationsAccountProfileshareJa profileshare =
      TranslationsAccountProfileshareJa.internal(_root);
  late final TranslationsAccountAdminJa admin =
      TranslationsAccountAdminJa.internal(_root);
}

// Path: auth
class TranslationsAuthJa {
  TranslationsAuthJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsAuthGuestJa guest = TranslationsAuthGuestJa.internal(
    _root,
  );
  late final TranslationsAuthErrorJa error = TranslationsAuthErrorJa.internal(
    _root,
  );

  /// ja: 'ログインが必要です'
  String get loginRequired => 'ログインが必要です';
}

// Path: common
class TranslationsCommonJa {
  TranslationsCommonJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsCommonAppJa app = TranslationsCommonAppJa.internal(
    _root,
  );
  late final TranslationsCommonForceUpdateJa forceUpdate =
      TranslationsCommonForceUpdateJa.internal(_root);
  late final TranslationsCommonActionJa action =
      TranslationsCommonActionJa.internal(_root);
  late final TranslationsCommonErrorJa error =
      TranslationsCommonErrorJa.internal(_root);
  late final TranslationsCommonNavigationJa navigation =
      TranslationsCommonNavigationJa.internal(_root);
  late final TranslationsCommonDebugJa debug =
      TranslationsCommonDebugJa.internal(_root);
}

// Path: event
class TranslationsEventJa {
  TranslationsEventJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '2025年、日本国内で Flutter をメインに扱う技術カンファレンス。Flutter や Dart の深い知見を持つ開発者によるセッションを多数企画します。'
  String get description =>
      '2025年、日本国内で Flutter をメインに扱う技術カンファレンス。Flutter や Dart の深い知見を持つ開発者によるセッションを多数企画します。';

  /// ja: '2025年11月13日(木)'
  String get date => '2025年11月13日(木)';

  /// ja: '10:00 ~ 18:00'
  String get time => '10:00 ~ 18:00';

  /// ja: '大手町プレイス ホール＆カンファレンス'
  String get venue => '大手町プレイス ホール＆カンファレンス';

  /// ja: '東京都千代田区大手町二丁目3番1号'
  String get address => '東京都千代田区大手町二丁目3番1号';

  late final TranslationsEventSurveyJa survey =
      TranslationsEventSurveyJa.internal(_root);

  /// ja: 'Contributors'
  String get contributors => 'Contributors';

  late final TranslationsEventStaffMembersJa staffMembers =
      TranslationsEventStaffMembersJa.internal(_root);

  /// ja: 'Others'
  String get others => 'Others';

  /// ja: '行動規範'
  String get codeOfConduct => '行動規範';

  /// ja: 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja'
  String get codeOfConductUrl =>
      'https://docs.flutterkaigi.jp/Code-of-Conduct.ja';

  /// ja: 'プライバシーポリシー'
  String get privacyPolicy => 'プライバシーポリシー';

  /// ja: 'https://docs.flutterkaigi.jp/Privacy-Policy.ja'
  String get privacyPolicyUrl =>
      'https://docs.flutterkaigi.jp/Privacy-Policy.ja';

  /// ja: 'お問い合わせ'
  String get contact => 'お問い合わせ';

  /// ja: 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform'
  String get contactUrl =>
      'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';

  /// ja: 'OSS Licenses'
  String get ossLicenses => 'OSS Licenses';

  /// ja: 'ソースコードを見る'
  String get sourceCode => 'ソースコードを見る';
}

// Path: license
class TranslationsLicenseJa {
  TranslationsLicenseJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'ライセンス'
  String get title => 'ライセンス';

  late final TranslationsLicenseSearchJa search =
      TranslationsLicenseSearchJa.internal(_root);
  late final TranslationsLicenseListTileJa listTile =
      TranslationsLicenseListTileJa.internal(_root);
}

// Path: news
class TranslationsNewsJa {
  TranslationsNewsJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsNewsTileJa tile = TranslationsNewsTileJa.internal(
    _root,
  );
  late final TranslationsNewsScreenJa screen =
      TranslationsNewsScreenJa.internal(_root);
  late final TranslationsNewsEmptyJa empty = TranslationsNewsEmptyJa.internal(
    _root,
  );
}

// Path: session
class TranslationsSessionJa {
  TranslationsSessionJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'タイムテーブル'
  String get title => 'タイムテーブル';

  late final TranslationsSessionDetailJa detail =
      TranslationsSessionDetailJa.internal(_root);
  late final TranslationsSessionBookmarkedJa bookmarked =
      TranslationsSessionBookmarkedJa.internal(_root);
  late final TranslationsSessionEmptyJa empty =
      TranslationsSessionEmptyJa.internal(_root);
  late final TranslationsSessionFeedbackJa feedback =
      TranslationsSessionFeedbackJa.internal(_root);
  late final TranslationsSessionSurveyJa survey =
      TranslationsSessionSurveyJa.internal(_root);
  late final TranslationsSessionNotificationJa notification =
      TranslationsSessionNotificationJa.internal(_root);
}

// Path: sponsor
class TranslationsSponsorJa {
  TranslationsSponsorJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'PR 文章'
  String get prText => 'PR 文章';

  /// ja: '意気込み'
  String get enthusiasm => '意気込み';

  /// ja: '企業スポンサー'
  String get company => '企業スポンサー';

  /// ja: '個人スポンサー'
  String get individual => '個人スポンサー';

  /// ja: 'ウェブサイト'
  String get website => 'ウェブサイト';

  /// ja: '設定されていません'
  String get websiteNotSet => '設定されていません';

  /// ja: 'X アカウント'
  String get xAccount => 'X アカウント';

  /// ja: '設定されていません'
  String get xAccountNotSet => '設定されていません';

  /// ja: 'スポンサー名'
  String get name => 'スポンサー名';
}

// Path: ticket
class TranslationsTicketJa {
  TranslationsTicketJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsTicketStatusJa status =
      TranslationsTicketStatusJa.internal(_root);

  /// ja: 'オプション:'
  String get options => 'オプション:';

  /// ja: '購入日時'
  String get purchaseDate => '購入日時';

  /// ja: '期限'
  String get expiryDate => '期限';

  /// ja: '現在、購入可能なチケットはありません'
  String get noAvailableTickets => '現在、購入可能なチケットはありません';

  /// ja: 'チケット一覧'
  String get list => 'チケット一覧';

  late final TranslationsTicketLoginRequiredJa loginRequired =
      TranslationsTicketLoginRequiredJa.internal(_root);
  late final TranslationsTicketNoticeJa notice =
      TranslationsTicketNoticeJa.internal(_root);
  late final TranslationsTicketStudentRefundJa studentRefund =
      TranslationsTicketStudentRefundJa.internal(_root);
  late final TranslationsTicketPurchaseJa purchase =
      TranslationsTicketPurchaseJa.internal(_root);
  late final TranslationsTicketQrJa qr = TranslationsTicketQrJa.internal(_root);
  late final TranslationsTicketEntryTicketJa entryTicket =
      TranslationsTicketEntryTicketJa.internal(_root);
  late final TranslationsTicketNotificationJa notification =
      TranslationsTicketNotificationJa.internal(_root);
}

// Path: venue
class TranslationsVenueJa {
  TranslationsVenueJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '会場マップ'
  String get title => '会場マップ';

  /// ja: '1F'
  String get floor1f => '1F';

  /// ja: '2F'
  String get floor2f => '2F';
}

// Path: account.staffMembers
class TranslationsAccountStaffMembersJa {
  TranslationsAccountStaffMembersJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'スタッフ'
  String get title => 'スタッフ';

  /// ja: 'スタッフが見つかりませんでした'
  String get emptyMessage => 'スタッフが見つかりませんでした';
}

// Path: account.loginRequired
class TranslationsAccountLoginRequiredJa {
  TranslationsAccountLoginRequiredJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'ログインが必要です'
  String get title => 'ログインが必要です';

  /// ja: 'この機能を利用するには、ログインが必要です'
  String get description => 'この機能を利用するには、ログインが必要です';

  /// ja: 'ログイン'
  String get button => 'ログイン';
}

// Path: account.profile
class TranslationsAccountProfileJa {
  TranslationsAccountProfileJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'プロフィール'
  String get title => 'プロフィール';

  /// ja: 'プロフィール編集'
  String get editTitle => 'プロフィール編集';

  /// ja: 'プロフィール情報を作成してください'
  String get createInfo => 'プロフィール情報を作成してください';

  /// ja: 'プロフィールを編集'
  String get edit => 'プロフィールを編集';

  /// ja: 'プロフィールが見つかりません'
  String get notFound => 'プロフィールが見つかりません';

  /// ja: '保存中...'
  String get saving => '保存中...';

  /// ja: '保存'
  String get save => '保存';

  /// ja: 'プロフィールを保存しました'
  String get saveSuccess => 'プロフィールを保存しました';

  /// ja: '保存に失敗しました'
  String get saveFailed => '保存に失敗しました';

  /// ja: 'エラーが発生しました'
  String get errorOccurred => 'エラーが発生しました';

  /// ja: '20歳以上です'
  String get ageOver20 => '20歳以上です';

  /// ja: '20歳未満'
  String get ageUnder20 => '20歳未満';

  /// ja: '名前 *'
  String get nameLabel => '名前 *';

  /// ja: '名前を入力してください'
  String get nameRequired => '名前を入力してください';

  /// ja: '名前は20文字以内で入力してください'
  String get nameTooLong => '名前は20文字以内で入力してください';

  /// ja: 'アップロード'
  String get upload => 'アップロード';

  /// ja: '削除'
  String get delete => '削除';

  /// ja: 'SNSリンク'
  String get snsLinks => 'SNSリンク';

  /// ja: '追加'
  String get add => '追加';

  late final TranslationsAccountProfileAvatarJa avatar =
      TranslationsAccountProfileAvatarJa.internal(_root);
  late final TranslationsAccountProfileSnsJa sns =
      TranslationsAccountProfileSnsJa.internal(_root);
  late final TranslationsAccountProfileImageJa image =
      TranslationsAccountProfileImageJa.internal(_root);
  late final TranslationsAccountProfileRequiredSheetJa requiredSheet =
      TranslationsAccountProfileRequiredSheetJa.internal(_root);
}

// Path: account.profileshare
class TranslationsAccountProfileshareJa {
  TranslationsAccountProfileshareJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'プロフィール交換'
  String get title => 'プロフィール交換';

  /// ja: 'QRコード表示'
  String get qrCode => 'QRコード表示';

  /// ja: 'QRコード読み取り'
  String get qrCodeScan => 'QRコード読み取り';

  /// ja: '交換履歴'
  String get friendsList => '交換履歴';

  late final TranslationsAccountProfileshareQrCodeDisplayJa qrCodeDisplay =
      TranslationsAccountProfileshareQrCodeDisplayJa.internal(_root);
  late final TranslationsAccountProfileshareQrCodeScanScreenJa
  qrCodeScanScreen = TranslationsAccountProfileshareQrCodeScanScreenJa.internal(
    _root,
  );
  late final TranslationsAccountProfileshareFriendsListScreenJa
  friendsListScreen =
      TranslationsAccountProfileshareFriendsListScreenJa.internal(_root);
  late final TranslationsAccountProfileshareNotificationJa notification =
      TranslationsAccountProfileshareNotificationJa.internal(_root);
}

// Path: account.admin
class TranslationsAccountAdminJa {
  TranslationsAccountAdminJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '管理者ページ'
  String get title => '管理者ページ';

  /// ja: '管理者ページ'
  String get button => '管理者ページ';

  /// ja: 'ユーザ一覧'
  String get userList => 'ユーザ一覧';
}

// Path: auth.guest
class TranslationsAuthGuestJa {
  TranslationsAuthGuestJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'ゲストで利用する'
  String get signInButton => 'ゲストで利用する';

  /// ja: 'ゲストでログイン中'
  String get userLabel => 'ゲストでログイン中';
}

// Path: auth.error
class TranslationsAuthErrorJa {
  TranslationsAuthErrorJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'このGoogleアカウントは既に別のユーザーと紐づけられています。ログアウトしてから再度ログインしてください。'
  String get identityAlreadyExists =>
      'このGoogleアカウントは既に別のユーザーと紐づけられています。ログアウトしてから再度ログインしてください。';

  /// ja: 'Googleアカウントへの再ログインが必要です。'
  String get sessionExpired => 'Googleアカウントへの再ログインが必要です。';
}

// Path: common.app
class TranslationsCommonAppJa {
  TranslationsCommonAppJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'FlutterKaigi 2025'
  String get name => 'FlutterKaigi 2025';
}

// Path: common.forceUpdate
class TranslationsCommonForceUpdateJa {
  TranslationsCommonForceUpdateJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'アップデートが必要です'
  String get title => 'アップデートが必要です';

  /// ja: '新しいバージョンのアプリが利用可能です。最新バージョンにアップデートしてください。'
  String get message => '新しいバージョンのアプリが利用可能です。最新バージョンにアップデートしてください。';

  /// ja: 'アップデート'
  String get updateButton => 'アップデート';
}

// Path: common.action
class TranslationsCommonActionJa {
  TranslationsCommonActionJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'キャンセル'
  String get cancel => 'キャンセル';
}

// Path: common.error
class TranslationsCommonErrorJa {
  TranslationsCommonErrorJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsCommonErrorNotFoundJa notFound =
      TranslationsCommonErrorNotFoundJa.internal(_root);
  late final TranslationsCommonErrorServerJa server =
      TranslationsCommonErrorServerJa.internal(_root);
  late final TranslationsCommonErrorWidgetJa widget =
      TranslationsCommonErrorWidgetJa.internal(_root);
  late final TranslationsCommonErrorGeneralJa general =
      TranslationsCommonErrorGeneralJa.internal(_root);
}

// Path: common.navigation
class TranslationsCommonNavigationJa {
  TranslationsCommonNavigationJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'イベント'
  String get event => 'イベント';

  /// ja: 'スポンサー'
  String get sponsor => 'スポンサー';

  /// ja: 'セッション'
  String get session => 'セッション';

  /// ja: 'チケット'
  String get ticket => 'チケット';

  /// ja: 'アカウント'
  String get account => 'アカウント';
}

// Path: common.debug
class TranslationsCommonDebugJa {
  TranslationsCommonDebugJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'Debug'
  String get title => 'Debug';

  /// ja: 'Talker 画面へ'
  String get talkerScreen => 'Talker 画面へ';

  /// ja: 'パスを入力してください'
  String get pathRequired => 'パスを入力してください';

  /// ja: 'パスは / で始めてください'
  String get pathMustStartWithSlash => 'パスは / で始めてください';

  /// ja: 'パスに「debug」または「login」を含めることはできません'
  String get pathCannotContainDebugOrLogin =>
      'パスに「debug」または「login」を含めることはできません';

  /// ja: '無効なパスです'
  String get invalidPath => '無効なパスです';

  /// ja: 'GO'
  String get go => 'GO';

  late final TranslationsCommonDebugProfileShareJa profileShare =
      TranslationsCommonDebugProfileShareJa.internal(_root);
}

// Path: event.survey
class TranslationsEventSurveyJa {
  TranslationsEventSurveyJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'アンケート協力のお願い'
  String get title => 'アンケート協力のお願い';

  /// ja: '今後のFlutterKaigiをより良いイベントにするため、皆様のご意見をお聞かせください。'
  String get description => '今後のFlutterKaigiをより良いイベントにするため、皆様のご意見をお聞かせください。';

  /// ja: '全体アンケートに回答する'
  String get button => '全体アンケートに回答する';
}

// Path: event.staffMembers
class TranslationsEventStaffMembersJa {
  TranslationsEventStaffMembersJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'スタッフ'
  String get title => 'スタッフ';

  /// ja: 'スタッフが見つかりませんでした'
  String get emptyMessage => 'スタッフが見つかりませんでした';
}

// Path: license.search
class TranslationsLicenseSearchJa {
  TranslationsLicenseSearchJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'パッケージを検索'
  String get hintText => 'パッケージを検索';
}

// Path: license.listTile
class TranslationsLicenseListTileJa {
  TranslationsLicenseListTileJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '(one) {ライセンス: ${n}件} (other) {ライセンス: ${n}件}'
  String description({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        n,
        one: 'ライセンス: ${n}件',
        other: 'ライセンス: ${n}件',
      );
}

// Path: news.tile
class TranslationsNewsTileJa {
  TranslationsNewsTileJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '最新のお知らせ'
  String get title => '最新のお知らせ';

  /// ja: '最新のお知らせをご確認ください'
  String get subtitle => '最新のお知らせをご確認ください';
}

// Path: news.screen
class TranslationsNewsScreenJa {
  TranslationsNewsScreenJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'お知らせ'
  String get title => 'お知らせ';
}

// Path: news.empty
class TranslationsNewsEmptyJa {
  TranslationsNewsEmptyJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '現在、新しいお知らせはありません。'
  String get message => '現在、新しいお知らせはありません。';
}

// Path: session.detail
class TranslationsSessionDetailJa {
  TranslationsSessionDetailJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'ブックマーク'
  String get bookmark => 'ブックマーク';
}

// Path: session.bookmarked
class TranslationsSessionBookmarkedJa {
  TranslationsSessionBookmarkedJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'お気に入りセッション'
  String get title => 'お気に入りセッション';
}

// Path: session.empty
class TranslationsSessionEmptyJa {
  TranslationsSessionEmptyJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '現在、表示可能なセッションがありません。'
  String get message => '現在、表示可能なセッションがありません。';
}

// Path: session.feedback
class TranslationsSessionFeedbackJa {
  TranslationsSessionFeedbackJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'フィードバック'
  String get title => 'フィードバック';

  /// ja: 'フィードバックを送る'
  String get send => 'フィードバックを送る';
}

// Path: session.survey
class TranslationsSessionSurveyJa {
  TranslationsSessionSurveyJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'セッションフィードバックを送る'
  String get button => 'セッションフィードバックを送る';
}

// Path: session.notification
class TranslationsSessionNotificationJa {
  TranslationsSessionNotificationJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'セッションリマインダー'
  String get channel_name => 'セッションリマインダー';

  /// ja: 'お気に入りセッション開始15分前の通知'
  String get channel_description => 'お気に入りセッション開始15分前の通知';

  /// ja: 'セッション開始まであと15分'
  String get title => 'セッション開始まであと15分';

  /// ja: '$title 📍 $venue'
  String body({required Object title, required Object venue}) =>
      '${title}\n📍 ${venue}';
}

// Path: ticket.status
class TranslationsTicketStatusJa {
  TranslationsTicketStatusJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '購入済み'
  String get purchased => '購入済み';

  /// ja: '決済待ち'
  String get pending => '決済待ち';

  /// ja: '返金済み'
  String get refunded => '返金済み';

  /// ja: '入場済み'
  String get entered => '入場済み';
}

// Path: ticket.loginRequired
class TranslationsTicketLoginRequiredJa {
  TranslationsTicketLoginRequiredJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'チケット購入前にGoogleアカウントでログインしてください'
  String get title => 'チケット購入前にGoogleアカウントでログインしてください';

  /// ja: 'チケット購入前にGoogleアカウントとリンクしてください'
  String get linkTitle => 'チケット購入前にGoogleアカウントとリンクしてください';

  /// ja: 'チケットを購入するためには、Googleアカウントでログインしてください'
  String get description => 'チケットを購入するためには、Googleアカウントでログインしてください';

  /// ja: 'Apple Sign Inではチケット購入ができません'
  String get appleSignInTitle => 'Apple Sign Inではチケット購入ができません';

  /// ja: '現在、Apple Sign Inでログインされています。チケットを購入するには、一度ログアウトしてGoogleアカウントでログインし直してください。'
  String get appleSignInDescription =>
      '現在、Apple Sign Inでログインされています。チケットを購入するには、一度ログアウトしてGoogleアカウントでログインし直してください。';
}

// Path: ticket.notice
class TranslationsTicketNoticeJa {
  TranslationsTicketNoticeJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'ご注意'
  String get title => 'ご注意';

  /// ja: '「個人スポンサーチケット」のみでは、FlutterKaigi 2025本編（カンファレンス会場）へのご入場はできません。\n入場をご希望の方は、アーリーチケット（9月末まで販売予定）またはノーマルチケットを別途ご購入ください。\nなお、「個人スポンサーチケット」は、入場を目的とせず FlutterKaigi を応援したい方のご支援も大歓迎です！\n\n前夜祭への参加は「アーリーチケット」のみが対象です。\nノーマルチケットでは前夜祭に参加できませんのでご注意ください。'
  String get message =>
      '「個人スポンサーチケット」のみでは、FlutterKaigi 2025本編（カンファレンス会場）へのご入場はできません。\n入場をご希望の方は、アーリーチケット（9月末まで販売予定）またはノーマルチケットを別途ご購入ください。\nなお、「個人スポンサーチケット」は、入場を目的とせず FlutterKaigi を応援したい方のご支援も大歓迎です！\n\n前夜祭への参加は「アーリーチケット」のみが対象です。\nノーマルチケットでは前夜祭に参加できませんのでご注意ください。';
}

// Path: ticket.studentRefund
class TranslationsTicketStudentRefundJa {
  TranslationsTicketStudentRefundJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '学生向け返金・費用補助について'
  String get title => '学生向け返金・費用補助について';

  /// ja: 'FlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に返金・費用補助を実施いたします。'
  String get description =>
      'FlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に返金・費用補助を実施いたします。';

  /// ja: '詳細を見る'
  String get detailsButton => '詳細を見る';

  /// ja: '🎓 学生向け返金・費用補助について\nFlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に、以下の返金・費用補助を実施いたします。\n\n✅ 対象となる費用\n- チケット代金\n- 交通費（上限あり）\n- 宿泊費（上限あり）\n\n🧑‍🎓 対象となる「学生」の定義\n以下のいずれかに該当し、在学を証明できる方が対象です：\n- 日本国内外の教育機関（小学校・中学校・高等学校・高等専門学校・専門学校・大学・大学院など）に在籍中の方\n- 年齢や就業状況を問わず、学生証または在学証明書を提示できる方\n\n🎟 対象条件\n- FlutterKaigi 2025に実際に参加された方\n- 実際に学生支援スポンサーとの交流企画へ参加された方\n- 前当日の受付にて、有効な学生証や在学証明書をご提示いただいた方\n\n参加記録は運営側で確認いたします。事前申請は不要です。\n\n📩 返金手続きについて\nイベント終了後、対象の方へメールにて返金手続きの詳細をご案内いたします。\n\nその際、以下の情報をご提出いただきます：\n- チケット購入時の情報\n- 交通費・宿泊費の領収書または証明書類\n- 振込先の口座情報\n\n※ 学生証の写しなどの追加提出は不要です（当日提示済みの場合）\n※ 上限金額や詳細条件については、ご案内メールにて個別にご説明します。\n※ ご提出いただいた内容を確認のうえ、順次返金いたします。\n\n📌 ご提出いただく情報には個人情報が含まれます。返金・費用補助の確認および手続きの目的に限り使用し、手続き完了後は速やかに破棄いたします。お申し込みいただくにあたり、これらの取り扱いにご同意いただく必要がありますので、あらかじめご了承ください。\n\n📬 ご不明点がある場合は：staff@flutterkaigi.jp'
  String get dialogContent =>
      '🎓 学生向け返金・費用補助について\nFlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に、以下の返金・費用補助を実施いたします。\n\n✅ 対象となる費用\n- チケット代金\n- 交通費（上限あり）\n- 宿泊費（上限あり）\n\n🧑‍🎓 対象となる「学生」の定義\n以下のいずれかに該当し、在学を証明できる方が対象です：\n- 日本国内外の教育機関（小学校・中学校・高等学校・高等専門学校・専門学校・大学・大学院など）に在籍中の方\n- 年齢や就業状況を問わず、学生証または在学証明書を提示できる方\n\n🎟 対象条件\n- FlutterKaigi 2025に実際に参加された方\n- 実際に学生支援スポンサーとの交流企画へ参加された方\n- 前当日の受付にて、有効な学生証や在学証明書をご提示いただいた方\n\n参加記録は運営側で確認いたします。事前申請は不要です。\n\n📩 返金手続きについて\nイベント終了後、対象の方へメールにて返金手続きの詳細をご案内いたします。\n\nその際、以下の情報をご提出いただきます：\n- チケット購入時の情報\n- 交通費・宿泊費の領収書または証明書類\n- 振込先の口座情報\n\n※ 学生証の写しなどの追加提出は不要です（当日提示済みの場合）\n※ 上限金額や詳細条件については、ご案内メールにて個別にご説明します。\n※ ご提出いただいた内容を確認のうえ、順次返金いたします。\n\n📌 ご提出いただく情報には個人情報が含まれます。返金・費用補助の確認および手続きの目的に限り使用し、手続き完了後は速やかに破棄いたします。お申し込みいただくにあたり、これらの取り扱いにご同意いただく必要がありますので、あらかじめご了承ください。\n\n📬 ご不明点がある場合は：staff@flutterkaigi.jp';
}

// Path: ticket.purchase
class TranslationsTicketPurchaseJa {
  TranslationsTicketPurchaseJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'チケット購入'
  String get title => 'チケット購入';

  /// ja: '購入へ進む'
  String get proceed => '購入へ進む';

  /// ja: 'チケット情報を確認'
  String get confirmTitle => 'チケット情報を確認';

  /// ja: '決済を開始'
  String get paymentTitle => '決済を開始';

  /// ja: '戻る'
  String get back => '戻る';

  /// ja: '次へ'
  String get next => '次へ';

  /// ja: '決済を開始'
  String get startPayment => '決済を開始';

  /// ja: '選択済み'
  String get selected => '選択済み';

  /// ja: '決済へ進む'
  String get proceedToPayment => '決済へ進む';

  /// ja: '決済ページを開けませんでした'
  String get paymentPageError => '決済ページを開けませんでした';

  /// ja: 'エラーが発生しました'
  String get errorOccurred => 'エラーが発生しました';

  /// ja: 'このオプションを追加する'
  String get addOption => 'このオプションを追加する';

  /// ja: 'このオプションは販売終了しました'
  String get optionNotSelling => 'このオプションは販売終了しました';

  /// ja: 'このオプションは完売しました'
  String get optionSoldOut => 'このオプションは完売しました';

  /// ja: '残りわずか'
  String get fewRemaining => '残りわずか';

  /// ja: '販売中'
  String get selling => '販売中';

  /// ja: '完売'
  String get soldOut => '完売';

  /// ja: '販売終了'
  String get notSelling => '販売終了';

  /// ja: 'このチケットには以下のオプションがあります：'
  String get optionsAvailable => 'このチケットには以下のオプションがあります：';

  /// ja: 'キャンセル'
  String get cancel => 'キャンセル';

  /// ja: '未選択'
  String get unselected => '未選択';

  /// ja: '価格'
  String get price => '価格';

  /// ja: 'チケット'
  String get ticket => 'チケット';

  /// ja: '追加オプション'
  String get additionalOptions => '追加オプション';

  /// ja: '合計'
  String get total => '合計';
}

// Path: ticket.qr
class TranslationsTicketQrJa {
  TranslationsTicketQrJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '入場時にかざしてください'
  String get scanAtEntry => '入場時にかざしてください';

  /// ja: 'チケット種別'
  String get ticketType => 'チケット種別';

  /// ja: 'ネームプレートID'
  String get nameplateId => 'ネームプレートID';
}

// Path: ticket.entryTicket
class TranslationsTicketEntryTicketJa {
  TranslationsTicketEntryTicketJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '入場可能なチケット'
  String get title => '入場可能なチケット';

  /// ja: '${count: int}枚のチケットがあります'
  String subtitle({required int count}) => '${count}枚のチケットがあります';
}

// Path: ticket.notification
class TranslationsTicketNotificationJa {
  TranslationsTicketNotificationJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'チケット通知'
  String get channel_name => 'チケット通知';

  /// ja: 'チケットステータス変更の通知'
  String get channel_description => 'チケットステータス変更の通知';

  late final TranslationsTicketNotificationEntryJa entry =
      TranslationsTicketNotificationEntryJa.internal(_root);
  late final TranslationsTicketNotificationRefundJa refund =
      TranslationsTicketNotificationRefundJa.internal(_root);
}

// Path: account.profile.avatar
class TranslationsAccountProfileAvatarJa {
  TranslationsAccountProfileAvatarJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'アバターを削除しました'
  String get deleteSuccess => 'アバターを削除しました';

  /// ja: 'アバターを変更できませんでした'
  String get changeFailed => 'アバターを変更できませんでした';

  /// ja: 'アバターを変更しました'
  String get changeSuccess => 'アバターを変更しました';
}

// Path: account.profile.sns
class TranslationsAccountProfileSnsJa {
  TranslationsAccountProfileSnsJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'SNSリンクが登録されていません'
  String get notLinked => 'SNSリンクが登録されていません';

  /// ja: 'SNSタイプ'
  String get type => 'SNSタイプ';

  /// ja: 'SNSタイプを選択してください'
  String get typeRequired => 'SNSタイプを選択してください';

  /// ja: 'URL/ユーザーID'
  String get urlOrUserId => 'URL/ユーザーID';

  /// ja: 'URL/ユーザーIDを入力してください'
  String get urlOrUserIdRequired => 'URL/ユーザーIDを入力してください';

  /// ja: 'その他'
  String get other => 'その他';

  /// ja: '完全なURLを入力してください'
  String get fullUrlRequired => '完全なURLを入力してください';

  /// ja: 'ユーザーIDのみを入力してください'
  String get userIdOnly => 'ユーザーIDのみを入力してください';

  /// ja: '英数字、アンダースコア、ハイフンのみ使用可能です'
  String get alphanumericOnly => '英数字、アンダースコア、ハイフンのみ使用可能です';

  late final TranslationsAccountProfileSnsExamplesJa examples =
      TranslationsAccountProfileSnsExamplesJa.internal(_root);
  late final TranslationsAccountProfileSnsDisplayNamesJa displayNames =
      TranslationsAccountProfileSnsDisplayNamesJa.internal(_root);
}

// Path: account.profile.image
class TranslationsAccountProfileImageJa {
  TranslationsAccountProfileImageJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '画像を選択'
  String get selectTitle => '画像を選択';

  /// ja: '画像を選択してください'
  String get selectMessage => '画像を選択してください';

  /// ja: '画像を選択'
  String get selectButton => '画像を選択';

  /// ja: 'Googleアカウントの写真を使用'
  String get useGooglePhoto => 'Googleアカウントの写真を使用';

  /// ja: '画像をクロップ'
  String get cropTitle => '画像をクロップ';

  /// ja: '完了'
  String get complete => '完了';

  /// ja: 'クロップ'
  String get crop => 'クロップ';

  /// ja: 'リセット'
  String get reset => 'リセット';
}

// Path: account.profile.requiredSheet
class TranslationsAccountProfileRequiredSheetJa {
  TranslationsAccountProfileRequiredSheetJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'プロフィールを作成しましょう'
  String get title => 'プロフィールを作成しましょう';

  /// ja: 'プロフィール交換を行うには、プロフィールの作成が必要です'
  String get description => 'プロフィール交換を行うには、プロフィールの作成が必要です';

  /// ja: 'プロフィールを作成'
  String get createButton => 'プロフィールを作成';
}

// Path: account.profileshare.qrCodeDisplay
class TranslationsAccountProfileshareQrCodeDisplayJa {
  TranslationsAccountProfileshareQrCodeDisplayJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'QRコード表示'
  String get title => 'QRコード表示';

  /// ja: '自分のQRコードを表示して、相手に読み取ってもらいます'
  String get description => '自分のQRコードを表示して、相手に読み取ってもらいます';

  /// ja: 'このQRコードを相手に読み取ってもらってください'
  String get instruction => 'このQRコードを相手に読み取ってもらってください';
}

// Path: account.profileshare.qrCodeScanScreen
class TranslationsAccountProfileshareQrCodeScanScreenJa {
  TranslationsAccountProfileshareQrCodeScanScreenJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'QRコード読み取り'
  String get title => 'QRコード読み取り';

  /// ja: '相手のQRコードを読み取って、プロフィール交換します'
  String get description => '相手のQRコードを読み取って、プロフィール交換します';

  /// ja: '相手のQRコードをカメラで読み取ってください'
  String get instruction => '相手のQRコードをカメラで読み取ってください';

  /// ja: 'ログインが必要です'
  String get loginRequired => 'ログインが必要です';

  /// ja: 'プロフィールシェアしました'
  String get successMessage => 'プロフィールシェアしました';

  /// ja: 'プロフィールシェアに失敗しました'
  String get errorMessage => 'プロフィールシェアに失敗しました';

  /// ja: 'QRコードを読み取りました'
  String get scanSuccess => 'QRコードを読み取りました';

  /// ja: 'プロフィール交換しました'
  String get exchangeSuccess => 'プロフィール交換しました';

  /// ja: 'プロフィール交換に失敗しました'
  String get exchangeFailed => 'プロフィール交換に失敗しました';

  /// ja: 'すでにプロフィール交換済みです'
  String get alreadyFriends => 'すでにプロフィール交換済みです';

  /// ja: '無効なQRコードです'
  String get invalidQrCode => '無効なQRコードです';

  /// ja: '自分自身とプロフィール交換はできません'
  String get cannotExchangeWithSelf => '自分自身とプロフィール交換はできません';
}

// Path: account.profileshare.friendsListScreen
class TranslationsAccountProfileshareFriendsListScreenJa {
  TranslationsAccountProfileshareFriendsListScreenJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '交換履歴'
  String get title => '交換履歴';

  /// ja: 'まだプロフィール交換していません'
  String get emptyMessage => 'まだプロフィール交換していません';

  /// ja: '交換日時'
  String get connectedAt => '交換日時';

  /// ja: '友達リストの読み込みに失敗しました'
  String get errorLoadingFriends => '友達リストの読み込みに失敗しました';

  /// ja: 'をコピーしました'
  String get copiedToClipboard => 'をコピーしました';
}

// Path: account.profileshare.notification
class TranslationsAccountProfileshareNotificationJa {
  TranslationsAccountProfileshareNotificationJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'プロフィール交換'
  String get channel_name => 'プロフィール交換';

  /// ja: 'プロフィール交換時の通知'
  String get channel_description => 'プロフィール交換時の通知';

  /// ja: 'プロフィール交換しました'
  String get title => 'プロフィール交換しました';

  /// ja: '$name さんとプロフィール交換しました'
  String body({required Object name}) => '${name} さんとプロフィール交換しました';
}

// Path: common.error.notFound
class TranslationsCommonErrorNotFoundJa {
  TranslationsCommonErrorNotFoundJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'ページが見つかりません'
  String get title => 'ページが見つかりません';

  /// ja: 'お探しのページは存在しないか、\n移動された可能性があります。'
  String get message => 'お探しのページは存在しないか、\n移動された可能性があります。';

  /// ja: 'トップに戻る'
  String get backToTop => 'トップに戻る';
}

// Path: common.error.server
class TranslationsCommonErrorServerJa {
  TranslationsCommonErrorServerJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'サーバー側で問題が発生したようです。'
  String get title => 'サーバー側で問題が発生したようです。';

  /// ja: 'FlutterKaigi スタッフへお問い合わせください。'
  String get message => 'FlutterKaigi スタッフへお問い合わせください。';

  /// ja: 'リトライ'
  String get retry => 'リトライ';
}

// Path: common.error.widget
class TranslationsCommonErrorWidgetJa {
  TranslationsCommonErrorWidgetJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '予期しないエラーが発生しました'
  String get buildErrorTitle => '予期しないエラーが発生しました';

  /// ja: '申し訳ございません。UI 構築中に予期しないエラーが発生しました。\n\nこの問題を解決するため、GitHub の Issue を作成していただけると大変助かります。'
  String get buildErrorMessage =>
      '申し訳ございません。UI 構築中に予期しないエラーが発生しました。\n\nこの問題を解決するため、GitHub の Issue を作成していただけると大変助かります。';

  /// ja: 'GitHub の Issue ページを開く'
  String get buildErrorGitHubButton => 'GitHub の Issue ページを開く';
}

// Path: common.error.general
class TranslationsCommonErrorGeneralJa {
  TranslationsCommonErrorGeneralJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'エラーが発生しました'
  String get occurred => 'エラーが発生しました';
}

// Path: common.debug.profileShare
class TranslationsCommonDebugProfileShareJa {
  TranslationsCommonDebugProfileShareJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'Debug'
  String get title => 'Debug';

  /// ja: 'ユーザーIDを入力してください'
  String get userIdPlaceholder => 'ユーザーIDを入力してください';

  /// ja: 'シェア'
  String get share => 'シェア';
}

// Path: ticket.notification.entry
class TranslationsTicketNotificationEntryJa {
  TranslationsTicketNotificationEntryJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'FlutterKaigi 2025へようこそ！'
  String get title => 'FlutterKaigi 2025へようこそ！';

  /// ja: 'イベントをお楽しみください！'
  String get body => 'イベントをお楽しみください！';
}

// Path: ticket.notification.refund
class TranslationsTicketNotificationRefundJa {
  TranslationsTicketNotificationRefundJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'チケットが返金されました'
  String get title => 'チケットが返金されました';

  /// ja: 'チケットの返金処理が完了しました'
  String get body => 'チケットの返金処理が完了しました';
}

// Path: account.profile.sns.examples
class TranslationsAccountProfileSnsExamplesJa {
  TranslationsAccountProfileSnsExamplesJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: '例: octocat'
  String get github => '例: octocat';

  /// ja: '例: twitter'
  String get x => '例: twitter';

  /// ja: '例: 123456789012345678 (ユーザーID)'
  String get discord => '例: 123456789012345678 (ユーザーID)';

  /// ja: '例: username'
  String get medium => '例: username';

  /// ja: '例: username'
  String get qiita => '例: username';

  /// ja: '例: username'
  String get zenn => '例: username';

  /// ja: '例: username'
  String get note => '例: username';
}

// Path: account.profile.sns.displayNames
class TranslationsAccountProfileSnsDisplayNamesJa {
  TranslationsAccountProfileSnsDisplayNamesJa.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ja: 'GitHub'
  String get github => 'GitHub';

  /// ja: 'X (Twitter)'
  String get x => 'X (Twitter)';

  /// ja: 'Discord'
  String get discord => 'Discord';

  /// ja: 'Medium'
  String get medium => 'Medium';

  /// ja: 'Qiita'
  String get qiita => 'Qiita';

  /// ja: 'Zenn'
  String get zenn => 'Zenn';

  /// ja: 'note'
  String get note => 'note';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
  dynamic _flatMapFunction(String path) {
    return _flatMapFunction$0(path);
  }

  dynamic _flatMapFunction$0(String path) {
    switch (path) {
      case 'account.profileEdit':
        return 'プロフィールを編集する';
      case 'account.guestUserLabel':
        return 'ゲストでログイン中';
      case 'account.contributors':
        return 'Contributors';
      case 'account.staffMembers.title':
        return 'スタッフ';
      case 'account.staffMembers.emptyMessage':
        return 'スタッフが見つかりませんでした';
      case 'account.others':
        return 'Others';
      case 'account.codeOfConduct':
        return '行動規範';
      case 'account.codeOfConductUrl':
        return 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja';
      case 'account.privacyPolicy':
        return 'プライバシーポリシー';
      case 'account.privacyPolicyUrl':
        return 'https://docs.flutterkaigi.jp/Privacy-Policy.ja';
      case 'account.contact':
        return 'お問い合わせ';
      case 'account.contactUrl':
        return 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';
      case 'account.ossLicenses':
        return 'OSS Licenses';
      case 'account.withdrawal':
        return '退会申請';
      case 'account.logout':
        return 'ログアウト';
      case 'account.settings':
        return 'アカウント設定';
      case 'account.sourceCode':
        return 'ソースコードを見る';
      case 'account.loginRequired.title':
        return 'ログインが必要です';
      case 'account.loginRequired.description':
        return 'この機能を利用するには、ログインが必要です';
      case 'account.loginRequired.button':
        return 'ログイン';
      case 'account.profile.title':
        return 'プロフィール';
      case 'account.profile.editTitle':
        return 'プロフィール編集';
      case 'account.profile.createInfo':
        return 'プロフィール情報を作成してください';
      case 'account.profile.edit':
        return 'プロフィールを編集';
      case 'account.profile.notFound':
        return 'プロフィールが見つかりません';
      case 'account.profile.saving':
        return '保存中...';
      case 'account.profile.save':
        return '保存';
      case 'account.profile.saveSuccess':
        return 'プロフィールを保存しました';
      case 'account.profile.saveFailed':
        return '保存に失敗しました';
      case 'account.profile.errorOccurred':
        return 'エラーが発生しました';
      case 'account.profile.ageOver20':
        return '20歳以上です';
      case 'account.profile.ageUnder20':
        return '20歳未満';
      case 'account.profile.nameLabel':
        return '名前 *';
      case 'account.profile.nameRequired':
        return '名前を入力してください';
      case 'account.profile.nameTooLong':
        return '名前は20文字以内で入力してください';
      case 'account.profile.upload':
        return 'アップロード';
      case 'account.profile.delete':
        return '削除';
      case 'account.profile.snsLinks':
        return 'SNSリンク';
      case 'account.profile.add':
        return '追加';
      case 'account.profile.avatar.deleteSuccess':
        return 'アバターを削除しました';
      case 'account.profile.avatar.changeFailed':
        return 'アバターを変更できませんでした';
      case 'account.profile.avatar.changeSuccess':
        return 'アバターを変更しました';
      case 'account.profile.sns.notLinked':
        return 'SNSリンクが登録されていません';
      case 'account.profile.sns.type':
        return 'SNSタイプ';
      case 'account.profile.sns.typeRequired':
        return 'SNSタイプを選択してください';
      case 'account.profile.sns.urlOrUserId':
        return 'URL/ユーザーID';
      case 'account.profile.sns.urlOrUserIdRequired':
        return 'URL/ユーザーIDを入力してください';
      case 'account.profile.sns.other':
        return 'その他';
      case 'account.profile.sns.fullUrlRequired':
        return '完全なURLを入力してください';
      case 'account.profile.sns.userIdOnly':
        return 'ユーザーIDのみを入力してください';
      case 'account.profile.sns.alphanumericOnly':
        return '英数字、アンダースコア、ハイフンのみ使用可能です';
      case 'account.profile.sns.examples.github':
        return '例: octocat';
      case 'account.profile.sns.examples.x':
        return '例: twitter';
      case 'account.profile.sns.examples.discord':
        return '例: 123456789012345678 (ユーザーID)';
      case 'account.profile.sns.examples.medium':
        return '例: username';
      case 'account.profile.sns.examples.qiita':
        return '例: username';
      case 'account.profile.sns.examples.zenn':
        return '例: username';
      case 'account.profile.sns.examples.note':
        return '例: username';
      case 'account.profile.sns.displayNames.github':
        return 'GitHub';
      case 'account.profile.sns.displayNames.x':
        return 'X (Twitter)';
      case 'account.profile.sns.displayNames.discord':
        return 'Discord';
      case 'account.profile.sns.displayNames.medium':
        return 'Medium';
      case 'account.profile.sns.displayNames.qiita':
        return 'Qiita';
      case 'account.profile.sns.displayNames.zenn':
        return 'Zenn';
      case 'account.profile.sns.displayNames.note':
        return 'note';
      case 'account.profile.image.selectTitle':
        return '画像を選択';
      case 'account.profile.image.selectMessage':
        return '画像を選択してください';
      case 'account.profile.image.selectButton':
        return '画像を選択';
      case 'account.profile.image.useGooglePhoto':
        return 'Googleアカウントの写真を使用';
      case 'account.profile.image.cropTitle':
        return '画像をクロップ';
      case 'account.profile.image.complete':
        return '完了';
      case 'account.profile.image.crop':
        return 'クロップ';
      case 'account.profile.image.reset':
        return 'リセット';
      case 'account.profile.requiredSheet.title':
        return 'プロフィールを作成しましょう';
      case 'account.profile.requiredSheet.description':
        return 'プロフィール交換を行うには、プロフィールの作成が必要です';
      case 'account.profile.requiredSheet.createButton':
        return 'プロフィールを作成';
      case 'account.profileshare.title':
        return 'プロフィール交換';
      case 'account.profileshare.qrCode':
        return 'QRコード表示';
      case 'account.profileshare.qrCodeScan':
        return 'QRコード読み取り';
      case 'account.profileshare.friendsList':
        return '交換履歴';
      case 'account.profileshare.qrCodeDisplay.title':
        return 'QRコード表示';
      case 'account.profileshare.qrCodeDisplay.description':
        return '自分のQRコードを表示して、相手に読み取ってもらいます';
      case 'account.profileshare.qrCodeDisplay.instruction':
        return 'このQRコードを相手に読み取ってもらってください';
      case 'account.profileshare.qrCodeScanScreen.title':
        return 'QRコード読み取り';
      case 'account.profileshare.qrCodeScanScreen.description':
        return '相手のQRコードを読み取って、プロフィール交換します';
      case 'account.profileshare.qrCodeScanScreen.instruction':
        return '相手のQRコードをカメラで読み取ってください';
      case 'account.profileshare.qrCodeScanScreen.loginRequired':
        return 'ログインが必要です';
      case 'account.profileshare.qrCodeScanScreen.successMessage':
        return 'プロフィールシェアしました';
      case 'account.profileshare.qrCodeScanScreen.errorMessage':
        return 'プロフィールシェアに失敗しました';
      case 'account.profileshare.qrCodeScanScreen.scanSuccess':
        return 'QRコードを読み取りました';
      case 'account.profileshare.qrCodeScanScreen.exchangeSuccess':
        return 'プロフィール交換しました';
      case 'account.profileshare.qrCodeScanScreen.exchangeFailed':
        return 'プロフィール交換に失敗しました';
      case 'account.profileshare.qrCodeScanScreen.alreadyFriends':
        return 'すでにプロフィール交換済みです';
      case 'account.profileshare.qrCodeScanScreen.invalidQrCode':
        return '無効なQRコードです';
      case 'account.profileshare.qrCodeScanScreen.cannotExchangeWithSelf':
        return '自分自身とプロフィール交換はできません';
      case 'account.profileshare.friendsListScreen.title':
        return '交換履歴';
      case 'account.profileshare.friendsListScreen.emptyMessage':
        return 'まだプロフィール交換していません';
      case 'account.profileshare.friendsListScreen.connectedAt':
        return '交換日時';
      case 'account.profileshare.friendsListScreen.errorLoadingFriends':
        return '友達リストの読み込みに失敗しました';
      case 'account.profileshare.friendsListScreen.copiedToClipboard':
        return 'をコピーしました';
      case 'account.profileshare.notification.channel_name':
        return 'プロフィール交換';
      case 'account.profileshare.notification.channel_description':
        return 'プロフィール交換時の通知';
      case 'account.profileshare.notification.title':
        return 'プロフィール交換しました';
      case 'account.profileshare.notification.body':
        return ({required Object name}) => '${name} さんとプロフィール交換しました';
      case 'account.admin.title':
        return '管理者ページ';
      case 'account.admin.button':
        return '管理者ページ';
      case 'account.admin.userList':
        return 'ユーザ一覧';
      case 'auth.guest.signInButton':
        return 'ゲストで利用する';
      case 'auth.guest.userLabel':
        return 'ゲストでログイン中';
      case 'auth.error.identityAlreadyExists':
        return 'このGoogleアカウントは既に別のユーザーと紐づけられています。ログアウトしてから再度ログインしてください。';
      case 'auth.error.sessionExpired':
        return 'Googleアカウントへの再ログインが必要です。';
      case 'auth.loginRequired':
        return 'ログインが必要です';
      case 'common.app.name':
        return 'FlutterKaigi 2025';
      case 'common.forceUpdate.title':
        return 'アップデートが必要です';
      case 'common.forceUpdate.message':
        return '新しいバージョンのアプリが利用可能です。最新バージョンにアップデートしてください。';
      case 'common.forceUpdate.updateButton':
        return 'アップデート';
      case 'common.action.cancel':
        return 'キャンセル';
      case 'common.error.notFound.title':
        return 'ページが見つかりません';
      case 'common.error.notFound.message':
        return 'お探しのページは存在しないか、\n移動された可能性があります。';
      case 'common.error.notFound.backToTop':
        return 'トップに戻る';
      case 'common.error.server.title':
        return 'サーバー側で問題が発生したようです。';
      case 'common.error.server.message':
        return 'FlutterKaigi スタッフへお問い合わせください。';
      case 'common.error.server.retry':
        return 'リトライ';
      case 'common.error.widget.buildErrorTitle':
        return '予期しないエラーが発生しました';
      case 'common.error.widget.buildErrorMessage':
        return '申し訳ございません。UI 構築中に予期しないエラーが発生しました。\n\nこの問題を解決するため、GitHub の Issue を作成していただけると大変助かります。';
      case 'common.error.widget.buildErrorGitHubButton':
        return 'GitHub の Issue ページを開く';
      case 'common.error.general.occurred':
        return 'エラーが発生しました';
      case 'common.navigation.event':
        return 'イベント';
      case 'common.navigation.sponsor':
        return 'スポンサー';
      case 'common.navigation.session':
        return 'セッション';
      case 'common.navigation.ticket':
        return 'チケット';
      case 'common.navigation.account':
        return 'アカウント';
      case 'common.debug.title':
        return 'Debug';
      case 'common.debug.talkerScreen':
        return 'Talker 画面へ';
      case 'common.debug.pathRequired':
        return 'パスを入力してください';
      case 'common.debug.pathMustStartWithSlash':
        return 'パスは / で始めてください';
      case 'common.debug.pathCannotContainDebugOrLogin':
        return 'パスに「debug」または「login」を含めることはできません';
      case 'common.debug.invalidPath':
        return '無効なパスです';
      case 'common.debug.go':
        return 'GO';
      case 'common.debug.profileShare.title':
        return 'Debug';
      case 'common.debug.profileShare.userIdPlaceholder':
        return 'ユーザーIDを入力してください';
      case 'common.debug.profileShare.share':
        return 'シェア';
      case 'event.description':
        return '2025年、日本国内で Flutter をメインに扱う技術カンファレンス。Flutter や Dart の深い知見を持つ開発者によるセッションを多数企画します。';
      case 'event.date':
        return '2025年11月13日(木)';
      case 'event.time':
        return '10:00 ~ 18:00';
      case 'event.venue':
        return '大手町プレイス ホール＆カンファレンス';
      case 'event.address':
        return '東京都千代田区大手町二丁目3番1号';
      case 'event.survey.title':
        return 'アンケート協力のお願い';
      case 'event.survey.description':
        return '今後のFlutterKaigiをより良いイベントにするため、皆様のご意見をお聞かせください。';
      case 'event.survey.button':
        return '全体アンケートに回答する';
      case 'event.contributors':
        return 'Contributors';
      case 'event.staffMembers.title':
        return 'スタッフ';
      case 'event.staffMembers.emptyMessage':
        return 'スタッフが見つかりませんでした';
      case 'event.others':
        return 'Others';
      case 'event.codeOfConduct':
        return '行動規範';
      case 'event.codeOfConductUrl':
        return 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja';
      case 'event.privacyPolicy':
        return 'プライバシーポリシー';
      case 'event.privacyPolicyUrl':
        return 'https://docs.flutterkaigi.jp/Privacy-Policy.ja';
      case 'event.contact':
        return 'お問い合わせ';
      case 'event.contactUrl':
        return 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';
      case 'event.ossLicenses':
        return 'OSS Licenses';
      case 'event.sourceCode':
        return 'ソースコードを見る';
      case 'license.title':
        return 'ライセンス';
      case 'license.search.hintText':
        return 'パッケージを検索';
      case 'license.listTile.description':
        return ({required num n}) =>
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
              n,
              one: 'ライセンス: ${n}件',
              other: 'ライセンス: ${n}件',
            );
      case 'news.tile.title':
        return '最新のお知らせ';
      case 'news.tile.subtitle':
        return '最新のお知らせをご確認ください';
      case 'news.screen.title':
        return 'お知らせ';
      case 'news.empty.message':
        return '現在、新しいお知らせはありません。';
      case 'session.title':
        return 'タイムテーブル';
      case 'session.detail.bookmark':
        return 'ブックマーク';
      case 'session.bookmarked.title':
        return 'お気に入りセッション';
      case 'session.empty.message':
        return '現在、表示可能なセッションがありません。';
      case 'session.feedback.title':
        return 'フィードバック';
      case 'session.feedback.send':
        return 'フィードバックを送る';
      case 'session.survey.button':
        return 'セッションフィードバックを送る';
      case 'session.notification.channel_name':
        return 'セッションリマインダー';
      case 'session.notification.channel_description':
        return 'お気に入りセッション開始15分前の通知';
      case 'session.notification.title':
        return 'セッション開始まであと15分';
      case 'session.notification.body':
        return ({required Object title, required Object venue}) =>
            '${title}\n📍 ${venue}';
      case 'sponsor.prText':
        return 'PR 文章';
      case 'sponsor.enthusiasm':
        return '意気込み';
      case 'sponsor.company':
        return '企業スポンサー';
      case 'sponsor.individual':
        return '個人スポンサー';
      case 'sponsor.website':
        return 'ウェブサイト';
      case 'sponsor.websiteNotSet':
        return '設定されていません';
      case 'sponsor.xAccount':
        return 'X アカウント';
      case 'sponsor.xAccountNotSet':
        return '設定されていません';
      case 'sponsor.name':
        return 'スポンサー名';
      case 'ticket.status.purchased':
        return '購入済み';
      case 'ticket.status.pending':
        return '決済待ち';
      case 'ticket.status.refunded':
        return '返金済み';
      case 'ticket.status.entered':
        return '入場済み';
      case 'ticket.options':
        return 'オプション:';
      case 'ticket.purchaseDate':
        return '購入日時';
      case 'ticket.expiryDate':
        return '期限';
      case 'ticket.noAvailableTickets':
        return '現在、購入可能なチケットはありません';
      case 'ticket.list':
        return 'チケット一覧';
      case 'ticket.loginRequired.title':
        return 'チケット購入前にGoogleアカウントでログインしてください';
      case 'ticket.loginRequired.linkTitle':
        return 'チケット購入前にGoogleアカウントとリンクしてください';
      case 'ticket.loginRequired.description':
        return 'チケットを購入するためには、Googleアカウントでログインしてください';
      case 'ticket.loginRequired.appleSignInTitle':
        return 'Apple Sign Inではチケット購入ができません';
      case 'ticket.loginRequired.appleSignInDescription':
        return '現在、Apple Sign Inでログインされています。チケットを購入するには、一度ログアウトしてGoogleアカウントでログインし直してください。';
      case 'ticket.notice.title':
        return 'ご注意';
      case 'ticket.notice.message':
        return '「個人スポンサーチケット」のみでは、FlutterKaigi 2025本編（カンファレンス会場）へのご入場はできません。\n入場をご希望の方は、アーリーチケット（9月末まで販売予定）またはノーマルチケットを別途ご購入ください。\nなお、「個人スポンサーチケット」は、入場を目的とせず FlutterKaigi を応援したい方のご支援も大歓迎です！\n\n前夜祭への参加は「アーリーチケット」のみが対象です。\nノーマルチケットでは前夜祭に参加できませんのでご注意ください。';
      case 'ticket.studentRefund.title':
        return '学生向け返金・費用補助について';
      case 'ticket.studentRefund.description':
        return 'FlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に返金・費用補助を実施いたします。';
      case 'ticket.studentRefund.detailsButton':
        return '詳細を見る';
      case 'ticket.studentRefund.dialogContent':
        return '🎓 学生向け返金・費用補助について\nFlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に、以下の返金・費用補助を実施いたします。\n\n✅ 対象となる費用\n- チケット代金\n- 交通費（上限あり）\n- 宿泊費（上限あり）\n\n🧑‍🎓 対象となる「学生」の定義\n以下のいずれかに該当し、在学を証明できる方が対象です：\n- 日本国内外の教育機関（小学校・中学校・高等学校・高等専門学校・専門学校・大学・大学院など）に在籍中の方\n- 年齢や就業状況を問わず、学生証または在学証明書を提示できる方\n\n🎟 対象条件\n- FlutterKaigi 2025に実際に参加された方\n- 実際に学生支援スポンサーとの交流企画へ参加された方\n- 前当日の受付にて、有効な学生証や在学証明書をご提示いただいた方\n\n参加記録は運営側で確認いたします。事前申請は不要です。\n\n📩 返金手続きについて\nイベント終了後、対象の方へメールにて返金手続きの詳細をご案内いたします。\n\nその際、以下の情報をご提出いただきます：\n- チケット購入時の情報\n- 交通費・宿泊費の領収書または証明書類\n- 振込先の口座情報\n\n※ 学生証の写しなどの追加提出は不要です（当日提示済みの場合）\n※ 上限金額や詳細条件については、ご案内メールにて個別にご説明します。\n※ ご提出いただいた内容を確認のうえ、順次返金いたします。\n\n📌 ご提出いただく情報には個人情報が含まれます。返金・費用補助の確認および手続きの目的に限り使用し、手続き完了後は速やかに破棄いたします。お申し込みいただくにあたり、これらの取り扱いにご同意いただく必要がありますので、あらかじめご了承ください。\n\n📬 ご不明点がある場合は：staff@flutterkaigi.jp';
      case 'ticket.purchase.title':
        return 'チケット購入';
      case 'ticket.purchase.proceed':
        return '購入へ進む';
      case 'ticket.purchase.confirmTitle':
        return 'チケット情報を確認';
      case 'ticket.purchase.paymentTitle':
        return '決済を開始';
      case 'ticket.purchase.back':
        return '戻る';
      case 'ticket.purchase.next':
        return '次へ';
      case 'ticket.purchase.startPayment':
        return '決済を開始';
      case 'ticket.purchase.selected':
        return '選択済み';
      case 'ticket.purchase.proceedToPayment':
        return '決済へ進む';
      case 'ticket.purchase.paymentPageError':
        return '決済ページを開けませんでした';
      case 'ticket.purchase.errorOccurred':
        return 'エラーが発生しました';
      case 'ticket.purchase.addOption':
        return 'このオプションを追加する';
      case 'ticket.purchase.optionNotSelling':
        return 'このオプションは販売終了しました';
      case 'ticket.purchase.optionSoldOut':
        return 'このオプションは完売しました';
      case 'ticket.purchase.fewRemaining':
        return '残りわずか';
      case 'ticket.purchase.selling':
        return '販売中';
      case 'ticket.purchase.soldOut':
        return '完売';
      case 'ticket.purchase.notSelling':
        return '販売終了';
      case 'ticket.purchase.optionsAvailable':
        return 'このチケットには以下のオプションがあります：';
      case 'ticket.purchase.cancel':
        return 'キャンセル';
      case 'ticket.purchase.unselected':
        return '未選択';
      case 'ticket.purchase.price':
        return '価格';
      case 'ticket.purchase.ticket':
        return 'チケット';
      case 'ticket.purchase.additionalOptions':
        return '追加オプション';
      case 'ticket.purchase.total':
        return '合計';
      case 'ticket.qr.scanAtEntry':
        return '入場時にかざしてください';
      case 'ticket.qr.ticketType':
        return 'チケット種別';
      case 'ticket.qr.nameplateId':
        return 'ネームプレートID';
      case 'ticket.entryTicket.title':
        return '入場可能なチケット';
      case 'ticket.entryTicket.subtitle':
        return ({required int count}) => '${count}枚のチケットがあります';
      case 'ticket.notification.channel_name':
        return 'チケット通知';
      case 'ticket.notification.channel_description':
        return 'チケットステータス変更の通知';
      case 'ticket.notification.entry.title':
        return 'FlutterKaigi 2025へようこそ！';
      case 'ticket.notification.entry.body':
        return 'イベントをお楽しみください！';
      case 'ticket.notification.refund.title':
        return 'チケットが返金されました';
      case 'ticket.notification.refund.body':
        return 'チケットの返金処理が完了しました';
      case 'venue.title':
        return '会場マップ';
      case 'venue.floor1f':
        return '1F';
      case 'venue.floor2f':
        return '2F';
      default:
        return null;
    }
  }
}
