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
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return _flatMapFunction$0(path);
	}

	dynamic _flatMapFunction$0(String path) {
		switch (path) {
			case 'account.profileEdit': return 'Edit Profile';
			case 'account.guestUserLabel': return 'Guest Mode';
			case 'account.others': return 'Others';
			case 'account.codeOfConduct': return 'Code of Conduct';
			case 'account.codeOfConductUrl': return 'https://docs.flutterkaigi.jp/Code-of-Conduct';
			case 'account.privacyPolicy': return 'Privacy Policy';
			case 'account.privacyPolicyUrl': return 'https://docs.flutterkaigi.jp/Privacy-Policy';
			case 'account.contact': return 'Contact Us';
			case 'account.contactUrl': return 'https://docs.google.com/forms/d/e/1FAIpQLSemYPFEWpP8594MWI4k3Nz45RJzMS7pz1ufwtnX4t3V7z2TOw/viewform';
			case 'account.ossLicenses': return 'OSS Licenses';
			case 'account.withdrawal': return 'Withdrawal Request';
			case 'account.logout': return 'Sign Out';
			case 'account.settings': return 'Account Settings';
			case 'account.profile.title': return 'Profile';
			case 'account.profile.editTitle': return 'Edit Profile';
			case 'account.profile.createInfo': return 'Please create profile information';
			case 'account.profile.edit': return 'Edit Profile';
			case 'account.profile.notFound': return 'Profile not found';
			case 'account.profile.saving': return 'Saving...';
			case 'account.profile.save': return 'Save';
			case 'account.profile.saveSuccess': return 'Profile saved';
			case 'account.profile.saveFailed': return 'Failed to save';
			case 'account.profile.errorOccurred': return 'An error occurred';
			case 'account.profile.ageOver20': return '20 or older';
			case 'account.profile.ageUnder20': return 'Under 20';
			case 'account.profile.nameLabel': return 'Name *';
			case 'account.profile.nameRequired': return 'Please enter your name';
			case 'account.profile.nameTooLong': return 'Name must be 20 characters or less';
			case 'account.profile.upload': return 'Upload';
			case 'account.profile.delete': return 'Delete';
			case 'account.profile.snsLinks': return 'Social Links';
			case 'account.profile.add': return 'Add';
			case 'account.profile.avatar.deleteSuccess': return 'Avatar removed successfully';
			case 'account.profile.avatar.changeFailed': return 'Could not update avatar';
			case 'account.profile.avatar.changeSuccess': return 'Avatar updated successfully';
			case 'account.profile.sns.notLinked': return 'No social links registered';
			case 'account.profile.sns.type': return 'Platform';
			case 'account.profile.sns.urlOrUserId': return 'URL/User ID';
			case 'account.profile.sns.urlOrUserIdRequired': return 'Please enter URL/User ID';
			case 'account.profile.sns.other': return 'Other';
			case 'account.profile.sns.fullUrlRequired': return 'Please enter full URL';
			case 'account.profile.sns.userIdOnly': return 'User ID only';
			case 'account.profile.sns.alphanumericOnly': return 'Only letters, numbers, underscore and hyphen allowed';
			case 'account.profile.sns.examples.github': return 'e.g. octocat';
			case 'account.profile.sns.examples.x': return 'e.g. twitter';
			case 'account.profile.sns.examples.discord': return 'e.g. 123456789012345678 (User ID)';
			case 'account.profile.sns.examples.medium': return 'e.g. username';
			case 'account.profile.sns.examples.qiita': return 'e.g. username';
			case 'account.profile.sns.examples.zenn': return 'e.g. username';
			case 'account.profile.sns.examples.note': return 'e.g. username';
			case 'account.profile.sns.displayNames.github': return 'GitHub';
			case 'account.profile.sns.displayNames.x': return 'X (Twitter)';
			case 'account.profile.sns.displayNames.discord': return 'Discord';
			case 'account.profile.sns.displayNames.medium': return 'Medium';
			case 'account.profile.sns.displayNames.qiita': return 'Qiita';
			case 'account.profile.sns.displayNames.zenn': return 'Zenn';
			case 'account.profile.sns.displayNames.note': return 'note';
			case 'account.profile.image.selectTitle': return 'Select Image';
			case 'account.profile.image.selectMessage': return 'Please select an image';
			case 'account.profile.image.selectButton': return 'Select Image';
			case 'account.profile.image.useGooglePhoto': return 'Use Google Account Photo';
			case 'account.profile.image.cropTitle': return 'Crop Image';
			case 'account.profile.image.complete': return 'Complete';
			case 'account.profile.image.crop': return 'Crop';
			case 'account.profile.image.reset': return 'Reset';
			case 'account.profileshare.title': return 'Profile Exchange';
			case 'account.profileshare.qrCode': return 'Show QR Code';
			case 'account.profileshare.qrCodeScan': return 'Scan QR Code';
			case 'account.profileshare.friendsList': return 'Exchange History';
			case 'account.profileshare.qrCodeDisplay.title': return 'Show QR Code';
			case 'account.profileshare.qrCodeDisplay.description': return 'Display your QR code for others to scan';
			case 'account.profileshare.qrCodeDisplay.instruction': return 'Have others scan this QR code';
			case 'account.profileshare.qrCodeScanScreen.title': return 'Scan QR Code';
			case 'account.profileshare.qrCodeScanScreen.description': return 'Scan others\' QR code to exchange profiles';
			case 'account.profileshare.qrCodeScanScreen.instruction': return 'Scan the QR code with your camera';
			case 'account.profileshare.qrCodeScanScreen.loginRequired': return 'Login required';
			case 'account.profileshare.qrCodeScanScreen.successMessage': return 'Profile shared successfully';
			case 'account.profileshare.qrCodeScanScreen.errorMessage': return 'Failed to share profile';
			case 'account.profileshare.qrCodeScanScreen.scanSuccess': return 'QR code scanned successfully';
			case 'account.profileshare.qrCodeScanScreen.exchangeSuccess': return 'Profile exchanged successfully';
			case 'account.profileshare.qrCodeScanScreen.exchangeFailed': return 'Failed to exchange profile';
			case 'account.profileshare.qrCodeScanScreen.alreadyFriends': return 'Already exchanged profiles';
			case 'account.profileshare.qrCodeScanScreen.invalidQrCode': return 'Invalid QR code';
			case 'account.profileshare.qrCodeScanScreen.cannotExchangeWithSelf': return 'Cannot exchange with yourself';
			case 'account.profileshare.friendsListScreen.title': return 'Exchange History';
			case 'account.profileshare.friendsListScreen.emptyMessage': return 'No profile exchanges yet';
			case 'account.profileshare.friendsListScreen.connectedAt': return 'Connected at';
			case 'account.profileshare.friendsListScreen.errorLoadingFriends': return 'Failed to load friends list';
			case 'account.profileshare.friendsListScreen.copiedToClipboard': return 'Copied to clipboard';
			default: return null;
		}
	}
}

