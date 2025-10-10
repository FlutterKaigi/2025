import 'package:app/features/auth/data/provider/auth_service.dart';
import 'package:auth_client/auth_client.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  bool _isExplicitSignOut = false;

  @override
  Stream<firebase_auth.User?> build() async* {
    final authService = ref.watch(authServiceProvider);

    // 初期化時に未認証の場合で、明示的なログアウト状態でなければ自動的にゲストログインを実行
    final currentUser = authService.currentUser;
    if (currentUser == null && !_isExplicitSignOut) {
      await authService.signInAnonymously();
    } else if (_isExplicitSignOut) {
      yield null;
    } else {}

    // Supabaseの認証状態変更を継続的に監視
    await for (final event in authService.authStateChangeStream()) {
      if (_isExplicitSignOut && event != AuthStateEvent.signedOut) {
        // 明示的ログアウト状態の場合は、ログアウトイベント以外は無視
        continue;
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    return ref.read(authServiceProvider).signInWithGoogle();
  }

  Future<void> signInAnonymously() async {
    return ref.read(authServiceProvider).signInAnonymously();
  }

  Future<void> linkAnonymousUserWithGoogle() async {
    await ref.read(authServiceProvider).linkAnonymousUserWithGoogle();
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
    return FirebaseAuth.instance.currentUser?.getIdToken();
  }

  bool isGoogleSessionExpired() {
    final authService = ref.read(authServiceProvider);
    final currentUser = authService.currentUser;

    // Googleユーザーでセッションが切れている場合
    if (currentUser != null &&
        !currentUser.isAnonymous &&
        currentUser.isAnonymous) {
      return true;
    }
    return false;
  }
}
