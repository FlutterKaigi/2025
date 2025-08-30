import 'package:app/core/provider/environment.dart';
import 'package:app/features/account/ui/info/account_info_screen.dart';
import 'package:app/features/auth/data/notifier/auth_notifier.dart';
import 'package:auth_client/auth_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'AccountInfoScreen',
  type: AccountInfoScreen,
  path: '[Feature]/account',
)
Widget accountInfoScreenUseCase(BuildContext context) {
  final isAuthenticated = context.knobs.boolean(
    label: '認証状態',
    initialValue: true,
  );

  final mockAuthNotifier = _MockAuthNotifier(
    isAuthenticated ? _mockUser : null,
  );

  return ProviderScope(
    overrides: [
      authNotifierProvider.overrideWith(() => mockAuthNotifier),
      environmentProvider.overrideWithValue(
        const Environment(
          appIdSuffix: '.dev',
          appName: 'FlutterKaigi Dashboard',
          flavor: 'dev',
          bffBaseUrl: '',
          supabaseUrl: '',
          supabaseKey: '',
        ),
      ),
    ],
    child: AccountInfoScreen(
      onProfileEdit: () {},
      onTapCodeOfConductTile: () {},
      onTapPrivacyPolicyTile: () {},
      onTapContactTile: () {},
      onTapOssLicensesTile: () {},
    ),
  );
}

// ダミーユーザーデータ
final _mockUser = User(
  id: 'test-user-id',
  appMetadata: {},
  userMetadata: {
    'full_name': 'テスト 太郎',
    'avatar_url':
        'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
  },
  aud: 'authenticated',
  createdAt: DateTime.now().toIso8601String(),
  updatedAt: DateTime.now().toIso8601String(),
  email: 'test@example.com',
);

// Widgetbook用のモックAuthNotifier
class _MockAuthNotifier extends AuthNotifier {
  _MockAuthNotifier(this.mockUser);

  final User? mockUser;

  @override
  Stream<User?> build() {
    return Stream.value(mockUser);
  }

  @override
  Future<User?> signInWithGoogle() async {
    return mockUser;
  }

  @override
  Future<void> signOut() async {}
}
