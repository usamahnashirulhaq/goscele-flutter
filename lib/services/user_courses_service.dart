import 'package:flutter/material.dart';
import 'package:goscele/failures/failures.dart';
import 'package:goscele/models/user_course.dart';
import 'package:goscele/repositories/user_courses_repository.dart';
import 'package:goscele/services/services.dart';

import '../service_locator.dart';
import 'api_service.dart';

class UserCoursesService {
  static final _apiService = locator<ApiService>();
  static final _userCoursesData = locator<UserCoursesRepository>();

  ValueNotifier<Failure> hasFailure = ValueNotifier(const NoFailure());

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
      },
    );
  }

  /// Stores the user data retrieved from the backend into the local storage.
  void _setUserCoursesData(List<UserCourse> response) {
    _userCoursesData.courses = response;
  }
}