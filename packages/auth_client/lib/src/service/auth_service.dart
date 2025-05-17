import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  /// Supabaseを初期化する。
  /// この関数を呼び出す前に`WidgetsFlutterBinding.ensureInitialized()`を呼び出す必要がある。
  Future<Supabase> initialize({
    required String supabaseUrl,
    required String supabaseKey,
    bool isDebug = false,
  }) async => Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    debug: isDebug,
  );

  /// `initialize`を呼び出した後に使用できる。
  SupabaseClient get _client => Supabase.instance.client;

  /// Googleでログインする
  /// [redirectTo] ログイン後にリダイレクトするURL Web以外のプラットフォームでは必須
  /// [authScreenLaunchMode] 認証画面の起動モード
  Future<User?> signInWithGoogle({
    String? redirectTo,
    LaunchMode authScreenLaunchMode = LaunchMode.externalApplication,
  }) async {
    await _client.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: redirectTo,
      authScreenLaunchMode: authScreenLaunchMode,
    );
    return currentUser();
  }

  /// ログアウトする
  Future<void> signOut() async => _client.auth.signOut();

  /// 現在のユーザーを取得する
  User? currentUser() => _client.auth.currentUser;

  /// 認証状態の変化を監視する
  Stream<AuthStateEvent> authStateChangeStream() =>
      _client.auth.onAuthStateChange.map((event) {
        return switch (event.event) {
          AuthChangeEvent.initialSession => AuthStateEvent.initialSession,
          AuthChangeEvent.signedIn => AuthStateEvent.signedIn,
          AuthChangeEvent.signedOut => AuthStateEvent.signedOut,
          AuthChangeEvent.tokenRefreshed => AuthStateEvent.tokenRefreshed,
          AuthChangeEvent.userUpdated => AuthStateEvent.userUpdated,
          _ =>
            throw UnimplementedError(
              'Unknown auth state event: ${event.event}',
            ),
        };
      });
}

enum AuthStateEvent {
  initialSession,
  signedIn,
  signedOut,
  tokenRefreshed,
  userUpdated,
}
