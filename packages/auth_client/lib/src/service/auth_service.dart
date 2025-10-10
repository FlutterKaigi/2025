import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AuthService {
  /// Supabaseを初期化する。
  /// この関数を呼び出す前に`WidgetsFlutterBinding.ensureInitialized()`を呼び出す必要がある。
  Future<supabase.Supabase> initialize({
    required String supabaseUrl,
    required String supabaseKey,
    required Future<String?> Function()? getAccessToken,
    bool isDebug = false,
  }) async => supabase.Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    debug: isDebug,
    accessToken: getAccessToken,
  );

  /// `initialize`を呼び出した後に使用できる。
  supabase.SupabaseClient get _client => supabase.Supabase.instance.client;

  /// Googleでログインする
  Future<UserCredential> signInWithGoogle() async {
    if (kIsWeb) {
      // Create a new provider
      final googleProvider = GoogleAuthProvider();

      googleProvider.addScope(
        'https://www.googleapis.com/auth/contacts.readonly',
      );
      googleProvider.setCustomParameters({'login_hint': null});

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithPopup(googleProvider);
    } else {
      final googleUser = await GoogleSignIn.instance.authenticate();
      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      return FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  /// 匿名でログインする
  Future<void> signInAnonymously() async {
    await FirebaseAuth.instance.signInAnonymously();
  }

  /// 匿名ユーザーをGoogleアカウントと紐づける
  Future<void> linkAnonymousUserWithGoogle() async {
    final user = await signInWithGoogle();
    final credential = user.credential;
    if (credential != null) {
      await FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
    }
  }

  /// ログアウトする
  Future<void> signOut() async => _client.auth.signOut();

  /// 現在のユーザーを取得する
  User? get currentUser {
    return FirebaseAuth.instance.currentUser;
  }

  Future<supabase.AuthResponse> refreshSession() =>
      _client.auth.refreshSession();

  /// 認証状態の変化を監視する
  Stream<AuthStateEvent> authStateChangeStream() =>
      _client.auth.onAuthStateChange.map((event) {
        return switch (event.event) {
          supabase.AuthChangeEvent.initialSession =>
            AuthStateEvent.initialSession,
          supabase.AuthChangeEvent.signedIn => AuthStateEvent.signedIn,
          supabase.AuthChangeEvent.signedOut => AuthStateEvent.signedOut,
          supabase.AuthChangeEvent.tokenRefreshed =>
            AuthStateEvent.tokenRefreshed,
          supabase.AuthChangeEvent.userUpdated => AuthStateEvent.userUpdated,
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
