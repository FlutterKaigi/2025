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

  /// Googleでログインする
  Future<User?> signInWithGoogle({
    required AuthenticationPlatform platform,
    required String webClientId,
    String? platformClientId,
    String? redirectTo,
  }) async {
    // platform != .web の時は、platformClientIdが必須
    assert(
      platform == AuthenticationPlatform.web || platformClientId != null,
      'platformClientId is required when platform is not web',
    );
    if (platform == AuthenticationPlatform.web) {
      await _client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: redirectTo,
        authScreenLaunchMode: LaunchMode.externalApplication,
      );
      return currentUser;
    } else {
      final (idToken, accessToken) = await _nativeGoogleSignIn(
        platformClientId: platformClientId!,
        webClientId: webClientId,
      );

      final result = await _client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      return result.user;
    }
  }

  /// Googleでログインする
  Future<User?> linkAnonymousUserWithGoogle({
    required AuthenticationPlatform platform,
    required String webClientId,
    String? platformClientId,
    String? redirectTo,
  }) async {
    if (platform == AuthenticationPlatform.web) {
      await _client.auth.linkIdentity(
        OAuthProvider.google,
        redirectTo: redirectTo,
        authScreenLaunchMode: LaunchMode.externalApplication,
      );
      return currentUser;
    } else {
      final (idToken, accessToken) = await _nativeGoogleSignIn(
        platformClientId: platformClientId!,
        webClientId: webClientId,
      );

      final result = await _client.auth.linkIdentityWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      return result.user;
    }
  }

  Future<(String idToken, String accessToken)> _nativeGoogleSignIn({
    required String platformClientId,
    required String webClientId,
  }) async {
    final scopes = ['email', 'profile'];
    final googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize(
      serverClientId: webClientId,
      clientId: platformClientId,
    );
    final googleUser = await googleSignIn.authenticate(
      scopeHint: scopes,
    );
    final authorization =
        await googleUser.authorizationClient.authorizationForScopes(scopes) ??
        await googleUser.authorizationClient.authorizeScopes(scopes);
    final idToken = googleUser.authentication.idToken;
    if (idToken == null) {
      throw const AuthException('No ID Token found.');
    }
    return (idToken, authorization.accessToken);
  }

  /// 匿名でログインする
  Future<User?> signInAnonymously() async {
    await _client.auth.signInAnonymously();
    return currentUser;
  }

  /// ログアウトする
  Future<void> signOut() async =>
      _client.auth.signOut(scope: SignOutScope.global);

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

enum AuthenticationPlatform {
  web,
  ios,
  android,
  macos,
}
