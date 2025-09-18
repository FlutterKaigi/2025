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
}

// Path: ticket
class TranslationsTicketJa {
	TranslationsTicketJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTicketNoticeJa notice = TranslationsTicketNoticeJa._(_root);
	late final TranslationsTicketStudentRefundJa studentRefund = TranslationsTicketStudentRefundJa._(_root);
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
			case 'account.others': return 'Others';
			case 'account.codeOfConduct': return '行動規範';
			case 'account.codeOfConductUrl': return 'https://docs.flutterkaigi.jp/Code-of-Conduct.ja';
			case 'account.privacyPolicy': return 'プライバシーポリシー';
			case 'account.privacyPolicyUrl': return 'https://docs.flutterkaigi.jp/Privacy-Policy.ja';
			case 'account.contact': return 'お問い合わせ';
			case 'account.contactUrl': return 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';
			case 'account.ossLicenses': return 'OSS Licenses';
			case 'account.logout': return 'ログアウト';
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
			case 'ticket.notice.title': return 'ご注意';
			case 'ticket.notice.message': return '「個人スポンサーチケット」のみでは、FlutterKaigi 2025本編（カンファレンス会場）へのご入場はできません。\n入場をご希望の方は、アーリーチケット（9月末まで販売予定）またはノーマルチケットを別途ご購入ください。\nなお、「個人スポンサーチケット」は、入場を目的とせず FlutterKaigi を応援したい方のご支援も大歓迎です！\n\n前夜祭への参加は「アーリーチケット」のみが対象です。\nノーマルチケットでは前夜祭に参加できませんのでご注意ください。';
			case 'ticket.studentRefund.title': return '学生向け返金・費用補助について';
			case 'ticket.studentRefund.description': return 'FlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に返金・費用補助を実施いたします。';
			case 'ticket.studentRefund.detailsButton': return '詳細を見る';
			case 'ticket.studentRefund.dialogContent': return '🎓 学生向け返金・費用補助について\nFlutterKaigi 2025では、学生支援スポンサー様のご協力により、アーリーチケット・ノーマルチケットをご購入の方を対象に、以下の返金・費用補助を実施いたします。\n\n✅ 対象となる費用\n- チケット代金\n- 交通費（上限あり）\n- 宿泊費（上限あり）\n\n🧑‍🎓 対象となる「学生」の定義\n以下のいずれかに該当し、在学を証明できる方が対象です：\n- 日本国内外の教育機関（小学校・中学校・高等学校・高等専門学校・専門学校・大学・大学院など）に在籍中の方\n- 年齢や就業状況を問わず、学生証または在学証明書を提示できる方\n\n🎟 対象条件\n- FlutterKaigi 2025に実際に参加された方\n- 実際に学生支援スポンサーとの交流企画へ参加された方\n- 前当日の受付にて、有効な学生証や在学証明書をご提示いただいた方\n\n参加記録は運営側で確認いたします。事前申請は不要です。\n\n📩 返金手続きについて\nイベント終了後、対象の方へメールにて返金手続きの詳細をご案内いたします。\n\nその際、以下の情報をご提出いただきます：\n- チケット購入時の情報\n- 交通費・宿泊費の領収書または証明書類\n- 振込先の口座情報\n\n※ 学生証の写しなどの追加提出は不要です（当日提示済みの場合）\n※ 上限金額や詳細条件については、ご案内メールにて個別にご説明します。\n※ ご提出いただいた内容を確認のうえ、順次返金いたします。\n\n📌 ご提出いただく情報には個人情報が含まれます。返金・費用補助の確認および手続きの目的に限り使用し、手続き完了後は速やかに破棄いたします。お申し込みいただくにあたり、これらの取り扱いにご同意いただく必要がありますので、あらかじめご了承ください。\n\n📬 ご不明点がある場合は：staff@flutterkaigi.jp';
			default: return null;
		}
	}
}

