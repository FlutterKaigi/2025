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
	late final TranslationsAppJa app = TranslationsAppJa._(_root);
	late final TranslationsNewsJa news = TranslationsNewsJa._(_root);
	late final TranslationsEventJa event = TranslationsEventJa._(_root);
	late final TranslationsSponsorJa sponsor = TranslationsSponsorJa._(_root);
	late final TranslationsAccountJa account = TranslationsAccountJa._(_root);
	late final TranslationsAuthJa auth = TranslationsAuthJa._(_root);
	late final TranslationsErrorJa error = TranslationsErrorJa._(_root);
	late final TranslationsDebugJa debug = TranslationsDebugJa._(_root);
	late final TranslationsTicketJa ticket = TranslationsTicketJa._(_root);
}

// Path: app
class TranslationsAppJa {
	TranslationsAppJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'FlutterKaigi 2025'
	String get name => 'FlutterKaigi 2025';
}

// Path: news
class TranslationsNewsJa {
	TranslationsNewsJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsNewsTileJa tile = TranslationsNewsTileJa._(_root);
	late final TranslationsNewsScreenJa screen = TranslationsNewsScreenJa._(_root);
	late final TranslationsNewsEmptyJa empty = TranslationsNewsEmptyJa._(_root);
}

// Path: event
class TranslationsEventJa {
	TranslationsEventJa._(this._root);

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

// Path: sponsor
class TranslationsSponsorJa {
	TranslationsSponsorJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'PR 文章'
	String get prText => 'PR 文章';

	/// ja: '意気込み'
	String get enthusiasm => '意気込み';

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

// Path: account
class TranslationsAccountJa {
	TranslationsAccountJa._(this._root);

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

	/// ja: 'ログアウト'
	String get logout => 'ログアウト';

	late final TranslationsAccountProfileJa profile = TranslationsAccountProfileJa._(_root);
}

// Path: auth
class TranslationsAuthJa {
	TranslationsAuthJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthGuestJa guest = TranslationsAuthGuestJa._(_root);
	late final TranslationsAuthErrorJa error = TranslationsAuthErrorJa._(_root);
}

// Path: error
class TranslationsErrorJa {
	TranslationsErrorJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsErrorNotFoundJa notFound = TranslationsErrorNotFoundJa._(_root);
	late final TranslationsErrorServerJa server = TranslationsErrorServerJa._(_root);
	late final TranslationsErrorWidgetJa widget = TranslationsErrorWidgetJa._(_root);
	late final TranslationsErrorGeneralJa general = TranslationsErrorGeneralJa._(_root);
}

// Path: debug
class TranslationsDebugJa {
	TranslationsDebugJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'Talker 画面へ'
	String get talkerScreen => 'Talker 画面へ';
}

// Path: ticket
class TranslationsTicketJa {
	TranslationsTicketJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTicketStatusJa status = TranslationsTicketStatusJa._(_root);

	/// ja: 'オプション'
	String get options => 'オプション';

	/// ja: '購入日時'
	String get purchaseDate => '購入日時';

	/// ja: '期限'
	String get expiryDate => '期限';

	/// ja: '現在、購入可能なチケットはありません'
	String get noAvailableTickets => '現在、購入可能なチケットはありません';

	late final TranslationsTicketNoticeJa notice = TranslationsTicketNoticeJa._(_root);
	late final TranslationsTicketStudentRefundJa studentRefund = TranslationsTicketStudentRefundJa._(_root);
	late final TranslationsTicketPurchaseJa purchase = TranslationsTicketPurchaseJa._(_root);
}

// Path: news.tile
class TranslationsNewsTileJa {
	TranslationsNewsTileJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '最新のお知らせ'
	String get title => '最新のお知らせ';

	/// ja: '最新のお知らせをご確認ください'
	String get subtitle => '最新のお知らせをご確認ください';
}

// Path: news.screen
class TranslationsNewsScreenJa {
	TranslationsNewsScreenJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'お知らせ'
	String get title => 'お知らせ';
}

// Path: news.empty
class TranslationsNewsEmptyJa {
	TranslationsNewsEmptyJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '現在、新しいお知らせはありません。'
	String get message => '現在、新しいお知らせはありません。';
}

// Path: account.profile
class TranslationsAccountProfileJa {
	TranslationsAccountProfileJa._(this._root);

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

