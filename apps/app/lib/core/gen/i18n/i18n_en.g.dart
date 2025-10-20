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
	@override late final _TranslationsAccountEn account = _TranslationsAccountEn._(_root);
}

// Path: account
class _TranslationsAccountEn extends TranslationsAccountJa {
	_TranslationsAccountEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get profileEdit => 'Edit Profile';
	@override String get guestUserLabel => 'Guest Mode';
	@override String get others => 'Others';
	@override String get codeOfConduct => 'Code of Conduct';
	@override String get codeOfConductUrl => 'https://docs.flutterkaigi.jp/Code-of-Conduct';
	@override String get privacyPolicy => 'Privacy Policy';
	@override String get privacyPolicyUrl => 'https://docs.flutterkaigi.jp/Privacy-Policy';
	@override String get contact => 'Contact Us';
	@override String get contactUrl => 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';
	@override String get ossLicenses => 'OSS Licenses';
	@override String get withdrawal => 'Withdrawal Request';
	@override String get logout => 'Sign Out';
	@override String get settings => 'Account Settings';
	@override late final _TranslationsAccountProfileEn profile = _TranslationsAccountProfileEn._(_root);
	@override late final _TranslationsAccountProfileshareEn profileshare = _TranslationsAccountProfileshareEn._(_root);
}

// Path: account.profile
class _TranslationsAccountProfileEn extends TranslationsAccountProfileJa {
	_TranslationsAccountProfileEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profile';
	@override String get editTitle => 'Edit Profile';
	@override String get createInfo => 'Please create profile information';
	@override String get edit => 'Edit Profile';
	@override String get notFound => 'Profile not found';
	@override String get saving => 'Saving...';
	@override String get save => 'Save';
	@override String get saveSuccess => 'Profile saved';
	@override String get saveFailed => 'Failed to save';
	@override String get errorOccurred => 'An error occurred';
	@override String get ageOver20 => '20 or older';
	@override String get ageUnder20 => 'Under 20';
	@override String get nameLabel => 'Name *';
	@override String get nameRequired => 'Please enter your name';
	@override String get nameTooLong => 'Name must be 20 characters or less';
	@override String get upload => 'Upload';
	@override String get delete => 'Delete';
	@override String get snsLinks => 'Social Links';
	@override String get add => 'Add';
	@override late final _TranslationsAccountProfileAvatarEn avatar = _TranslationsAccountProfileAvatarEn._(_root);
	@override late final _TranslationsAccountProfileSnsEn sns = _TranslationsAccountProfileSnsEn._(_root);
	@override late final _TranslationsAccountProfileImageEn image = _TranslationsAccountProfileImageEn._(_root);
}

// Path: account.profileshare
class _TranslationsAccountProfileshareEn extends TranslationsAccountProfileshareJa {
	_TranslationsAccountProfileshareEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profile Exchange';
	@override String get qrCode => 'Show QR Code';
	@override String get qrCodeScan => 'Scan QR Code';
	@override String get friendsList => 'Exchange History';
	@override late final _TranslationsAccountProfileshareQrCodeDisplayEn qrCodeDisplay = _TranslationsAccountProfileshareQrCodeDisplayEn._(_root);
	@override late final _TranslationsAccountProfileshareQrCodeScanScreenEn qrCodeScanScreen = _TranslationsAccountProfileshareQrCodeScanScreenEn._(_root);
	@override late final _TranslationsAccountProfileshareFriendsListScreenEn friendsListScreen = _TranslationsAccountProfileshareFriendsListScreenEn._(_root);
}

// Path: account.profile.avatar
class _TranslationsAccountProfileAvatarEn extends TranslationsAccountProfileAvatarJa {
	_TranslationsAccountProfileAvatarEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get deleteSuccess => 'Avatar removed successfully';
	@override String get changeFailed => 'Could not update avatar';
	@override String get changeSuccess => 'Avatar updated successfully';
}

