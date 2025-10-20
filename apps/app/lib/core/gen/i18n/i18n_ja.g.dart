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
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAccountJa account = TranslationsAccountJa.internal(_root);
	late final TranslationsAuthJa auth = TranslationsAuthJa.internal(_root);
	late final TranslationsCommonJa common = TranslationsCommonJa.internal(_root);
	late final TranslationsEventJa event = TranslationsEventJa.internal(_root);
	late final TranslationsNewsJa news = TranslationsNewsJa.internal(_root);
	late final TranslationsSessionJa session = TranslationsSessionJa.internal(_root);
	late final TranslationsSponsorJa sponsor = TranslationsSponsorJa.internal(_root);
	late final TranslationsTicketJa ticket = TranslationsTicketJa.internal(_root);
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

	/// ja: 'Others'
	String get others => 'Others';

	/// ja: '行動規範'
	String get codeOfConduct => '行動規範';

	/// ja: 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja'
	String get codeOfConductUrl => 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja';

	/// ja: 'プライバシーポリシー'
	String get privacyPolicy => 'プライバシーポリシー';

	/// ja: 'https://docs.flutterkaigi.jp/Privacy-Policy.ja'
	String get privacyPolicyUrl => 'https://docs.flutterkaigi.jp/Privacy-Policy.ja';

	/// ja: 'お問い合わせ'
	String get contact => 'お問い合わせ';

	/// ja: 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform'
	String get contactUrl => 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';

	/// ja: 'OSS Licenses'
	String get ossLicenses => 'OSS Licenses';

	/// ja: '退会申請'
	String get withdrawal => '退会申請';

	/// ja: 'ログアウト'
	String get logout => 'ログアウト';

	/// ja: 'アカウント設定'
	String get settings => 'アカウント設定';

	late final TranslationsAccountProfileJa profile = TranslationsAccountProfileJa.internal(_root);
	late final TranslationsAccountProfileshareJa profileshare = TranslationsAccountProfileshareJa.internal(_root);
}

// Path: auth
class TranslationsAuthJa {
	TranslationsAuthJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthGuestJa guest = TranslationsAuthGuestJa.internal(_root);
	late final TranslationsAuthErrorJa error = TranslationsAuthErrorJa.internal(_root);

	/// ja: 'ログインが必要です'
	String get loginRequired => 'ログインが必要です';
}

// Path: common
class TranslationsCommonJa {
	TranslationsCommonJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsCommonAppJa app = TranslationsCommonAppJa.internal(_root);
	late final TranslationsCommonForceUpdateJa forceUpdate = TranslationsCommonForceUpdateJa.internal(_root);
	late final TranslationsCommonErrorJa error = TranslationsCommonErrorJa.internal(_root);
	late final TranslationsCommonNavigationJa navigation = TranslationsCommonNavigationJa.internal(_root);
	late final TranslationsCommonDebugJa debug = TranslationsCommonDebugJa.internal(_root);
}

// Path: event
class TranslationsEventJa {
	TranslationsEventJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '2025年、日本国内で Flutter をメインに扱う技術カンファレンス。Flutter や Dart の深い知見を持つ開発者によるセッションを多数企画します。'
	String get description => '2025年、日本国内で Flutter をメインに扱う技術カンファレンス。Flutter や Dart の深い知見を持つ開発者によるセッションを多数企画します。';

	/// ja: '2025年11月13日(木)'
	String get date => '2025年11月13日(木)';

	/// ja: '10:00 ~ 18:00'
	String get time => '10:00 ~ 18:00';

	/// ja: '大手町プレイス ホール＆カンファレンス'
	String get venue => '大手町プレイス ホール＆カンファレンス';

	/// ja: '東京都千代田区大手町二丁目3番1号'
	String get address => '東京都千代田区大手町二丁目3番1号';
}

// Path: news
class TranslationsNewsJa {
	TranslationsNewsJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsNewsTileJa tile = TranslationsNewsTileJa.internal(_root);
	late final TranslationsNewsScreenJa screen = TranslationsNewsScreenJa.internal(_root);
	late final TranslationsNewsEmptyJa empty = TranslationsNewsEmptyJa.internal(_root);
}

