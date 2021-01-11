import 'package:flutter/foundation.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {
  static final _authService = locator<AuthService>();

  ValueListenable<bool> get isAuthenticated => _authService.isAuthenticated;

  /// Check if the user have
  void checkIsLoggedIn() {
    _authService.autoLogin();
  }
}