// Path: account.profile.sns
class _TranslationsAccountProfileSnsEn extends TranslationsAccountProfileSnsJa {
	_TranslationsAccountProfileSnsEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get notLinked => 'No social links registered';
	@override String get type => 'Platform';
	@override String get urlOrUserId => 'URL/User ID';
	@override String get urlOrUserIdRequired => 'Please enter URL/User ID';
	@override String get other => 'Other';
	@override String get fullUrlRequired => 'Please enter full URL';
	@override String get userIdOnly => 'User ID only';
	@override String get alphanumericOnly => 'Only letters, numbers, underscore and hyphen allowed';
	@override late final _TranslationsAccountProfileSnsExamplesEn examples = _TranslationsAccountProfileSnsExamplesEn._(_root);
	@override late final _TranslationsAccountProfileSnsDisplayNamesEn displayNames = _TranslationsAccountProfileSnsDisplayNamesEn._(_root);
}

// Path: account.profile.image
class _TranslationsAccountProfileImageEn extends TranslationsAccountProfileImageJa {
	_TranslationsAccountProfileImageEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get selectTitle => 'Select Image';
	@override String get selectMessage => 'Please select an image';
	@override String get selectButton => 'Select Image';
	@override String get useGooglePhoto => 'Use Google Account Photo';
	@override String get cropTitle => 'Crop Image';
	@override String get complete => 'Complete';
	@override String get crop => 'Crop';
	@override String get reset => 'Reset';
}

// Path: account.profileshare.qrCodeDisplay
class _TranslationsAccountProfileshareQrCodeDisplayEn extends TranslationsAccountProfileshareQrCodeDisplayJa {
	_TranslationsAccountProfileshareQrCodeDisplayEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Show QR Code';
	@override String get description => 'Display your QR code for others to scan';
	@override String get instruction => 'Have others scan this QR code';
}

// Path: account.profileshare.qrCodeScanScreen
class _TranslationsAccountProfileshareQrCodeScanScreenEn extends TranslationsAccountProfileshareQrCodeScanScreenJa {
	_TranslationsAccountProfileshareQrCodeScanScreenEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Scan QR Code';
	@override String get description => 'Scan others\' QR code to exchange profiles';
	@override String get instruction => 'Scan the QR code with your camera';
	@override String get loginRequired => 'Login required';
	@override String get confirmTitle => 'Confirm Profile Share';
	@override String get confirmMessage => 'Share your profile with this user?';
	@override String get cancel => 'Cancel';
	@override String get connect => 'Share';
	@override String get successMessage => 'Profile shared successfully';
	@override String get errorMessage => 'Failed to share profile';
	@override String get scanSuccess => 'QR code scanned successfully';
	@override String get exchangeSuccess => 'Profile exchanged successfully';
	@override String get exchangeFailed => 'Failed to exchange profile';
	@override String get alreadyFriends => 'Already exchanged profiles';
	@override String get invalidQrCode => 'Invalid QR code';
	@override String get cannotExchangeWithSelf => 'Cannot exchange with yourself';
}

// Path: account.profileshare.friendsListScreen
class _TranslationsAccountProfileshareFriendsListScreenEn extends TranslationsAccountProfileshareFriendsListScreenJa {
	_TranslationsAccountProfileshareFriendsListScreenEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Exchange History';
	@override String get emptyMessage => 'No profile exchanges yet';
	@override String get connectedAt => 'Connected at';
	@override String get errorLoadingFriends => 'Failed to load friends list';
	@override String get copiedToClipboard => 'Copied to clipboard';
}

// Path: account.profile.sns.examples
class _TranslationsAccountProfileSnsExamplesEn extends TranslationsAccountProfileSnsExamplesJa {
	_TranslationsAccountProfileSnsExamplesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get github => 'e.g. octocat';
	@override String get x => 'e.g. twitter';
	@override String get discord => 'e.g. 123456789012345678 (User ID)';
	@override String get medium => 'e.g. username';
	@override String get qiita => 'e.g. username';
	@override String get zenn => 'e.g. username';
	@override String get note => 'e.g. username';
}

