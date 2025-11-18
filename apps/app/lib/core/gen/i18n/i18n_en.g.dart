///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'i18n.g.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';

// Path: <root>
class TranslationsEn extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAuthEn auth = _TranslationsAuthEn._(_root);
	@override late final _TranslationsCommonEn common = _TranslationsCommonEn._(_root);
	@override late final _TranslationsEventEn event = _TranslationsEventEn._(_root);
	@override late final _TranslationsLicenseEn license = _TranslationsLicenseEn._(_root);
	@override late final _TranslationsNewsEn news = _TranslationsNewsEn._(_root);
	@override late final _TranslationsSessionEn session = _TranslationsSessionEn._(_root);
	@override late final _TranslationsSponsorEn sponsor = _TranslationsSponsorEn._(_root);
	@override late final _TranslationsTicketEn ticket = _TranslationsTicketEn._(_root);
	@override late final _TranslationsVenueEn venue = _TranslationsVenueEn._(_root);
}

// Path: auth
class _TranslationsAuthEn extends TranslationsAuthJa {
	_TranslationsAuthEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAuthGuestEn guest = _TranslationsAuthGuestEn._(_root);
	@override late final _TranslationsAuthErrorEn error = _TranslationsAuthErrorEn._(_root);
}

// Path: common
class _TranslationsCommonEn extends TranslationsCommonJa {
	_TranslationsCommonEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCommonAppEn app = _TranslationsCommonAppEn._(_root);
	@override late final _TranslationsCommonForceUpdateEn forceUpdate = _TranslationsCommonForceUpdateEn._(_root);
	@override late final _TranslationsCommonActionEn action = _TranslationsCommonActionEn._(_root);
	@override late final _TranslationsCommonErrorEn error = _TranslationsCommonErrorEn._(_root);
	@override late final _TranslationsCommonNavigationEn navigation = _TranslationsCommonNavigationEn._(_root);
	@override late final _TranslationsCommonDebugEn debug = _TranslationsCommonDebugEn._(_root);
}

// Path: event
class _TranslationsEventEn extends TranslationsEventJa {
	_TranslationsEventEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get description => 'Japan\'s Flutter tech conference in 2025. Featuring sessions from developers with deep Flutter and Dart expertise.';
	@override String get date => 'November 13, 2025 (Thu)';
	@override String get time => '10:00 ~ 18:00';
	@override String get venue => 'Otemachi Place Hall & Conference';
	@override String get address => '2-3-1 Otemachi, Chiyoda-ku, Tokyo';
	@override late final _TranslationsEventSurveyEn survey = _TranslationsEventSurveyEn._(_root);
	@override String get contributors => 'Contributors';
	@override late final _TranslationsEventStaffMembersEn staffMembers = _TranslationsEventStaffMembersEn._(_root);
	@override String get others => 'Others';
	@override String get codeOfConduct => 'Code of Conduct';
	@override String get codeOfConductUrl => 'https://docs.flutterkaigi.jp/Code-of-Conduct';
	@override String get privacyPolicy => 'Privacy Policy';
	@override String get privacyPolicyUrl => 'https://docs.flutterkaigi.jp/Privacy-Policy';
	@override String get contact => 'Contact Us';
	@override String get contactUrl => 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';
	@override String get ossLicenses => 'OSS Licenses';
	@override String get sourceCode => 'View Source Code';
}

// Path: license
class _TranslationsLicenseEn extends TranslationsLicenseJa {
	_TranslationsLicenseEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Licensees';
	@override late final _TranslationsLicenseSearchEn search = _TranslationsLicenseSearchEn._(_root);
	@override late final _TranslationsLicenseListTileEn listTile = _TranslationsLicenseListTileEn._(_root);
}

// Path: news
class _TranslationsNewsEn extends TranslationsNewsJa {
	_TranslationsNewsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsNewsTileEn tile = _TranslationsNewsTileEn._(_root);
	@override late final _TranslationsNewsScreenEn screen = _TranslationsNewsScreenEn._(_root);
	@override late final _TranslationsNewsEmptyEn empty = _TranslationsNewsEmptyEn._(_root);
}

