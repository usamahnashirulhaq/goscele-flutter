import 'package:flutter/foundation.dart';
import 'package:goscele/failures/failures.dart';
import 'package:goscele/models/responses/responses.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/api_service.dart';
import 'package:goscele/services/hive_service.dart';
import 'package:goscele/services/user_data_service.dart';

/// Service to handle all functionalities related to authentication.
class AuthService {
  static final _apiService = locator<ApiService>();
  static final _userData = locator<UserDataService>();

  ValueNotifier<bool> isAuthenticated = ValueNotifier(false);
  ValueNotifier<Failure> hasFailure = ValueNotifier(const NoFailure());

  /// Function to check if the user is already logged in or not.
  void autoLogin() {
    // Check if user data is not empty
    if (_userData.userID != null) {
      isAuthenticated.value = true;
    } else {
      isAuthenticated.value = false;
    }
  }

  /// Login to Moodle service. Sets [hasFailure] value if there is any failure.
  Future<void> login(String username, String password) async {
    hasFailure.value = const NoFailure();

    final response = await _apiService.login(username, password);
    response.fold(
      (l) => hasFailure.value = l,
      (r) async {
        _userData.token = r.token;
        await _getUserData(username);
      },
    );
  }

  /// Log out of the application by clearing the local data
  Future<void> logout() async {
    await locator<HiveService>().clearBoxes();
    isAuthenticated.value = false;
  }

  /// Retrieves user data from the backend to be stored locally.
  /// Sets [hasFailure] value if there is any failure.
  Future<void> _getUserData(String username) async {
    hasFailure.value = const NoFailure();

    final response = await _apiService.getUserByField(username);
    response.fold(
      (l) {
        _userData.token = null;
        hasFailure.value = l;
      },
      (r) {
        _setUserData(r);
        isAuthenticated.value = true;
      },
    );
  }

  /// Stores the user data retrieved from the backend into the local storage.
  void _setUserData(UserResponse response) {
    _userData.userID = response.id;
    _userData.username = response.username;
    _userData.email = response.email;
    _userData.firstName = response.firstname;
    _userData.lastName = response.lastname;
    _userData.profileImage = response.profileimageurl;
    _userData.profileImageSmall = response.profileimageurlsmall;
  }
}