// Path: account.profile.sns.displayNames
class _TranslationsAccountProfileSnsDisplayNamesEn extends TranslationsAccountProfileSnsDisplayNamesJa {
	_TranslationsAccountProfileSnsDisplayNamesEn._(TranslationsEn root) : this._root = root, super.internal(root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get github => 'GitHub';
	@override String get x => 'X (Twitter)';
	@override String get discord => 'Discord';
	@override String get medium => 'Medium';
	@override String get qiita => 'Qiita';
	@override String get zenn => 'Zenn';
	@override String get note => 'note';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
/// Note: We use a HashMap because Dart seems to be unable to compile large switch statements.
Map<String, dynamic>? _map;

extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		final map = _map ?? _initFlatMap();
		return map[path];
	}

	/// Initializes the flat map and returns it.
	Map<String, dynamic> _initFlatMap() {
		final map = <String, dynamic>{};
		map['account.profileEdit'] = 'Edit Profile';
		map['account.guestUserLabel'] = 'Guest Mode';
		map['account.others'] = 'Others';
		map['account.codeOfConduct'] = 'Code of Conduct';
		map['account.codeOfConductUrl'] = 'https://docs.flutterkaigi.jp/Code-of-Conduct';
		map['account.privacyPolicy'] = 'Privacy Policy';
		map['account.privacyPolicyUrl'] = 'https://docs.flutterkaigi.jp/Privacy-Policy';
		map['account.contact'] = 'Contact Us';
		map['account.contactUrl'] = 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';
		map['account.ossLicenses'] = 'OSS Licenses';
		map['account.withdrawal'] = 'Withdrawal Request';
		map['account.logout'] = 'Sign Out';
		map['account.settings'] = 'Account Settings';
		map['account.profile.title'] = 'Profile';
		map['account.profile.editTitle'] = 'Edit Profile';
		map['account.profile.createInfo'] = 'Please create profile information';
		map['account.profile.edit'] = 'Edit Profile';
		map['account.profile.notFound'] = 'Profile not found';
		map['account.profile.saving'] = 'Saving...';
		map['account.profile.save'] = 'Save';
		map['account.profile.saveSuccess'] = 'Profile saved';
		map['account.profile.saveFailed'] = 'Failed to save';
		map['account.profile.errorOccurred'] = 'An error occurred';
		map['account.profile.ageOver20'] = '20 or older';
		map['account.profile.ageUnder20'] = 'Under 20';
		map['account.profile.nameLabel'] = 'Name *';
		map['account.profile.nameRequired'] = 'Please enter your name';
		map['account.profile.nameTooLong'] = 'Name must be 20 characters or less';
		map['account.profile.upload'] = 'Upload';
		map['account.profile.delete'] = 'Delete';
		map['account.profile.snsLinks'] = 'Social Links';
		map['account.profile.add'] = 'Add';
		map['account.profile.avatar.deleteSuccess'] = 'Avatar removed successfully';
		map['account.profile.avatar.changeFailed'] = 'Could not update avatar';
		map['account.profile.avatar.changeSuccess'] = 'Avatar updated successfully';
		map['account.profile.sns.notLinked'] = 'No social links registered';
		map['account.profile.sns.type'] = 'Platform';
		map['account.profile.sns.urlOrUserId'] = 'URL/User ID';
		map['account.profile.sns.urlOrUserIdRequired'] = 'Please enter URL/User ID';
		map['account.profile.sns.other'] = 'Other';
		map['account.profile.sns.fullUrlRequired'] = 'Please enter full URL';
		map['account.profile.sns.userIdOnly'] = 'User ID only';
		map['account.profile.sns.alphanumericOnly'] = 'Only letters, numbers, underscore and hyphen allowed';
		map['account.profile.sns.examples.github'] = 'e.g. octocat';
		map['account.profile.sns.examples.x'] = 'e.g. twitter';
		map['account.profile.sns.examples.discord'] = 'e.g. 123456789012345678 (User ID)';
		map['account.profile.sns.examples.medium'] = 'e.g. username';
		map['account.profile.sns.examples.qiita'] = 'e.g. username';
		map['account.profile.sns.examples.zenn'] = 'e.g. username';
		map['account.profile.sns.examples.note'] = 'e.g. username';
		map['account.profile.sns.displayNames.github'] = 'GitHub';
		map['account.profile.sns.displayNames.x'] = 'X (Twitter)';
		map['account.profile.sns.displayNames.discord'] = 'Discord';
		map['account.profile.sns.displayNames.medium'] = 'Medium';
		map['account.profile.sns.displayNames.qiita'] = 'Qiita';
		map['account.profile.sns.displayNames.zenn'] = 'Zenn';
		map['account.profile.sns.displayNames.note'] = 'note';
		map['account.profile.image.selectTitle'] = 'Select Image';
		map['account.profile.image.selectMessage'] = 'Please select an image';
		map['account.profile.image.selectButton'] = 'Select Image';
		map['account.profile.image.useGooglePhoto'] = 'Use Google Account Photo';
		map['account.profile.image.cropTitle'] = 'Crop Image';
		map['account.profile.image.complete'] = 'Complete';
		map['account.profile.image.crop'] = 'Crop';
		map['account.profile.image.reset'] = 'Reset';
		map['account.profileshare.title'] = 'Profile Exchange';
		map['account.profileshare.qrCode'] = 'Show QR Code';
		map['account.profileshare.qrCodeScan'] = 'Scan QR Code';
		map['account.profileshare.friendsList'] = 'Exchange History';
		map['account.profileshare.qrCodeDisplay.title'] = 'Show QR Code';
		map['account.profileshare.qrCodeDisplay.description'] = 'Display your QR code for others to scan';
		map['account.profileshare.qrCodeDisplay.instruction'] = 'Have others scan this QR code';
		map['account.profileshare.qrCodeScanScreen.title'] = 'Scan QR Code';
		map['account.profileshare.qrCodeScanScreen.description'] = 'Scan others\' QR code to exchange profiles';
		map['account.profileshare.qrCodeScanScreen.instruction'] = 'Scan the QR code with your camera';
		map['account.profileshare.qrCodeScanScreen.loginRequired'] = 'Login required';
		map['account.profileshare.qrCodeScanScreen.confirmTitle'] = 'Confirm Profile Share';
		map['account.profileshare.qrCodeScanScreen.confirmMessage'] = 'Share your profile with this user?';
		map['account.profileshare.qrCodeScanScreen.cancel'] = 'Cancel';
		map['account.profileshare.qrCodeScanScreen.connect'] = 'Share';
		map['account.profileshare.qrCodeScanScreen.successMessage'] = 'Profile shared successfully';
		map['account.profileshare.qrCodeScanScreen.errorMessage'] = 'Failed to share profile';
		map['account.profileshare.qrCodeScanScreen.scanSuccess'] = 'QR code scanned successfully';
		map['account.profileshare.qrCodeScanScreen.exchangeSuccess'] = 'Profile exchanged successfully';
		map['account.profileshare.qrCodeScanScreen.exchangeFailed'] = 'Failed to exchange profile';
		map['account.profileshare.qrCodeScanScreen.alreadyFriends'] = 'Already exchanged profiles';
		map['account.profileshare.qrCodeScanScreen.invalidQrCode'] = 'Invalid QR code';
		map['account.profileshare.qrCodeScanScreen.cannotExchangeWithSelf'] = 'Cannot exchange with yourself';
		map['account.profileshare.friendsListScreen.title'] = 'Exchange History';
		map['account.profileshare.friendsListScreen.emptyMessage'] = 'No profile exchanges yet';
		map['account.profileshare.friendsListScreen.connectedAt'] = 'Connected at';
		map['account.profileshare.friendsListScreen.errorLoadingFriends'] = 'Failed to load friends list';
		map['account.profileshare.friendsListScreen.copiedToClipboard'] = 'Copied to clipboard';

		_map = map;
		return map;
	}
}