	/// ja: 'アップロード'
	String get upload => 'アップロード';

	/// ja: '削除'
	String get delete => '削除';

	/// ja: 'SNSリンク'
	String get snsLinks => 'SNSリンク';

	/// ja: '追加'
	String get add => '追加';

	late final TranslationsAccountProfileAvatarJa avatar = TranslationsAccountProfileAvatarJa._(_root);
	late final TranslationsAccountProfileSnsJa sns = TranslationsAccountProfileSnsJa._(_root);
	late final TranslationsAccountProfileImageJa image = TranslationsAccountProfileImageJa._(_root);
}

// Path: auth.guest
class TranslationsAuthGuestJa {
	TranslationsAuthGuestJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ゲストで利用する'
	String get signInButton => 'ゲストで利用する';

	/// ja: 'ゲストでログイン中'
	String get userLabel => 'ゲストでログイン中';
}

// Path: auth.error
class TranslationsAuthErrorJa {
	TranslationsAuthErrorJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'このGoogleアカウントは既に別のユーザーと紐づけられています。ログアウトしてから再度ログインしてください。'
	String get identityAlreadyExists => 'このGoogleアカウントは既に別のユーザーと紐づけられています。ログアウトしてから再度ログインしてください。';
}

// Path: error.notFound
class TranslationsErrorNotFoundJa {
	TranslationsErrorNotFoundJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ページが見つかりません'
	String get title => 'ページが見つかりません';

	/// ja: 'お探しのページは存在しないか、\n移動された可能性があります。'
	String get message => 'お探しのページは存在しないか、\n移動された可能性があります。';

	/// ja: 'トップに戻る'
	String get backToTop => 'トップに戻る';
}

// Path: error.server
class TranslationsErrorServerJa {
	TranslationsErrorServerJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'サーバー側で問題が発生したようです。'
	String get title => 'サーバー側で問題が発生したようです。';

	/// ja: 'FlutterKaigi スタッフへお問い合わせください。'
	String get message => 'FlutterKaigi スタッフへお問い合わせください。';

	/// ja: 'リトライ'
	String get retry => 'リトライ';
}

// Path: error.widget
class TranslationsErrorWidgetJa {
	TranslationsErrorWidgetJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '予期しないエラーが発生しました'
	String get buildErrorTitle => '予期しないエラーが発生しました';

	/// ja: '申し訳ございません。UI 構築中に予期しないエラーが発生しました。\n\nこの問題を解決するため、GitHub の Issue を作成していただけると大変助かります。'
	String get buildErrorMessage => '申し訳ございません。UI 構築中に予期しないエラーが発生しました。\n\nこの問題を解決するため、GitHub の Issue を作成していただけると大変助かります。';

	/// ja: 'GitHub の Issue ページを開く'
	String get buildErrorGitHubButton => 'GitHub の Issue ページを開く';
}

// Path: error.general
class TranslationsErrorGeneralJa {
	TranslationsErrorGeneralJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'エラーが発生しました'
	String get occurred => 'エラーが発生しました';
}

// Path: ticket.status
class TranslationsTicketStatusJa {
	TranslationsTicketStatusJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '購入済み'
	String get purchased => '購入済み';

	/// ja: '決済待ち'
	String get pending => '決済待ち';
}

// Path: ticket.notice
class TranslationsTicketNoticeJa {
	TranslationsTicketNoticeJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ご注意'
	String get title => 'ご注意';

	/// ja: '「個人スポンサーチケット」のみでは、FlutterKaigi 2025本編（カンファレンス会場）へのご入場はできません。\n入場をご希望の方は、アーリーチケット（9月末まで販売予定）またはノーマルチケットを別途ご購入ください。\nなお、「個人スポンサーチケット」は、入場を目的とせず FlutterKaigi を応援したい方のご支援も大歓迎です！\n\n前夜祭への参加は「アーリーチケット」のみが対象です。\nノーマルチケットでは前夜祭に参加できませんのでご注意ください。'
	String get message => '「個人スポンサーチケット」のみでは、FlutterKaigi 2025本編（カンファレンス会場）へのご入場はできません。\n入場をご希望の方は、アーリーチケット（9月末まで販売予定）またはノーマルチケットを別途ご購入ください。\nなお、「個人スポンサーチケット」は、入場を目的とせず FlutterKaigi を応援したい方のご支援も大歓迎です！\n\n前夜祭への参加は「アーリーチケット」のみが対象です。\nノーマルチケットでは前夜祭に参加できませんのでご注意ください。';
}

// Path: ticket.studentRefund
class TranslationsTicketStudentRefundJa {
	TranslationsTicketStudentRefundJa._(this._root);

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
	TranslationsTicketPurchaseJa._(this._root);

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

