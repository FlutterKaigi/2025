import 'package:app/core/provider/environment.dart';
import 'package:app/features/auth/data/provider/auth_service.dart';
import 'package:auth_client/auth_client.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  bool _isExplicitSignOut = false;

  @override
  Stream<User?> build() async* {
    final authService = ref.watch(authServiceProvider);

    // 初期化時に未認証の場合で、明示的なログアウト状態でなければ自動的にゲストログインを実行
    final currentUser = authService.currentUser;
    if (currentUser == null && !_isExplicitSignOut) {
      final user = await authService.signInAnonymously();
      yield user;
    } else {
      yield currentUser;
    }
  }

  Future<User?> signInWithGoogle() async {
    final environment = ref.read(environmentProvider);
    final redirectTo = _getRedirectTo(environment);
    return ref
        .read(authServiceProvider)
        .signInWithGoogle(redirectTo: redirectTo);
  }

  Future<User?> signInAnonymously() async {
    return ref.read(authServiceProvider).signInAnonymously();
  }

  Future<void> linkAnonymousUserWithGoogle() async {
    final environment = ref.read(environmentProvider);
    final redirectTo = _getRedirectTo(environment);
    await ref
        .read(authServiceProvider)
        .linkAnonymousUserWithGoogle(redirectTo: redirectTo);
  }

  Future<void> signOut() async {
    _isExplicitSignOut = true;
    await ref.read(authServiceProvider).signOut();
    // 明示的なログアウト状態をリセット（次回の初期化で自動ログインできるように）
    // ログイン画面でユーザーが操作するまで待つため、少し長めの遅延
    Future.delayed(const Duration(seconds: 1), () {
      _isExplicitSignOut = false;
    });
  }

  Future<String?> getAccessToken() async {
    final authService = ref.read(authServiceProvider);
    final session = authService.currentSession;
    if (session == null) {
      // セッションがない場合は自動的にゲストログイン
      final user = await authService.signInAnonymously();
      if (user != null) {
        // ゲストログイン後、セッションを取得
        final newSession = authService.currentSession;
        return newSession?.accessToken;
      }
      return null;
    }
    final isExpired = session.isExpired;
    if (isExpired) {
      final currentUser = authService.currentUser;
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

@Riverpod(keepAlive: true)
Stream<AuthStateEvent> _authStateChangeStream(Ref ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChangeStream();
}