// Path: session
class TranslationsSessionJa {
	TranslationsSessionJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'タイムテーブル'
	String get title => 'タイムテーブル';

	late final TranslationsSessionDetailJa detail = TranslationsSessionDetailJa.internal(_root);
	late final TranslationsSessionBookmarkedJa bookmarked = TranslationsSessionBookmarkedJa.internal(_root);
	late final TranslationsSessionEmptyJa empty = TranslationsSessionEmptyJa.internal(_root);
	late final TranslationsSessionFeedbackJa feedback = TranslationsSessionFeedbackJa.internal(_root);
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
	late final TranslationsTicketStatusJa status = TranslationsTicketStatusJa.internal(_root);

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

	late final TranslationsTicketLoginRequiredJa loginRequired = TranslationsTicketLoginRequiredJa.internal(_root);
	late final TranslationsTicketNoticeJa notice = TranslationsTicketNoticeJa.internal(_root);
	late final TranslationsTicketStudentRefundJa studentRefund = TranslationsTicketStudentRefundJa.internal(_root);
	late final TranslationsTicketPurchaseJa purchase = TranslationsTicketPurchaseJa.internal(_root);
	late final TranslationsTicketQrJa qr = TranslationsTicketQrJa.internal(_root);
	late final TranslationsTicketEntryTicketJa entryTicket = TranslationsTicketEntryTicketJa.internal(_root);
}

// Path: account.profile
class TranslationsAccountProfileJa {
	TranslationsAccountProfileJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'プロファイル'
	String get title => 'プロファイル';

	/// ja: 'プロフィール編集'
	String get editTitle => 'プロフィール編集';

	/// ja: 'プロファイル情報を作成してください'
	String get createInfo => 'プロファイル情報を作成してください';

	/// ja: 'プロファイルを編集'
	String get edit => 'プロファイルを編集';

	/// ja: 'プロファイルが見つかりません'
	String get notFound => 'プロファイルが見つかりません';

	/// ja: '保存中...'
	String get saving => '保存中...';

	/// ja: '保存'
	String get save => '保存';

	/// ja: 'プロファイルを保存しました'
	String get saveSuccess => 'プロファイルを保存しました';

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

	late final TranslationsAccountProfileAvatarJa avatar = TranslationsAccountProfileAvatarJa.internal(_root);
	late final TranslationsAccountProfileSnsJa sns = TranslationsAccountProfileSnsJa.internal(_root);
	late final TranslationsAccountProfileImageJa image = TranslationsAccountProfileImageJa.internal(_root);
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

	late final TranslationsAccountProfileshareQrCodeDisplayJa qrCodeDisplay = TranslationsAccountProfileshareQrCodeDisplayJa.internal(_root);
	late final TranslationsAccountProfileshareQrCodeScanScreenJa qrCodeScanScreen = TranslationsAccountProfileshareQrCodeScanScreenJa.internal(_root);
	late final TranslationsAccountProfileshareFriendsListScreenJa friendsListScreen = TranslationsAccountProfileshareFriendsListScreenJa.internal(_root);
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
	String get identityAlreadyExists => 'このGoogleアカウントは既に別のユーザーと紐づけられています。ログアウトしてから再度ログインしてください。';

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

// Path: common.error
class TranslationsCommonErrorJa {
	TranslationsCommonErrorJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsCommonErrorNotFoundJa notFound = TranslationsCommonErrorNotFoundJa.internal(_root);
	late final TranslationsCommonErrorServerJa server = TranslationsCommonErrorServerJa.internal(_root);
	late final TranslationsCommonErrorWidgetJa widget = TranslationsCommonErrorWidgetJa.internal(_root);
	late final TranslationsCommonErrorGeneralJa general = TranslationsCommonErrorGeneralJa.internal(_root);
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
	String get pathCannotContainDebugOrLogin => 'パスに「debug」または「login」を含めることはできません';

	/// ja: '無効なパスです'
	String get invalidPath => '無効なパスです';