// Path: session
class _TranslationsSessionEn extends TranslationsSessionJa {
	_TranslationsSessionEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Timetable';
	@override late final _TranslationsSessionDetailEn detail = _TranslationsSessionDetailEn._(_root);
	@override late final _TranslationsSessionBookmarkedEn bookmarked = _TranslationsSessionBookmarkedEn._(_root);
	@override late final _TranslationsSessionEmptyEn empty = _TranslationsSessionEmptyEn._(_root);
	@override late final _TranslationsSessionFeedbackEn feedback = _TranslationsSessionFeedbackEn._(_root);
	@override late final _TranslationsSessionSurveyEn survey = _TranslationsSessionSurveyEn._(_root);
	@override late final _TranslationsSessionNotificationEn notification = _TranslationsSessionNotificationEn._(_root);
}

// Path: sponsor
class _TranslationsSponsorEn extends TranslationsSponsorJa {
	_TranslationsSponsorEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get prText => 'About Us';
	@override String get enthusiasm => 'Message';
	@override String get company => 'Sponsors';
	@override String get individual => 'Individual Sponsors';
	@override String get website => 'Website';
	@override String get websiteNotSet => 'No website';
	@override String get xAccount => 'X Account';
	@override String get xAccountNotSet => 'No X account';
	@override String get name => 'Sponsor Name';
}

// Path: ticket
class _TranslationsTicketEn extends TranslationsTicketJa {
	_TranslationsTicketEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsTicketStatusEn status = _TranslationsTicketStatusEn._(_root);
	@override String get options => 'Options:';
	@override String get purchaseDate => 'Purchase Date';
	@override String get expiryDate => 'Expiration Date';
	@override String get noAvailableTickets => 'No tickets are available for purchase at this time';
	@override String get list => 'Ticket List';
	@override late final _TranslationsTicketLoginRequiredEn loginRequired = _TranslationsTicketLoginRequiredEn._(_root);
	@override late final _TranslationsTicketNoticeEn notice = _TranslationsTicketNoticeEn._(_root);
	@override late final _TranslationsTicketStudentRefundEn studentRefund = _TranslationsTicketStudentRefundEn._(_root);
	@override late final _TranslationsTicketPurchaseEn purchase = _TranslationsTicketPurchaseEn._(_root);
	@override late final _TranslationsTicketQrEn qr = _TranslationsTicketQrEn._(_root);
	@override late final _TranslationsTicketEntryTicketEn entryTicket = _TranslationsTicketEntryTicketEn._(_root);
	@override late final _TranslationsTicketNotificationEn notification = _TranslationsTicketNotificationEn._(_root);
}

// Path: venue
class _TranslationsVenueEn extends TranslationsVenueJa {
	_TranslationsVenueEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Venue Map';
	@override String get floor1f => '1F';
	@override String get floor2f => '2F';
}

// Path: auth.guest
class _TranslationsAuthGuestEn extends TranslationsAuthGuestJa {
	_TranslationsAuthGuestEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get signInButton => 'Continue as Guest';
	@override String get userLabel => 'Guest Mode';
}

// Path: auth.error
class _TranslationsAuthErrorEn extends TranslationsAuthErrorJa {
	_TranslationsAuthErrorEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get identityAlreadyExists => 'This Google account is already linked to another user. Please sign out and try signing in again.';
	@override String get sessionExpired => 'Please sign in to your Google Account again.';
}

// Path: common.app
class _TranslationsCommonAppEn extends TranslationsCommonAppJa {
	_TranslationsCommonAppEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'FlutterKaigi 2025';
}

// Path: common.forceUpdate
class _TranslationsCommonForceUpdateEn extends TranslationsCommonForceUpdateJa {
	_TranslationsCommonForceUpdateEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Update Required';
	@override String get message => 'A new version of the app is available. Please update to the latest version.';
	@override String get updateButton => 'Update';
}

// Path: common.action
class _TranslationsCommonActionEn extends TranslationsCommonActionJa {
	_TranslationsCommonActionEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancel';
}

