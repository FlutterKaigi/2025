import 'dart:io';

import 'package:app/core/provider/environment.dart';
import 'package:app/features/auth/data/provider/auth_service.dart';
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
    ref.listen(_authStateChangeStreamProvider, (_, _) => ref.invalidateSelf());
  }

  Future<User?> signInWithGoogle() async {
    final environment = ref.read(environmentProvider);
    final redirectTo = _getRedirectTo(environment);
    return ref
        .read(authServiceProvider)
        .signInWithGoogle(
          redirectTo: redirectTo,
          useNative: !kIsWeb && (Platform.isIOS || Platform.isAndroid),
        );
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

  Future<void> signOut() async => ref.read(authServiceProvider).signOut();

  Future<String?> getAccessToken() async {
    final authService = ref.read(authServiceProvider);
    final session = authService.currentSession;
    if (session == null) {
      return null;
    }
    final isExpired = session.isExpired;
    if (isExpired) {
      final response = await authService.refreshSession();
      return response.session?.accessToken;
    }
    return session.accessToken;
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