	/// ja: 'GO'
	String get go => 'GO';

	late final TranslationsCommonDebugProfileShareJa profileShare = TranslationsCommonDebugProfileShareJa.internal(_root);
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

// Path: ticket.status
class TranslationsTicketStatusJa {
	TranslationsTicketStatusJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '購入済み'
	String get purchased => '購入済み';

	/// ja: '決済待ち'
	String get pending => '決済待ち';
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
}

// Path: ticket.notice
class TranslationsTicketNoticeJa {
	TranslationsTicketNoticeJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ご注意'
	String get title => 'ご注意';

	/// ja: '「個人スポンサーチケット」のみでは、FlutterKaigi 2025本編（カンファレンス会場）へのご入場はできません。\n入場をご希望の方は、アーリーチケット（9月末まで販売予定）またはノーマルチケットを別途ご購入ください。\nなお、「個人スポンサーチケット」は、入場を目的とせず FlutterKaigi を応援したい方のご支援も大歓迎です！\n\n前夜祭への参加は「アーリーチケット」のみが対象です。\nノーマルチケットでは前夜祭に参加できませんのでご注意ください。'
	String get message => '「個人スポンサーチケット」のみでは、FlutterKaigi 2025本編（カンファレンス会場）へのご入場はできません。\n入場をご希望の方は、アーリーチケット（9月末まで販売予定）またはノーマルチケットを別途ご購入ください。\nなお、「個人スポンサーチケット」は、入場を目的とせず FlutterKaigi を応援したい方のご支援も大歓迎です！\n\n前夜祭への参加は「アーリーチケット」のみが対象です。\nノーマルチケットでは前夜祭に参加できませんのでご注意ください。';
}

// Path: ticket.studentRefund
class TranslationsTicketStudentRefundJa {
	TranslationsTicketStudentRefundJa.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '学生向け返金・費用補助について'
	String get title => '学生向け返金・費用補助について';

	/// ja: 'FlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に返金・費用補助を実施いたします。'
	String get description => 'FlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に返金・費用補助を実施いたします。';

	/// ja: '詳細を見る'
	String get detailsButton => '詳細を見る';

	/// ja: '🎓 学生向け返金・費用補助について\nFlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に、以下の返金・費用補助を実施いたします。\n\n✅ 対象となる費用\n- チケット代金\n- 交通費（上限あり）\n- 宿泊費（上限あり）\n\n🧑‍🎓 対象となる「学生」の定義\n以下のいずれかに該当し、在学を証明できる方が対象です：\n- 日本国内外の教育機関（小学校・中学校・高等学校・高等専門学校・専門学校・大学・大学院など）に在籍中の方\n- 年齢や就業状況を問わず、学生証または在学証明書を提示できる方\n\n🎟 対象条件\n- FlutterKaigi 2025に実際に参加された方\n- 実際に学生支援スポンサーとの交流企画へ参加された方\n- 前当日の受付にて、有効な学生証や在学証明書をご提示いただいた方\n\n参加記録は運営側で確認いたします。事前申請は不要です。\n\n📩 返金手続きについて\nイベント終了後、対象の方へメールにて返金手続きの詳細をご案内いたします。\n\nその際、以下の情報をご提出いただきます：\n- チケット購入時の情報\n- 交通費・宿泊費の領収書または証明書類\n- 振込先の口座情報\n\n※ 学生証の写しなどの追加提出は不要です（当日提示済みの場合）\n※ 上限金額や詳細条件については、ご案内メールにて個別にご説明します。\n※ ご提出いただいた内容を確認のうえ、順次返金いたします。\n\n📌 ご提出いただく情報には個人情報が含まれます。返金・費用補助の確認および手続きの目的に限り使用し、手続き完了後は速やかに破棄いたします。お申し込みいただくにあたり、これらの取り扱いにご同意いただく必要がありますので、あらかじめご了承ください。\n\n📬 ご不明点がある場合は：staff@flutterkaigi.jp'
	String get dialogContent => '🎓 学生向け返金・費用補助について\nFlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に、以下の返金・費用補助を実施いたします。\n\n✅ 対象となる費用\n- チケット代金\n- 交通費（上限あり）\n- 宿泊費（上限あり）\n\n🧑‍🎓 対象となる「学生」の定義\n以下のいずれかに該当し、在学を証明できる方が対象です：\n- 日本国内外の教育機関（小学校・中学校・高等学校・高等専門学校・専門学校・大学・大学院など）に在籍中の方\n- 年齢や就業状況を問わず、学生証または在学証明書を提示できる方\n\n🎟 対象条件\n- FlutterKaigi 2025に実際に参加された方\n- 実際に学生支援スポンサーとの交流企画へ参加された方\n- 前当日の受付にて、有効な学生証や在学証明書をご提示いただいた方\n\n参加記録は運営側で確認いたします。事前申請は不要です。\n\n📩 返金手続きについて\nイベント終了後、対象の方へメールにて返金手続きの詳細をご案内いたします。\n\nその際、以下の情報をご提出いただきます：\n- チケット購入時の情報\n- 交通費・宿泊費の領収書または証明書類\n- 振込先の口座情報\n\n※ 学生証の写しなどの追加提出は不要です（当日提示済みの場合）\n※ 上限金額や詳細条件については、ご案内メールにて個別にご説明します。\n※ ご提出いただいた内容を確認のうえ、順次返金いたします。\n\n📌 ご提出いただく情報には個人情報が含まれます。返金・費用補助の確認および手続きの目的に限り使用し、手続き完了後は速やかに破棄いたします。お申し込みいただくにあたり、これらの取り扱いにご同意いただく必要がありますので、あらかじめご了承ください。\n\n📬 ご不明点がある場合は：staff@flutterkaigi.jp';
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