// Path: common.error
class _TranslationsCommonErrorEn extends TranslationsCommonErrorJa {
	_TranslationsCommonErrorEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCommonErrorNotFoundEn notFound = _TranslationsCommonErrorNotFoundEn._(_root);
	@override late final _TranslationsCommonErrorServerEn server = _TranslationsCommonErrorServerEn._(_root);
	@override late final _TranslationsCommonErrorWidgetEn widget = _TranslationsCommonErrorWidgetEn._(_root);
	@override late final _TranslationsCommonErrorGeneralEn general = _TranslationsCommonErrorGeneralEn._(_root);
}

// Path: common.navigation
class _TranslationsCommonNavigationEn extends TranslationsCommonNavigationJa {
	_TranslationsCommonNavigationEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get event => 'Event';
	@override String get session => 'Session';
	@override String get sponsor => 'Sponsor';
	@override String get ticket => 'Ticket';
}

// Path: common.debug
class _TranslationsCommonDebugEn extends TranslationsCommonDebugJa {
	_TranslationsCommonDebugEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Debug';
	@override String get talkerScreen => 'Go to Talker screen';
	@override String get pathRequired => 'Please enter a path';
	@override String get pathMustStartWithSlash => 'Path must start with /';
	@override String get pathCannotContainDebugOrLogin => 'Path cannot contain "debug" or "login"';
	@override String get invalidPath => 'Invalid path';
	@override String get go => 'GO';
}

// Path: event.survey
class _TranslationsEventSurveyEn extends TranslationsEventSurveyJa {
	_TranslationsEventSurveyEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Survey Request';
	@override String get description => 'We would like to hear your opinions to make future FlutterKaigi events better.';
	@override String get button => 'Answer the General Survey';
}

// Path: event.staffMembers
class _TranslationsEventStaffMembersEn extends TranslationsEventStaffMembersJa {
	_TranslationsEventStaffMembersEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Staff';
	@override String get emptyMessage => 'No staff members found';
}

// Path: license.search
class _TranslationsLicenseSearchEn extends TranslationsLicenseSearchJa {
	_TranslationsLicenseSearchEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get hintText => 'Search packages';
}

