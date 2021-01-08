import 'package:flutter/material.dart';
import 'package:goscele/failures/failures.dart';
import 'package:goscele/models/responses/responses.dart';
import 'package:goscele/services/services.dart';

import '../service_locator.dart';
import 'api_service.dart';

class UserCoursesService {
  static final _apiService = locator<ApiService>();
  static final _userCoursesData = locator<UserCoursesRepository>();
  static final _userData = locator<UserDataRepository>();

  ValueNotifier<bool> isAuthenticated = ValueNotifier(false);
  ValueNotifier<Failure> hasFailure = ValueNotifier(const NoFailure());

  /// Function to check if the user is already logged in or not.
  void isAlreadyLogin() {
    // Check if user data is not empty
    if (_userData.userID != null) {
      isAuthenticated.value = true;
    } else {
      isAuthenticated.value = false;
    }
  }

  /// Retrieves user courses data from the backend to be stored locally.
  /// Sets [hasFailure] value if there is any failure.
  Future<void> getUserCoursesData(int userId) async {
    hasFailure.value = const NoFailure();

    final response = await _apiService.getUserCourses(userId);
    response.fold(
          (l) {
        hasFailure.value = l;
      },
          (r) {
        _setUserCoursesData(r);
        isAuthenticated.value = true;
      },
    );
  }

  /// Stores the user data retrieved from the backend into the local storage.
  void _setUserCoursesData(UserCoursesResponse response) {
    _userCoursesData.courseID = response.id;
    _userCoursesData.shortname = response.shortname;
    _userCoursesData.fullname = response.fullname;
    _userCoursesData.category = response.category;
  }
}