import 'package:app/core/provider/environment.dart';
import 'package:app/features/auth/data/provider/auth_service.dart';
import 'package:app/features/auth/data/provider/google_auth_client_id.dart';
import 'package:auth_client/auth_client.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  Stream<User?> build() async* {
    final authService = ref.watch(authServiceProvider);
    yield authService.currentUser;

    // Supabaseの認証状態変更を継続的に監視
    await for (final _ in authService.authStateChangeStream()) {
      yield authService.currentUser;
    }
  }

  AuthenticationPlatform get platform => kIsWeb
      ? AuthenticationPlatform.web
      : switch (defaultTargetPlatform) {
          TargetPlatform.android => AuthenticationPlatform.android,
          TargetPlatform.iOS => AuthenticationPlatform.ios,
          TargetPlatform.macOS => AuthenticationPlatform.ios,
          _ => throw UnimplementedError(
            'Unsupported platform: $defaultTargetPlatform',
          ),
        };

  Future<User?> signInWithGoogle() async {
    final environment = ref.read(environmentProvider);
    final redirectTo = _getRedirectTo(environment);
    return ref
        .read(authServiceProvider)
        .signInWithGoogle(
          redirectTo: redirectTo,
          platform: platform,
          webClientId: ref.watch(googleAuthWebClientIdProvider),
          platformClientId: ref.watch(googleAuthClientIdProvider),
        );
  }

  Future<User?> signInWithApple() async =>
      ref.read(authServiceProvider).signInWithApple();

  Future<void> linkAnonymousUserWithGoogle() async {
    final environment = ref.read(environmentProvider);
    final redirectTo = _getRedirectTo(environment);
    await ref
        .read(authServiceProvider)
        .linkAnonymousUserWithGoogle(
          platform: platform,
          webClientId: ref.watch(googleAuthWebClientIdProvider),
          platformClientId: ref.watch(googleAuthClientIdProvider),
          redirectTo: redirectTo,
        );
  }

  Future<void> signOut() async {
    await ref.read(authServiceProvider).signOut();
  }

  Future<String?> getAccessToken() async {
    final authService = ref.read(authServiceProvider);
    final session = authService.currentSession;
    if (session == null) {
      return null;
    }
    final currentUser = authService.currentUser;
    final isExpired = session.isExpired;
    if (isExpired) {
      // Google認証のセッション切れの場合
      if (currentUser != null && !currentUser.isAnonymous) {
        // セッション切れエラーとしてnullを返す（後続処理でログイン画面へ遷移）
        return null;
      }
      // ゲストユーザーのセッション切れの場合はリフレッシュ
      final response = await authService.refreshSession();
      return response.session?.accessToken;
    }
    return session.accessToken;
  }

  bool isGoogleSessionExpired() {
    final authService = ref.read(authServiceProvider);
    final currentUser = authService.currentUser;
    final session = authService.currentSession;

    // Googleユーザーでセッションが切れている場合
    if (currentUser != null &&
        !currentUser.isAnonymous &&
        (session == null || session.isExpired)) {
      return true;
    }
    return false;
  }

  String _getRedirectTo(Environment environment) {
    // Webプラットフォームの場合は `scheme://host:port` を使用
    if (kIsWeb) {
      return Uri.base.origin;
    }
    // モバイルプラットフォームの場合は従来のカスタムスキームを使用
    return 'jp.flutterkaigi.conf2025${environment.appIdSuffix}://login-callback';
  }
}
