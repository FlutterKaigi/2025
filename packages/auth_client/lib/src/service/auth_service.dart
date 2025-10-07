import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
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

  Future<User?> signInWithGoogle({
    required bool useNative,
    String? redirectTo,
    LaunchMode authScreenLaunchMode = LaunchMode.externalApplication,
  }) async {
    if (useNative) {
      return _signInWithGoogleNative();
    } else {
      return _signInWithGoogle(
        redirectTo: redirectTo,
        authScreenLaunchMode: authScreenLaunchMode,
      );
    }
  }

  /// Googleでログインする
  /// [redirectTo] ログイン後にリダイレクトするURL Web以外のプラットフォームでは必須
  /// [authScreenLaunchMode] 認証画面の起動モード
  Future<User?> _signInWithGoogle({
    String? redirectTo,
    LaunchMode authScreenLaunchMode = LaunchMode.externalApplication,
  }) async {
    await _client.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: redirectTo,
      authScreenLaunchMode: authScreenLaunchMode,
    );
    return currentUser;
  }

  Future<User?> _signInWithGoogleNative() async {
    final (googleUser, authorization) = await _authenticateWithGoogleNative();
    final idToken = googleUser.authentication.idToken!;
    await _client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: authorization.accessToken,
    );
    return null;
  }

  Future<(GoogleSignInAccount, GoogleSignInClientAuthorization)>
  _authenticateWithGoogleNative() async {
    const webClientId =
        // ignore: lines_longer_than_80_chars
        '106402217021-p95ju7d3noudgv25snerp3qg1usgm7mv.apps.googleusercontent.com';
    const iosClientId =
        // ignore: lines_longer_than_80_chars
        '106402217021-ql2va8nvujbqigkdqmoiiu4v0sgjbf4u.apps.googleusercontent.com';
    // ignore: lines_longer_than_80_chars
    const androidClientId =
        '106402217021-8b4egl8ss9v3jroesh8qbp7ttb6nhuin.apps.googleusercontent.com';
    final scopes = ['email', 'profile'];
    final googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize(
      serverClientId: webClientId,
      clientId: Platform.isAndroid ? androidClientId : iosClientId,
    );
    final googleUser = await googleSignIn.authenticate();
    final authorization =
        await googleUser.authorizationClient.authorizationForScopes(scopes) ??
        await googleUser.authorizationClient.authorizeScopes(scopes);
    final idToken = googleUser.authentication.idToken;
    if (idToken == null) {
      throw const AuthException('No ID Token found.');
    }
    return (googleUser, authorization);
  }

  /// 匿名でログインする
  Future<User?> signInAnonymously() async {
    await _client.auth.signInAnonymously();
    return currentUser;
  }

  /// 匿名ユーザーをGoogleアカウントと紐づける
  Future<void> linkAnonymousUserWithGoogle({
    String? redirectTo,
    LaunchMode authScreenLaunchMode = LaunchMode.externalApplication,
  }) async {
    final (googleUser, authorization) = await _authenticateWithGoogleNative();
    final idToken = googleUser.authentication.idToken!;
    await _client.auth.linkIdentityWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: authorization.accessToken,
    );
  }

  /// ログアウトする
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn.instance;
    await googleSignIn.signOut();
    return _client.auth.signOut();
  }

  /// 現在のユーザーを取得する
  User? get currentUser => _client.auth.currentUser;

  Session? get currentSession => _client.auth.currentSession;

  Future<AuthResponse> refreshSession() => _client.auth.refreshSession();

  /// 認証状態の変化を監視する
  Stream<AuthStateEvent> authStateChangeStream() =>
      _client.auth.onAuthStateChange.map((event) {
        return switch (event.event) {
          AuthChangeEvent.initialSession => AuthStateEvent.initialSession,
          AuthChangeEvent.signedIn => AuthStateEvent.signedIn,
          AuthChangeEvent.signedOut => AuthStateEvent.signedOut,
          AuthChangeEvent.tokenRefreshed => AuthStateEvent.tokenRefreshed,
          AuthChangeEvent.userUpdated => AuthStateEvent.userUpdated,
          _ => throw UnimplementedError(
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
