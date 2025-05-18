import 'package:auth_client/auth_client.dart';
import 'package:dashboard/core/provider/environment.dart';
import 'package:dashboard/features/auth/data/provider/auth_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  Stream<User?> build() async* {
    final authService = ref.watch(authServiceProvider);
    yield authService.currentUser();
    ref.listen(_authStateChangeStreamProvider, (_, _) => ref.invalidateSelf());
  }

  Future<User?> signInWithGoogle() async {
    final environment = ref.read(environmentProvider);
    final redirectTo =
        'jp.flutterkaigi.2025.dashboard${environment.appIdSuffix}'
        '://login-callback';
    return ref
        .read(authServiceProvider)
        .signInWithGoogle(redirectTo: redirectTo);
  }

  Future<void> signOut() async => ref.read(authServiceProvider).signOut();
}

@Riverpod(keepAlive: true)
Stream<AuthStateEvent> _authStateChangeStream(Ref ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChangeStream();
}