	/// ja: '売り切れ'
	String get soldOut => '売り切れ';

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

// Path: account.profile.avatar
class TranslationsAccountProfileAvatarJa {
	TranslationsAccountProfileAvatarJa._(this._root);

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
	TranslationsAccountProfileSnsJa._(this._root);

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

	late final TranslationsAccountProfileSnsExamplesJa examples = TranslationsAccountProfileSnsExamplesJa._(_root);
	late final TranslationsAccountProfileSnsDisplayNamesJa displayNames = TranslationsAccountProfileSnsDisplayNamesJa._(_root);
}

// Path: account.profile.image
class TranslationsAccountProfileImageJa {
	TranslationsAccountProfileImageJa._(this._root);

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
}

// Path: account.profile.sns.examples
class TranslationsAccountProfileSnsExamplesJa {
	TranslationsAccountProfileSnsExamplesJa._(this._root);

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
	TranslationsAccountProfileSnsDisplayNamesJa._(this._root);

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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app.name': return 'FlutterKaigi 2025';
			case 'news.tile.title': return '最新のお知らせ';
			case 'news.tile.subtitle': return '最新のお知らせをご確認ください';
			case 'news.screen.title': return 'お知らせ';
			case 'news.empty.message': return '現在、新しいお知らせはありません。';
			case 'event.description': return '2025年、日本国内で Flutter をメインに扱う技術カンファレンス。Flutter や Dart の深い知見を持つ開発者によるセッションを多数企画します。';
			case 'event.date': return '2025年11月13日(木)';
			case 'event.time': return '10:00 ~ 18:00';
			case 'event.venue': return '大手町プレイス ホール＆カンファレンス';
			case 'event.address': return '東京都千代田区大手町二丁目3番1号';
			case 'sponsor.prText': return 'PR 文章';
			case 'sponsor.enthusiasm': return '意気込み';
			case 'sponsor.website': return 'ウェブサイト';
			case 'sponsor.websiteNotSet': return '設定されていません';
			case 'sponsor.xAccount': return 'X アカウント';
			case 'sponsor.xAccountNotSet': return '設定されていません';
			case 'sponsor.name': return 'スポンサー名';
			case 'account.profileEdit': return 'プロフィールを編集する';
			case 'account.guestUserLabel': return 'ゲストでログイン中';
			case 'account.others': return 'Others';
			case 'account.codeOfConduct': return '行動規範';
			case 'account.codeOfConductUrl': return 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja';
			case 'account.privacyPolicy': return 'プライバシーポリシー';
			case 'account.privacyPolicyUrl': return 'https://docs.flutterkaigi.jp/Privacy-Policy.ja';
			case 'account.contact': return 'お問い合わせ';
			case 'account.contactUrl': return 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';
			case 'account.ossLicenses': return 'OSS Licenses';
			case 'account.logout': return 'ログアウト';
			case 'account.profile.title': return 'プロファイル';
			case 'account.profile.editTitle': return 'プロフィール編集';
			case 'account.profile.createInfo': return 'プロファイル情報を作成してください';
			case 'account.profile.edit': return 'プロファイルを編集';
			case 'account.profile.notFound': return 'プロファイルが見つかりません';
			case 'account.profile.saving': return '保存中...';
			case 'account.profile.save': return '保存';
			case 'account.profile.saveSuccess': return 'プロファイルを保存しました';
			case 'account.profile.saveFailed': return '保存に失敗しました';
			case 'account.profile.errorOccurred': return 'エラーが発生しました';
			case 'account.profile.ageOver20': return '20歳以上です';
			case 'account.profile.ageUnder20': return '20歳未満';
			case 'account.profile.nameLabel': return '名前 *';
			case 'account.profile.nameRequired': return '名前を入力してください';
			case 'account.profile.upload': return 'アップロード';
			case 'account.profile.delete': return '削除';
			case 'account.profile.snsLinks': return 'SNSリンク';
			case 'account.profile.add': return '追加';
			case 'account.profile.avatar.deleteSuccess': return 'アバターを削除しました';
			case 'account.profile.avatar.changeFailed': return 'アバターを変更できませんでした';
			case 'account.profile.avatar.changeSuccess': return 'アバターを変更しました';
			case 'account.profile.sns.notLinked': return 'SNSリンクが登録されていません';
			case 'account.profile.sns.type': return 'SNSタイプ';
			case 'account.profile.sns.urlOrUserId': return 'URL/ユーザーID';
			case 'account.profile.sns.urlOrUserIdRequired': return 'URL/ユーザーIDを入力してください';
			case 'account.profile.sns.other': return 'その他';
			case 'account.profile.sns.fullUrlRequired': return '完全なURLを入力してください';
			case 'account.profile.sns.userIdOnly': return 'ユーザーIDのみを入力してください';
			case 'account.profile.sns.alphanumericOnly': return '英数字、アンダースコア、ハイフンのみ使用可能です';
			case 'account.profile.sns.examples.github': return '例: octocat';
			case 'account.profile.sns.examples.x': return '例: twitter';
			case 'account.profile.sns.examples.discord': return '例: 123456789012345678 (ユーザーID)';
			case 'account.profile.sns.examples.medium': return '例: username';
			case 'account.profile.sns.examples.qiita': return '例: username';
			case 'account.profile.sns.examples.zenn': return '例: username';
			case 'account.profile.sns.examples.note': return '例: username';
			case 'account.profile.sns.displayNames.github': return 'GitHub';
			case 'account.profile.sns.displayNames.x': return 'X (Twitter)';
			case 'account.profile.sns.displayNames.discord': return 'Discord';
			case 'account.profile.sns.displayNames.medium': return 'Medium';
			case 'account.profile.sns.displayNames.qiita': return 'Qiita';
			case 'account.profile.sns.displayNames.zenn': return 'Zenn';
			case 'account.profile.sns.displayNames.note': return 'note';
			case 'account.profile.image.selectTitle': return '画像を選択';
			case 'account.profile.image.selectMessage': return '画像を選択してください';
			case 'account.profile.image.selectButton': return '画像を選択';
			case 'account.profile.image.useGooglePhoto': return 'Googleアカウントの写真を使用';
			case 'account.profile.image.cropTitle': return '画像をクロップ';
			case 'auth.guest.signInButton': return 'ゲストで利用する';
			case 'auth.guest.userLabel': return 'ゲストでログイン中';
			case 'auth.error.identityAlreadyExists': return 'このGoogleアカウントは既に別のユーザーと紐づけられています。ログアウトしてから再度ログインしてください。';
			case 'error.notFound.title': return 'ページが見つかりません';
			case 'error.notFound.message': return 'お探しのページは存在しないか、\n移動された可能性があります。';
			case 'error.notFound.backToTop': return 'トップに戻る';
			case 'error.server.title': return 'サーバー側で問題が発生したようです。';
			case 'error.server.message': return 'FlutterKaigi スタッフへお問い合わせください。';
			case 'error.server.retry': return 'リトライ';
			case 'error.widget.buildErrorTitle': return '予期しないエラーが発生しました';
			case 'error.widget.buildErrorMessage': return '申し訳ございません。UI 構築中に予期しないエラーが発生しました。\n\nこの問題を解決するため、GitHub の Issue を作成していただけると大変助かります。';
			case 'error.widget.buildErrorGitHubButton': return 'GitHub の Issue ページを開く';
			case 'error.general.occurred': return 'エラーが発生しました';
			case 'debug.talkerScreen': return 'Talker 画面へ';
			case 'ticket.status.purchased': return '購入済み';
			case 'ticket.status.pending': return '決済待ち';
			case 'ticket.options': return 'オプション';
			case 'ticket.purchaseDate': return '購入日時';
			case 'ticket.expiryDate': return '期限';
			case 'ticket.noAvailableTickets': return '現在、購入可能なチケットはありません';
			case 'ticket.notice.title': return 'ご注意';
			case 'ticket.notice.message': return '「個人スポンサーチケット」のみでは、FlutterKaigi 2025本編（カンファレンス会場）へのご入場はできません。\n入場をご希望の方は、アーリーチケット（9月末まで販売予定）またはノーマルチケットを別途ご購入ください。\nなお、「個人スポンサーチケット」は、入場を目的とせず FlutterKaigi を応援したい方のご支援も大歓迎です！\n\n前夜祭への参加は「アーリーチケット」のみが対象です。\nノーマルチケットでは前夜祭に参加できませんのでご注意ください。';
			case 'ticket.studentRefund.title': return '学生向け返金・費用補助について';
			case 'ticket.studentRefund.description': return 'FlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に返金・費用補助を実施いたします。';
			case 'ticket.studentRefund.detailsButton': return '詳細を見る';
			case 'ticket.studentRefund.dialogContent': return '🎓 学生向け返金・費用補助について\nFlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に、以下の返金・費用補助を実施いたします。\n\n✅ 対象となる費用\n- チケット代金\n- 交通費（上限あり）\n- 宿泊費（上限あり）\n\n🧑‍🎓 対象となる「学生」の定義\n以下のいずれかに該当し、在学を証明できる方が対象です：\n- 日本国内外の教育機関（小学校・中学校・高等学校・高等専門学校・専門学校・大学・大学院など）に在籍中の方\n- 年齢や就業状況を問わず、学生証または在学証明書を提示できる方\n\n🎟 対象条件\n- FlutterKaigi 2025に実際に参加された方\n- 実際に学生支援スポンサーとの交流企画へ参加された方\n- 前当日の受付にて、有効な学生証や在学証明書をご提示いただいた方\n\n参加記録は運営側で確認いたします。事前申請は不要です。\n\n📩 返金手続きについて\nイベント終了後、対象の方へメールにて返金手続きの詳細をご案内いたします。\n\nその際、以下の情報をご提出いただきます：\n- チケット購入時の情報\n- 交通費・宿泊費の領収書または証明書類\n- 振込先の口座情報\n\n※ 学生証の写しなどの追加提出は不要です（当日提示済みの場合）\n※ 上限金額や詳細条件については、ご案内メールにて個別にご説明します。\n※ ご提出いただいた内容を確認のうえ、順次返金いたします。\n\n📌 ご提出いただく情報には個人情報が含まれます。返金・費用補助の確認および手続きの目的に限り使用し、手続き完了後は速やかに破棄いたします。お申し込みいただくにあたり、これらの取り扱いにご同意いただく必要がありますので、あらかじめご了承ください。\n\n📬 ご不明点がある場合は：staff@flutterkaigi.jp';
			case 'ticket.purchase.title': return 'チケット購入';
			case 'ticket.purchase.proceed': return '購入へ進む';
			case 'ticket.purchase.confirmTitle': return 'チケット情報を確認';
			case 'ticket.purchase.paymentTitle': return '決済を開始';
			case 'ticket.purchase.back': return '戻る';
			case 'ticket.purchase.next': return '次へ';
			case 'ticket.purchase.startPayment': return '決済を開始';
			case 'ticket.purchase.selected': return '選択済み';
			case 'ticket.purchase.proceedToPayment': return '決済へ進む';
			case 'ticket.purchase.paymentPageError': return '決済ページを開けませんでした';
			case 'ticket.purchase.errorOccurred': return 'エラーが発生しました';
			case 'ticket.purchase.addOption': return 'このオプションを追加する';
			case 'ticket.purchase.optionNotSelling': return 'このオプションは販売終了しました';
			case 'ticket.purchase.optionSoldOut': return 'このオプションは完売しました';
			case 'ticket.purchase.fewRemaining': return '残りわずか';
			case 'ticket.purchase.selling': return '販売中';
			case 'ticket.purchase.soldOut': return '売り切れ';
			case 'ticket.purchase.notSelling': return '販売終了';
			case 'ticket.purchase.optionsAvailable': return 'このチケットには以下のオプションがあります：';
			case 'ticket.purchase.cancel': return 'キャンセル';
			case 'ticket.purchase.unselected': return '未選択';
			case 'ticket.purchase.price': return '価格';
			case 'ticket.purchase.ticket': return 'チケット';
			case 'ticket.purchase.additionalOptions': return '追加オプション';
			case 'ticket.purchase.total': return '合計';
			default: return null;
		}
	}
}

