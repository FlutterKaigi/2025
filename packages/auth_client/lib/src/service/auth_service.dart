import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  late final GoogleOAuthClientId _googleOAuthClientId;

  /// Supabaseを初期化する。
  /// この関数を呼び出す前に`WidgetsFlutterBinding.ensureInitialized()`を呼び出す必要がある。
  Future<Supabase> initialize({
    required String supabaseUrl,
    required String supabaseKey,
    required GoogleOAuthClientId googleOAuthClientId,
    bool isDebug = false,
  }) async => Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
    debug: isDebug,
  );

  /// `initialize`を呼び出した後に使用できる。
  SupabaseClient get _client => Supabase.instance.client;

  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn(clientId: _googleOAuthClientId.clientId);
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken!;
    final idToken = googleAuth.idToken!;

    final response = await _client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    return response.user;
  }

  User? currentUser() => _client.auth.currentUser;

  Stream<AuthStateEvent> authStateChangeStream() =>
      _client.auth.onAuthStateChange.map((event) {
        return switch (event.event) {
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

enum GoogleOAuthClientId {
  dashboardiOS(
    '106402217021-ql2va8nvujbqigkdqmoiiu4v0sgjbf4u.apps.googleusercontent.com',
  );

  const GoogleOAuthClientId(this.clientId);

  final String clientId;
}

enum AuthStateEvent {
  initialSession,
  signedIn,
  signedOut,
  tokenRefreshed,
  userUpdated,
}
