import 'package:app/core/provider/environment.dart';
import 'package:app/features/account/data/notifier/profile_notifier.dart';
import 'package:app/features/account/ui/info/account_info_screen.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:auth_client/auth_client.dart';
import 'package:bff_client/bff_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AccountInfoScreen',
  type: AccountInfoScreen,
  path: '[Feature]/account',
)
Widget accountInfoScreenUseCase(BuildContext context) {
  final mockAuthNotifier = _MockAuthNotifier(
    null,
  );

  final mockProfileNotifier = _MockProfileNotifier(
    null,
  );

  return ProviderScope(
    overrides: [
      authNotifierProvider.overrideWith(() => mockAuthNotifier),
      profileNotifierProvider.overrideWith(() => mockProfileNotifier),
      environmentProvider.overrideWithValue(
        const Environment(
          appIdSuffix: '.dev',
          appName: 'FlutterKaigi',
          flavor: 'dev',
          bffBaseUrl: '',
          supabaseUrl: '',
          supabaseKey: '',
          withdrawalFormUrl: '',
        ),
      ),
    ],
    child: AccountInfoScreen(
      onProfileEdit: () {},
      onTapCodeOfConductTile: () {},
      onTapPrivacyPolicyTile: () {},
      onTapContactTile: () {},
      onTapOssLicensesTile: () {},
      onTapWithdrawalTile: () {},
    ),
  );
}

// Widgetbook用のモックAuthNotifier
class _MockAuthNotifier extends AuthNotifier {
  _MockAuthNotifier(this.mockUser);

  final User? mockUser;

  @override
  Stream<User?> build() {
    return Stream.value(mockUser);
  }

  @override
  Future<void> signOut() async {}
}

class _MockProfileNotifier extends ProfileNotifier {
  _MockProfileNotifier(this.mockProfile);

  final ProfileResponse? mockProfile;

  @override
  Future<ProfileResponse?> build() async {
    return mockProfile;
  }
}
