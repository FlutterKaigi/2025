import 'package:auth_client/auth_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

/// 認証機能を無効化したAuthNotifier
/// 最小限の実装のみを残しています
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  Stream<User?> build() async* {
    yield null;
  }

  /// 認証機能は無効化されています
  Future<User?> signInWithGoogle() async {
    throw UnimplementedError('');
  }

  /// 認証機能は無効化されています
  Future<User?> signInWithApple() async {
    throw UnimplementedError('');
  }

  /// 認証機能は無効化されています
  Future<void> linkAnonymousUserWithGoogle() async {
    throw UnimplementedError('');
  }

  /// 認証機能は無効化されています
  Future<void> signOut() async {
    // 何もしない
  }

  /// 認証機能は無効化されています
  Future<String?> getAccessToken() async {
    return null;
  }

  /// 認証機能は無効化されています
  bool isGoogleSessionExpired() {
    return false;
  }
}