// Path: license.listTile
class _TranslationsLicenseListTileEn extends TranslationsLicenseListTileJa {
	_TranslationsLicenseListTileEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String description({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'License: ${n} item',
		other: 'License: ${n} items',
	);
}

// Path: news.tile
class _TranslationsNewsTileEn extends TranslationsNewsTileJa {
	_TranslationsNewsTileEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Latest News';
	@override String get subtitle => 'Please check the latest news';
}

// Path: news.screen
class _TranslationsNewsScreenEn extends TranslationsNewsScreenJa {
	_TranslationsNewsScreenEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'News';
}

// Path: news.empty
class _TranslationsNewsEmptyEn extends TranslationsNewsEmptyJa {
	_TranslationsNewsEmptyEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get message => 'No news at this time.';
}

// Path: session.detail
class _TranslationsSessionDetailEn extends TranslationsSessionDetailJa {
	_TranslationsSessionDetailEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get bookmark => 'Bookmark';
}

// Path: session.bookmarked
class _TranslationsSessionBookmarkedEn extends TranslationsSessionBookmarkedJa {
	_TranslationsSessionBookmarkedEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Bookmarked Sessions';
}

// Path: session.empty
class _TranslationsSessionEmptyEn extends TranslationsSessionEmptyJa {
	_TranslationsSessionEmptyEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get message => 'There are no sessions to display.';
}

// Path: session.feedback
class _TranslationsSessionFeedbackEn extends TranslationsSessionFeedbackJa {
	_TranslationsSessionFeedbackEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Feedback';
	@override String get send => 'Send Feedback';
}

// Path: session.survey
class _TranslationsSessionSurveyEn extends TranslationsSessionSurveyJa {
	_TranslationsSessionSurveyEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get button => 'Send Session Feedback';
}

// Path: session.notification
class _TranslationsSessionNotificationEn extends TranslationsSessionNotificationJa {
	_TranslationsSessionNotificationEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get channel_name => 'Session Reminder';
	@override String get channel_description => 'Notification 15 minutes before bookmarked session starts';
	@override String get title => 'Session starts in 15 minutes';
	@override String body({required Object title, required Object venue}) => '${title}\n📍 ${venue}';
}

// Path: ticket.status
class _TranslationsTicketStatusEn extends TranslationsTicketStatusJa {
	_TranslationsTicketStatusEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get purchased => 'Purchased';
	@override String get pending => 'Pending Payment';
	@override String get refunded => 'Refunded';
	@override String get entered => 'Entered';
}

// Path: ticket.loginRequired
class _TranslationsTicketLoginRequiredEn extends TranslationsTicketLoginRequiredJa {
	_TranslationsTicketLoginRequiredEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Please sign in with Google account before purchasing tickets';
	@override String get linkTitle => 'Please link your Google account before purchasing tickets';
	@override String get description => 'Please sign in with your Google account to purchase tickets';
	@override String get appleSignInTitle => 'Ticket purchase not available with Apple Sign In';
	@override String get appleSignInDescription => 'You are currently signed in with Apple. To purchase tickets, please sign out and sign in again with your Google account.';
}

// Path: ticket.notice
class _TranslationsTicketNoticeEn extends TranslationsTicketNoticeJa {
	_TranslationsTicketNoticeEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Notice';
	@override String get message => 'The "Individual Sponsor Ticket" alone does not include admission to FlutterKaigi 2025 (conference venue).\nIf you wish to attend, please purchase an Early Bird Ticket (available until the end of September) or a Regular Ticket separately.\nWe also welcome support from those who want to sponsor FlutterKaigi without attending the event!\n\nThe pre-conference event is exclusive to Early Bird Ticket holders.\nRegular Ticket holders cannot attend the pre-conference event.\n';
}

// Path: ticket.studentRefund
class _TranslationsTicketStudentRefundEn extends TranslationsTicketStudentRefundJa {
	_TranslationsTicketStudentRefundEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Student Refund and Expense Support';
	@override String get description => 'Thanks to our Student Support Sponsors, FlutterKaigi 2025 offers refunds and financial support to students who purchase Early Bird or Regular Tickets.';
	@override String get detailsButton => 'View Details';
	@override String get dialogContent => '🎓 Refund and Expense Support for Students\nWith the support of our Student Support Sponsors, FlutterKaigi 2025 offers refunds and expense support to students who purchase Early Bird or Regular Tickets.\n\n✅ Eligibility for Support\n- Ticket price\n- Travel expenses (with limit)\n- Accommodation expenses (with limit)\n\n🧑‍🎓 Definition of Eligible "Students"\nEligible students are those who can prove enrollment in one of the following:\n- Currently enrolled in an educational institution in Japan or abroad (including elementary school, junior high school, high school, technical college, vocational school, university, graduate school, etc.)\n- Able to present a valid student ID or enrollment certificate, regardless of age or employment status\n\n🎟 Eligibility Requirements\n- Attended FlutterKaigi 2025\n- Participated in networking events with Student Support Sponsors\n- Presented valid student ID or enrollment certificate at reception on the day of the event\n\nYour attendance will be verified by organizers. No advance application is required.\n\n📩 Refund Process\nAfter the event, we will send eligible participants an email with detailed instructions for the refund process.\n\nThe following information will be required:\n- Ticket purchase information\n- Receipts or proof of transportation and accommodation expenses\n- Bank account information for refund\n\n※ No need to submit a copy of your student ID (if already presented on the day of the event)\n※ Maximum amounts and detailed conditions will be explained individually in the notification email\n※ Refunds will be processed after reviewing submitted documents\n\n📌 The information you submit will include personal data. This information will be used solely for verification and processing of refunds and expense support, and will be promptly deleted after the process is complete. By applying for this program, you agree to these terms.\n\n📬 For questions: staff@flutterkaigi.jp\n';
}

// Path: ticket.purchase
class _TranslationsTicketPurchaseEn extends TranslationsTicketPurchaseJa {
	_TranslationsTicketPurchaseEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ticket Purchase';
	@override String get proceed => 'Proceed to Purchase';
	@override String get confirmTitle => 'Confirm Ticket Information';
	@override String get paymentTitle => 'Start Payment';
	@override String get back => 'Back';
	@override String get next => 'Next';
	@override String get startPayment => 'Start Payment';
	@override String get selected => 'Selected';
	@override String get proceedToPayment => 'Proceed to Payment';
	@override String get paymentPageError => 'Could not open payment page';
	@override String get errorOccurred => 'An error occurred';
	@override String get addOption => 'Add this option';
	@override String get optionNotSelling => 'This option is no longer available';
	@override String get optionSoldOut => 'This option is sold out';
	@override String get fewRemaining => 'Limited availability';
	@override String get selling => 'On Sale';
	@override String get soldOut => 'Sold Out';
	@override String get notSelling => 'Sale Ended';
	@override String get optionsAvailable => 'The following options are available for this ticket:';
	@override String get cancel => 'Cancel';
	@override String get unselected => 'Not Selected';
	@override String get price => 'Price';
	@override String get ticket => 'Ticket';
	@override String get additionalOptions => 'Additional Options';
	@override String get total => 'Total';
}

// Path: ticket.qr
class _TranslationsTicketQrEn extends TranslationsTicketQrJa {
	_TranslationsTicketQrEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get scanAtEntry => 'Please scan at entry';
	@override String get ticketType => 'Ticket Type';
	@override String get nameplateId => 'Nameplate ID';
}

// Path: ticket.entryTicket
class _TranslationsTicketEntryTicketEn extends TranslationsTicketEntryTicketJa {
	_TranslationsTicketEntryTicketEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Available Tickets';
	@override String subtitle({required int count}) => 'You have ${count} tickets';
}

// Path: ticket.notification
class _TranslationsTicketNotificationEn extends TranslationsTicketNotificationJa {
	_TranslationsTicketNotificationEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get channel_name => 'Ticket Notifications';
	@override String get channel_description => 'Notifications for ticket status changes';
	@override late final _TranslationsTicketNotificationEntryEn entry = _TranslationsTicketNotificationEntryEn._(_root);
	@override late final _TranslationsTicketNotificationRefundEn refund = _TranslationsTicketNotificationRefundEn._(_root);
}

// Path: common.error.notFound
class _TranslationsCommonErrorNotFoundEn extends TranslationsCommonErrorNotFoundJa {
	_TranslationsCommonErrorNotFoundEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Page not found';
	@override String get message => 'The page you are looking for doesn\'t exist or may have been moved.';
	@override String get backToTop => 'Back to Top';
}

// Path: common.error.server
class _TranslationsCommonErrorServerEn extends TranslationsCommonErrorServerJa {
	_TranslationsCommonErrorServerEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'A server-side issue occurred.';
	@override String get message => 'Please contact FlutterKaigi staff.';
	@override String get retry => 'Retry';
}

// Path: common.error.widget
class _TranslationsCommonErrorWidgetEn extends TranslationsCommonErrorWidgetJa {
	_TranslationsCommonErrorWidgetEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get buildErrorTitle => 'An unexpected error occurred';
	@override String get buildErrorMessage => 'We apologize for the inconvenience.\nAn unexpected error occurred during UI construction.\n\nTo help us resolve this issue, we would greatly appreciate it if you could create a GitHub Issue.\n';
	@override String get buildErrorGitHubButton => 'Open GitHub Issue page';
}

// Path: common.error.general
class _TranslationsCommonErrorGeneralEn extends TranslationsCommonErrorGeneralJa {
	_TranslationsCommonErrorGeneralEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get occurred => 'An error occurred';
}

// Path: ticket.notification.entry
class _TranslationsTicketNotificationEntryEn extends TranslationsTicketNotificationEntryJa {
	_TranslationsTicketNotificationEntryEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Welcome to FlutterKaigi 2025!';
	@override String get body => 'Enjoy FlutterKaigi 2025!';
}

// Path: ticket.notification.refund
class _TranslationsTicketNotificationRefundEn extends TranslationsTicketNotificationRefundJa {
	_TranslationsTicketNotificationRefundEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ticket Refunded';
	@override String get body => 'Your ticket refund has been processed';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		switch (path) {
			case 'auth.guest.signInButton': return 'Continue as Guest';
			case 'auth.guest.userLabel': return 'Guest Mode';
			case 'auth.error.identityAlreadyExists': return 'This Google account is already linked to another user. Please sign out and try signing in again.';
			case 'auth.error.sessionExpired': return 'Please sign in to your Google Account again.';
			case 'common.app.name': return 'FlutterKaigi 2025';
			case 'common.forceUpdate.title': return 'Update Required';
			case 'common.forceUpdate.message': return 'A new version of the app is available. Please update to the latest version.';
			case 'common.forceUpdate.updateButton': return 'Update';
			case 'common.action.cancel': return 'Cancel';
			case 'common.error.notFound.title': return 'Page not found';
			case 'common.error.notFound.message': return 'The page you are looking for doesn\'t exist or may have been moved.';
			case 'common.error.notFound.backToTop': return 'Back to Top';
			case 'common.error.server.title': return 'A server-side issue occurred.';
			case 'common.error.server.message': return 'Please contact FlutterKaigi staff.';
			case 'common.error.server.retry': return 'Retry';
			case 'common.error.widget.buildErrorTitle': return 'An unexpected error occurred';
			case 'common.error.widget.buildErrorMessage': return 'We apologize for the inconvenience.\nAn unexpected error occurred during UI construction.\n\nTo help us resolve this issue, we would greatly appreciate it if you could create a GitHub Issue.\n';
			case 'common.error.widget.buildErrorGitHubButton': return 'Open GitHub Issue page';
			case 'common.error.general.occurred': return 'An error occurred';
			case 'common.navigation.event': return 'Event';
			case 'common.navigation.session': return 'Session';
			case 'common.navigation.sponsor': return 'Sponsor';
			case 'common.navigation.ticket': return 'Ticket';
			case 'common.debug.title': return 'Debug';
			case 'common.debug.talkerScreen': return 'Go to Talker screen';
			case 'common.debug.pathRequired': return 'Please enter a path';
			case 'common.debug.pathMustStartWithSlash': return 'Path must start with /';
			case 'common.debug.pathCannotContainDebugOrLogin': return 'Path cannot contain "debug" or "login"';
			case 'common.debug.invalidPath': return 'Invalid path';
			case 'common.debug.go': return 'GO';
			case 'event.description': return 'Japan\'s Flutter tech conference in 2025. Featuring sessions from developers with deep Flutter and Dart expertise.';
			case 'event.date': return 'November 13, 2025 (Thu)';
			case 'event.time': return '10:00 ~ 18:00';
			case 'event.venue': return 'Otemachi Place Hall & Conference';
			case 'event.address': return '2-3-1 Otemachi, Chiyoda-ku, Tokyo';
			case 'event.survey.title': return 'Survey Request';
			case 'event.survey.description': return 'We would like to hear your opinions to make future FlutterKaigi events better.';
			case 'event.survey.button': return 'Answer the General Survey';
			case 'event.contributors': return 'Contributors';
			case 'event.staffMembers.title': return 'Staff';
			case 'event.staffMembers.emptyMessage': return 'No staff members found';
			case 'event.others': return 'Others';
			case 'event.codeOfConduct': return 'Code of Conduct';
			case 'event.codeOfConductUrl': return 'https://docs.flutterkaigi.jp/Code-of-Conduct';
			case 'event.privacyPolicy': return 'Privacy Policy';
			case 'event.privacyPolicyUrl': return 'https://docs.flutterkaigi.jp/Privacy-Policy';
			case 'event.contact': return 'Contact Us';
			case 'event.contactUrl': return 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';
			case 'event.ossLicenses': return 'OSS Licenses';
			case 'event.sourceCode': return 'View Source Code';
			case 'license.title': return 'Licensees';
			case 'license.search.hintText': return 'Search packages';
			case 'license.listTile.description': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: 'License: ${n} item',
				other: 'License: ${n} items',
			);
			case 'news.tile.title': return 'Latest News';
			case 'news.tile.subtitle': return 'Please check the latest news';
			case 'news.screen.title': return 'News';
			case 'news.empty.message': return 'No news at this time.';
			case 'session.title': return 'Timetable';
			case 'session.detail.bookmark': return 'Bookmark';
			case 'session.bookmarked.title': return 'Bookmarked Sessions';
			case 'session.empty.message': return 'There are no sessions to display.';
			case 'session.feedback.title': return 'Feedback';
			case 'session.feedback.send': return 'Send Feedback';
			case 'session.survey.button': return 'Send Session Feedback';
			case 'session.notification.channel_name': return 'Session Reminder';
			case 'session.notification.channel_description': return 'Notification 15 minutes before bookmarked session starts';
			case 'session.notification.title': return 'Session starts in 15 minutes';
			case 'session.notification.body': return ({required Object title, required Object venue}) => '${title}\n📍 ${venue}';
			case 'sponsor.prText': return 'About Us';
			case 'sponsor.enthusiasm': return 'Message';
			case 'sponsor.company': return 'Sponsors';
			case 'sponsor.individual': return 'Individual Sponsors';
			case 'sponsor.website': return 'Website';
			case 'sponsor.websiteNotSet': return 'No website';
			case 'sponsor.xAccount': return 'X Account';
			case 'sponsor.xAccountNotSet': return 'No X account';
			case 'sponsor.name': return 'Sponsor Name';
			case 'ticket.status.purchased': return 'Purchased';
			case 'ticket.status.pending': return 'Pending Payment';
			case 'ticket.status.refunded': return 'Refunded';
			case 'ticket.status.entered': return 'Entered';
			case 'ticket.options': return 'Options:';
			case 'ticket.purchaseDate': return 'Purchase Date';
			case 'ticket.expiryDate': return 'Expiration Date';
			case 'ticket.noAvailableTickets': return 'No tickets are available for purchase at this time';
			case 'ticket.list': return 'Ticket List';
			case 'ticket.loginRequired.title': return 'Please sign in with Google account before purchasing tickets';
			case 'ticket.loginRequired.linkTitle': return 'Please link your Google account before purchasing tickets';
			case 'ticket.loginRequired.description': return 'Please sign in with your Google account to purchase tickets';
			case 'ticket.loginRequired.appleSignInTitle': return 'Ticket purchase not available with Apple Sign In';
			case 'ticket.loginRequired.appleSignInDescription': return 'You are currently signed in with Apple. To purchase tickets, please sign out and sign in again with your Google account.';
			case 'ticket.notice.title': return 'Notice';
			case 'ticket.notice.message': return 'The "Individual Sponsor Ticket" alone does not include admission to FlutterKaigi 2025 (conference venue).\nIf you wish to attend, please purchase an Early Bird Ticket (available until the end of September) or a Regular Ticket separately.\nWe also welcome support from those who want to sponsor FlutterKaigi without attending the event!\n\nThe pre-conference event is exclusive to Early Bird Ticket holders.\nRegular Ticket holders cannot attend the pre-conference event.\n';
			case 'ticket.studentRefund.title': return 'Student Refund and Expense Support';
			case 'ticket.studentRefund.description': return 'Thanks to our Student Support Sponsors, FlutterKaigi 2025 offers refunds and financial support to students who purchase Early Bird or Regular Tickets.';
			case 'ticket.studentRefund.detailsButton': return 'View Details';
			case 'ticket.studentRefund.dialogContent': return '🎓 Refund and Expense Support for Students\nWith the support of our Student Support Sponsors, FlutterKaigi 2025 offers refunds and expense support to students who purchase Early Bird or Regular Tickets.\n\n✅ Eligibility for Support\n- Ticket price\n- Travel expenses (with limit)\n- Accommodation expenses (with limit)\n\n🧑‍🎓 Definition of Eligible "Students"\nEligible students are those who can prove enrollment in one of the following:\n- Currently enrolled in an educational institution in Japan or abroad (including elementary school, junior high school, high school, technical college, vocational school, university, graduate school, etc.)\n- Able to present a valid student ID or enrollment certificate, regardless of age or employment status\n\n🎟 Eligibility Requirements\n- Attended FlutterKaigi 2025\n- Participated in networking events with Student Support Sponsors\n- Presented valid student ID or enrollment certificate at reception on the day of the event\n\nYour attendance will be verified by organizers. No advance application is required.\n\n📩 Refund Process\nAfter the event, we will send eligible participants an email with detailed instructions for the refund process.\n\nThe following information will be required:\n- Ticket purchase information\n- Receipts or proof of transportation and accommodation expenses\n- Bank account information for refund\n\n※ No need to submit a copy of your student ID (if already presented on the day of the event)\n※ Maximum amounts and detailed conditions will be explained individually in the notification email\n※ Refunds will be processed after reviewing submitted documents\n\n📌 The information you submit will include personal data. This information will be used solely for verification and processing of refunds and expense support, and will be promptly deleted after the process is complete. By applying for this program, you agree to these terms.\n\n📬 For questions: staff@flutterkaigi.jp\n';
			case 'ticket.purchase.title': return 'Ticket Purchase';
			case 'ticket.purchase.proceed': return 'Proceed to Purchase';
			case 'ticket.purchase.confirmTitle': return 'Confirm Ticket Information';
			case 'ticket.purchase.paymentTitle': return 'Start Payment';
			case 'ticket.purchase.back': return 'Back';
			case 'ticket.purchase.next': return 'Next';
			case 'ticket.purchase.startPayment': return 'Start Payment';
			case 'ticket.purchase.selected': return 'Selected';
			case 'ticket.purchase.proceedToPayment': return 'Proceed to Payment';
			case 'ticket.purchase.paymentPageError': return 'Could not open payment page';
			case 'ticket.purchase.errorOccurred': return 'An error occurred';
			case 'ticket.purchase.addOption': return 'Add this option';
			case 'ticket.purchase.optionNotSelling': return 'This option is no longer available';
			case 'ticket.purchase.optionSoldOut': return 'This option is sold out';
			case 'ticket.purchase.fewRemaining': return 'Limited availability';
			case 'ticket.purchase.selling': return 'On Sale';
			case 'ticket.purchase.soldOut': return 'Sold Out';
			case 'ticket.purchase.notSelling': return 'Sale Ended';
			case 'ticket.purchase.optionsAvailable': return 'The following options are available for this ticket:';
			case 'ticket.purchase.cancel': return 'Cancel';
			case 'ticket.purchase.unselected': return 'Not Selected';
			case 'ticket.purchase.price': return 'Price';
			case 'ticket.purchase.ticket': return 'Ticket';
			case 'ticket.purchase.additionalOptions': return 'Additional Options';
			case 'ticket.purchase.total': return 'Total';
			case 'ticket.qr.scanAtEntry': return 'Please scan at entry';
			case 'ticket.qr.ticketType': return 'Ticket Type';
			case 'ticket.qr.nameplateId': return 'Nameplate ID';
			case 'ticket.entryTicket.title': return 'Available Tickets';
			case 'ticket.entryTicket.subtitle': return ({required int count}) => 'You have ${count} tickets';
			case 'ticket.notification.channel_name': return 'Ticket Notifications';
			case 'ticket.notification.channel_description': return 'Notifications for ticket status changes';
			case 'ticket.notification.entry.title': return 'Welcome to FlutterKaigi 2025!';
			case 'ticket.notification.entry.body': return 'Enjoy FlutterKaigi 2025!';
			case 'ticket.notification.refund.title': return 'Ticket Refunded';
			case 'ticket.notification.refund.body': return 'Your ticket refund has been processed';
			case 'venue.title': return 'Venue Map';
			case 'venue.floor1f': return '1F';
			case 'venue.floor2f': return '2F';
			default: return null;
		}
	}
}