	late final TranslationsAccountProfileSnsExamplesJa examples = TranslationsAccountProfileSnsExamplesJa.internal(_root);
	late final TranslationsAccountProfileSnsDisplayNamesJa displayNames = TranslationsAccountProfileSnsDisplayNamesJa.internal(_root);
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

	/// ja: 'プロフィールシェア確認'
	String get confirmTitle => 'プロフィールシェア確認';

	/// ja: 'このユーザーとプロフィールをシェアしますか?'
	String get confirmMessage => 'このユーザーとプロフィールをシェアしますか?';

	/// ja: 'キャンセル'
	String get cancel => 'キャンセル';

	/// ja: 'シェアする'
	String get connect => 'シェアする';

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
	String get buildErrorMessage => '申し訳ございません。UI 構築中に予期しないエラーが発生しました。\n\nこの問題を解決するため、GitHub の Issue を作成していただけると大変助かります。';

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
/// Note: We use a HashMap because Dart seems to be unable to compile large switch statements.
Map<String, dynamic>? _map;

extension on Translations {
	dynamic _flatMapFunction(String path) {
		final map = _map ?? _initFlatMap();
		return map[path];
	}

	/// Initializes the flat map and returns it.
	Map<String, dynamic> _initFlatMap() {
		final map = <String, dynamic>{};
		map['account.profileEdit'] = 'プロフィールを編集する';
		map['account.guestUserLabel'] = 'ゲストでログイン中';
		map['account.others'] = 'Others';
		map['account.codeOfConduct'] = '行動規範';
		map['account.codeOfConductUrl'] = 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja';
		map['account.privacyPolicy'] = 'プライバシーポリシー';
		map['account.privacyPolicyUrl'] = 'https://docs.flutterkaigi.jp/Privacy-Policy.ja';
		map['account.contact'] = 'お問い合わせ';
		map['account.contactUrl'] = 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';
		map['account.ossLicenses'] = 'OSS Licenses';
		map['account.withdrawal'] = '退会申請';
		map['account.logout'] = 'ログアウト';
		map['account.settings'] = 'アカウント設定';
		map['account.profile.title'] = 'プロファイル';
		map['account.profile.editTitle'] = 'プロフィール編集';
		map['account.profile.createInfo'] = 'プロファイル情報を作成してください';
		map['account.profile.edit'] = 'プロファイルを編集';
		map['account.profile.notFound'] = 'プロファイルが見つかりません';
		map['account.profile.saving'] = '保存中...';
		map['account.profile.save'] = '保存';
		map['account.profile.saveSuccess'] = 'プロファイルを保存しました';
		map['account.profile.saveFailed'] = '保存に失敗しました';
		map['account.profile.errorOccurred'] = 'エラーが発生しました';
		map['account.profile.ageOver20'] = '20歳以上です';
		map['account.profile.ageUnder20'] = '20歳未満';
		map['account.profile.nameLabel'] = '名前 *';
		map['account.profile.nameRequired'] = '名前を入力してください';
		map['account.profile.nameTooLong'] = '名前は20文字以内で入力してください';
		map['account.profile.upload'] = 'アップロード';
		map['account.profile.delete'] = '削除';
		map['account.profile.snsLinks'] = 'SNSリンク';
		map['account.profile.add'] = '追加';
		map['account.profile.avatar.deleteSuccess'] = 'アバターを削除しました';
		map['account.profile.avatar.changeFailed'] = 'アバターを変更できませんでした';
		map['account.profile.avatar.changeSuccess'] = 'アバターを変更しました';
		map['account.profile.sns.notLinked'] = 'SNSリンクが登録されていません';
		map['account.profile.sns.type'] = 'SNSタイプ';
		map['account.profile.sns.urlOrUserId'] = 'URL/ユーザーID';
		map['account.profile.sns.urlOrUserIdRequired'] = 'URL/ユーザーIDを入力してください';
		map['account.profile.sns.other'] = 'その他';
		map['account.profile.sns.fullUrlRequired'] = '完全なURLを入力してください';
		map['account.profile.sns.userIdOnly'] = 'ユーザーIDのみを入力してください';
		map['account.profile.sns.alphanumericOnly'] = '英数字、アンダースコア、ハイフンのみ使用可能です';
		map['account.profile.sns.examples.github'] = '例: octocat';
		map['account.profile.sns.examples.x'] = '例: twitter';
		map['account.profile.sns.examples.discord'] = '例: 123456789012345678 (ユーザーID)';
		map['account.profile.sns.examples.medium'] = '例: username';
		map['account.profile.sns.examples.qiita'] = '例: username';
		map['account.profile.sns.examples.zenn'] = '例: username';
		map['account.profile.sns.examples.note'] = '例: username';
		map['account.profile.sns.displayNames.github'] = 'GitHub';
		map['account.profile.sns.displayNames.x'] = 'X (Twitter)';
		map['account.profile.sns.displayNames.discord'] = 'Discord';
		map['account.profile.sns.displayNames.medium'] = 'Medium';
		map['account.profile.sns.displayNames.qiita'] = 'Qiita';
		map['account.profile.sns.displayNames.zenn'] = 'Zenn';
		map['account.profile.sns.displayNames.note'] = 'note';
		map['account.profile.image.selectTitle'] = '画像を選択';
		map['account.profile.image.selectMessage'] = '画像を選択してください';
		map['account.profile.image.selectButton'] = '画像を選択';
		map['account.profile.image.useGooglePhoto'] = 'Googleアカウントの写真を使用';
		map['account.profile.image.cropTitle'] = '画像をクロップ';
		map['account.profile.image.complete'] = '完了';
		map['account.profile.image.crop'] = 'クロップ';
		map['account.profile.image.reset'] = 'リセット';
		map['account.profileshare.title'] = 'プロフィール交換';
		map['account.profileshare.qrCode'] = 'QRコード表示';
		map['account.profileshare.qrCodeScan'] = 'QRコード読み取り';
		map['account.profileshare.friendsList'] = '交換履歴';
		map['account.profileshare.qrCodeDisplay.title'] = 'QRコード表示';
		map['account.profileshare.qrCodeDisplay.description'] = '自分のQRコードを表示して、相手に読み取ってもらいます';
		map['account.profileshare.qrCodeDisplay.instruction'] = 'このQRコードを相手に読み取ってもらってください';
		map['account.profileshare.qrCodeScanScreen.title'] = 'QRコード読み取り';
		map['account.profileshare.qrCodeScanScreen.description'] = '相手のQRコードを読み取って、プロフィール交換します';
		map['account.profileshare.qrCodeScanScreen.instruction'] = '相手のQRコードをカメラで読み取ってください';
		map['account.profileshare.qrCodeScanScreen.loginRequired'] = 'ログインが必要です';
		map['account.profileshare.qrCodeScanScreen.confirmTitle'] = 'プロフィールシェア確認';
		map['account.profileshare.qrCodeScanScreen.confirmMessage'] = 'このユーザーとプロフィールをシェアしますか?';
		map['account.profileshare.qrCodeScanScreen.cancel'] = 'キャンセル';
		map['account.profileshare.qrCodeScanScreen.connect'] = 'シェアする';
		map['account.profileshare.qrCodeScanScreen.successMessage'] = 'プロフィールシェアしました';
		map['account.profileshare.qrCodeScanScreen.errorMessage'] = 'プロフィールシェアに失敗しました';
		map['account.profileshare.qrCodeScanScreen.scanSuccess'] = 'QRコードを読み取りました';
		map['account.profileshare.qrCodeScanScreen.exchangeSuccess'] = 'プロフィール交換しました';
		map['account.profileshare.qrCodeScanScreen.exchangeFailed'] = 'プロフィール交換に失敗しました';
		map['account.profileshare.qrCodeScanScreen.alreadyFriends'] = 'すでにプロフィール交換済みです';
		map['account.profileshare.qrCodeScanScreen.invalidQrCode'] = '無効なQRコードです';
		map['account.profileshare.qrCodeScanScreen.cannotExchangeWithSelf'] = '自分自身とプロフィール交換はできません';
		map['account.profileshare.friendsListScreen.title'] = '交換履歴';
		map['account.profileshare.friendsListScreen.emptyMessage'] = 'まだプロフィール交換していません';
		map['account.profileshare.friendsListScreen.connectedAt'] = '交換日時';
		map['account.profileshare.friendsListScreen.errorLoadingFriends'] = '友達リストの読み込みに失敗しました';
		map['account.profileshare.friendsListScreen.copiedToClipboard'] = 'をコピーしました';
		map['auth.guest.signInButton'] = 'ゲストで利用する';
		map['auth.guest.userLabel'] = 'ゲストでログイン中';
		map['auth.error.identityAlreadyExists'] = 'このGoogleアカウントは既に別のユーザーと紐づけられています。ログアウトしてから再度ログインしてください。';
		map['auth.error.sessionExpired'] = 'Googleアカウントへの再ログインが必要です。';
		map['auth.loginRequired'] = 'ログインが必要です';
		map['common.app.name'] = 'FlutterKaigi 2025';
		map['common.forceUpdate.title'] = 'アップデートが必要です';
		map['common.forceUpdate.message'] = '新しいバージョンのアプリが利用可能です。最新バージョンにアップデートしてください。';
		map['common.forceUpdate.updateButton'] = 'アップデート';
		map['common.error.notFound.title'] = 'ページが見つかりません';
		map['common.error.notFound.message'] = 'お探しのページは存在しないか、\n移動された可能性があります。';
		map['common.error.notFound.backToTop'] = 'トップに戻る';
		map['common.error.server.title'] = 'サーバー側で問題が発生したようです。';
		map['common.error.server.message'] = 'FlutterKaigi スタッフへお問い合わせください。';
		map['common.error.server.retry'] = 'リトライ';
		map['common.error.widget.buildErrorTitle'] = '予期しないエラーが発生しました';
		map['common.error.widget.buildErrorMessage'] = '申し訳ございません。UI 構築中に予期しないエラーが発生しました。\n\nこの問題を解決するため、GitHub の Issue を作成していただけると大変助かります。';
		map['common.error.widget.buildErrorGitHubButton'] = 'GitHub の Issue ページを開く';
		map['common.error.general.occurred'] = 'エラーが発生しました';
		map['common.navigation.event'] = 'イベント';
		map['common.navigation.sponsor'] = 'スポンサー';
		map['common.navigation.session'] = 'セッション';
		map['common.navigation.ticket'] = 'チケット';
		map['common.navigation.account'] = 'アカウント';
		map['common.debug.title'] = 'Debug';
		map['common.debug.talkerScreen'] = 'Talker 画面へ';
		map['common.debug.pathRequired'] = 'パスを入力してください';
		map['common.debug.pathMustStartWithSlash'] = 'パスは / で始めてください';
		map['common.debug.pathCannotContainDebugOrLogin'] = 'パスに「debug」または「login」を含めることはできません';
		map['common.debug.invalidPath'] = '無効なパスです';
		map['common.debug.go'] = 'GO';
		map['common.debug.profileShare.title'] = 'Debug';
		map['common.debug.profileShare.userIdPlaceholder'] = 'ユーザーIDを入力してください';
		map['common.debug.profileShare.share'] = 'シェア';
		map['event.description'] = '2025年、日本国内で Flutter をメインに扱う技術カンファレンス。Flutter や Dart の深い知見を持つ開発者によるセッションを多数企画します。';
		map['event.date'] = '2025年11月13日(木)';
		map['event.time'] = '10:00 ~ 18:00';
		map['event.venue'] = '大手町プレイス ホール＆カンファレンス';
		map['event.address'] = '東京都千代田区大手町二丁目3番1号';
		map['news.tile.title'] = '最新のお知らせ';
		map['news.tile.subtitle'] = '最新のお知らせをご確認ください';
		map['news.screen.title'] = 'お知らせ';
		map['news.empty.message'] = '現在、新しいお知らせはありません。';
		map['session.title'] = 'タイムテーブル';
		map['session.detail.bookmark'] = 'ブックマーク';
		map['session.bookmarked.title'] = 'お気に入りセッション';
		map['session.empty.message'] = '現在、表示可能なセッションがありません。';
		map['session.feedback.title'] = 'フィードバック';
		map['session.feedback.send'] = 'フィードバックを送る';
		map['sponsor.prText'] = 'PR 文章';
		map['sponsor.enthusiasm'] = '意気込み';
		map['sponsor.company'] = '企業スポンサー';
		map['sponsor.individual'] = '個人スポンサー';
		map['sponsor.website'] = 'ウェブサイト';
		map['sponsor.websiteNotSet'] = '設定されていません';
		map['sponsor.xAccount'] = 'X アカウント';
		map['sponsor.xAccountNotSet'] = '設定されていません';
		map['sponsor.name'] = 'スポンサー名';
		map['ticket.status.purchased'] = '購入済み';
		map['ticket.status.pending'] = '決済待ち';
		map['ticket.options'] = 'オプション:';
		map['ticket.purchaseDate'] = '購入日時';
		map['ticket.expiryDate'] = '期限';
		map['ticket.noAvailableTickets'] = '現在、購入可能なチケットはありません';
		map['ticket.list'] = 'チケット一覧';
		map['ticket.loginRequired.title'] = 'チケット購入前にGoogleアカウントでログインしてください';
		map['ticket.loginRequired.linkTitle'] = 'チケット購入前にGoogleアカウントとリンクしてください';
		map['ticket.loginRequired.description'] = 'チケットを購入するためには、Googleアカウントでログインしてください';
		map['ticket.notice.title'] = 'ご注意';
		map['ticket.notice.message'] = '「個人スポンサーチケット」のみでは、FlutterKaigi 2025本編（カンファレンス会場）へのご入場はできません。\n入場をご希望の方は、アーリーチケット（9月末まで販売予定）またはノーマルチケットを別途ご購入ください。\nなお、「個人スポンサーチケット」は、入場を目的とせず FlutterKaigi を応援したい方のご支援も大歓迎です！\n\n前夜祭への参加は「アーリーチケット」のみが対象です。\nノーマルチケットでは前夜祭に参加できませんのでご注意ください。';
		map['ticket.studentRefund.title'] = '学生向け返金・費用補助について';
		map['ticket.studentRefund.description'] = 'FlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に返金・費用補助を実施いたします。';
		map['ticket.studentRefund.detailsButton'] = '詳細を見る';
		map['ticket.studentRefund.dialogContent'] = '🎓 学生向け返金・費用補助について\nFlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に、以下の返金・費用補助を実施いたします。\n\n✅ 対象となる費用\n- チケット代金\n- 交通費（上限あり）\n- 宿泊費（上限あり）\n\n🧑‍🎓 対象となる「学生」の定義\n以下のいずれかに該当し、在学を証明できる方が対象です：\n- 日本国内外の教育機関（小学校・中学校・高等学校・高等専門学校・専門学校・大学・大学院など）に在籍中の方\n- 年齢や就業状況を問わず、学生証または在学証明書を提示できる方\n\n🎟 対象条件\n- FlutterKaigi 2025に実際に参加された方\n- 実際に学生支援スポンサーとの交流企画へ参加された方\n- 前当日の受付にて、有効な学生証や在学証明書をご提示いただいた方\n\n参加記録は運営側で確認いたします。事前申請は不要です。\n\n📩 返金手続きについて\nイベント終了後、対象の方へメールにて返金手続きの詳細をご案内いたします。\n\nその際、以下の情報をご提出いただきます：\n- チケット購入時の情報\n- 交通費・宿泊費の領収書または証明書類\n- 振込先の口座情報\n\n※ 学生証の写しなどの追加提出は不要です（当日提示済みの場合）\n※ 上限金額や詳細条件については、ご案内メールにて個別にご説明します。\n※ ご提出いただいた内容を確認のうえ、順次返金いたします。\n\n📌 ご提出いただく情報には個人情報が含まれます。返金・費用補助の確認および手続きの目的に限り使用し、手続き完了後は速やかに破棄いたします。お申し込みいただくにあたり、これらの取り扱いにご同意いただく必要がありますので、あらかじめご了承ください。\n\n📬 ご不明点がある場合は：staff@flutterkaigi.jp';
		map['ticket.purchase.title'] = 'チケット購入';
		map['ticket.purchase.proceed'] = '購入へ進む';
		map['ticket.purchase.confirmTitle'] = 'チケット情報を確認';
		map['ticket.purchase.paymentTitle'] = '決済を開始';
		map['ticket.purchase.back'] = '戻る';
		map['ticket.purchase.next'] = '次へ';
		map['ticket.purchase.startPayment'] = '決済を開始';
		map['ticket.purchase.selected'] = '選択済み';
		map['ticket.purchase.proceedToPayment'] = '決済へ進む';
		map['ticket.purchase.paymentPageError'] = '決済ページを開けませんでした';
		map['ticket.purchase.errorOccurred'] = 'エラーが発生しました';
		map['ticket.purchase.addOption'] = 'このオプションを追加する';
		map['ticket.purchase.optionNotSelling'] = 'このオプションは販売終了しました';
		map['ticket.purchase.optionSoldOut'] = 'このオプションは完売しました';
		map['ticket.purchase.fewRemaining'] = '残りわずか';
		map['ticket.purchase.selling'] = '販売中';
		map['ticket.purchase.soldOut'] = '完売';
		map['ticket.purchase.notSelling'] = '販売終了';
		map['ticket.purchase.optionsAvailable'] = 'このチケットには以下のオプションがあります：';
		map['ticket.purchase.cancel'] = 'キャンセル';
		map['ticket.purchase.unselected'] = '未選択';
		map['ticket.purchase.price'] = '価格';
		map['ticket.purchase.ticket'] = 'チケット';
		map['ticket.purchase.additionalOptions'] = '追加オプション';
		map['ticket.purchase.total'] = '合計';
		map['ticket.qr.scanAtEntry'] = '入場時にかざしてください';
		map['ticket.qr.ticketType'] = 'チケット種別';
		map['ticket.qr.nameplateId'] = 'ネームプレートID';
		map['ticket.entryTicket.title'] = '入場可能なチケット';
		map['ticket.entryTicket.subtitle'] = ({required int count}) => '${count}枚のチケットがあります';

		_map = map;
		return map;
	}
}

