import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthStatus { initial, anonymous, authenticated, unauthenticated }

class AuthState {
  final AuthStatus status;
  final String? userEmail;
  final bool isGuestUser;

  const AuthState({
    this.status = AuthStatus.initial,
    this.userEmail,
    this.isGuestUser = false,
  });

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isAnonymous => status == AuthStatus.anonymous;

  AuthState copyWith({
    AuthStatus? status,
    String? userEmail,
    bool? isGuestUser,
  }) {
    return AuthState(
      status: status ?? this.status,
      userEmail: userEmail ?? this.userEmail,
      isGuestUser: isGuestUser ?? this.isGuestUser,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() => AuthState();

  void setAnonymousUser() {
    state = const AuthState(
      status: AuthStatus.anonymous,
      userEmail: null,
      isGuestUser: true,
    );
  }

  void setAuthenticatedUser(String email) {
    state = AuthState(
      status: AuthStatus.authenticated,
      userEmail: email,
      isGuestUser: false,
    );
  }

  void signOut() {
    state = const AuthState(
      status: AuthStatus.unauthenticated,
      userEmail: null,
      isGuestUser: false,
    );
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  () => AuthNotifier(),
);
