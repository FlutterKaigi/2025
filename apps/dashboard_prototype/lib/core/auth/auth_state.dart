import 'package:flutter/foundation.dart';

enum AuthStatus {
  initial,
  anonymous,
  authenticated,
  unauthenticated,
}

class AuthState extends ChangeNotifier {
  AuthStatus _status = AuthStatus.initial;
  String? _userEmail;
  bool _isGuestUser = false;

  AuthStatus get status => _status;
  String? get userEmail => _userEmail;
  bool get isGuestUser => _isGuestUser;
  bool get isAuthenticated => _status == AuthStatus.authenticated;
  bool get isAnonymous => _status == AuthStatus.anonymous;

  void setAnonymousUser() {
    _status = AuthStatus.anonymous;
    _userEmail = null;
    _isGuestUser = true;
    notifyListeners();
  }

  void setAuthenticatedUser(String email) {
    _status = AuthStatus.authenticated;
    _userEmail = email;
    _isGuestUser = false;
    notifyListeners();
  }

  void signOut() {
    _status = AuthStatus.unauthenticated;
    _userEmail = null;
    _isGuestUser = false;
    notifyListeners();
  }
}