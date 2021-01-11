import 'package:flutter/material.dart';
import 'package:goscele/failures/failures.dart';
import 'package:goscele/models/course_category.dart';
import 'package:goscele/repositories/course_category_repository.dart';
import 'package:goscele/services/services.dart';

import '../service_locator.dart';
import 'api_service.dart';

class CourseCategoryService {
  static final _apiService = locator<ApiService>();
  static final _courseCategoryData = locator<CourseCategoryRepository>();

  ValueNotifier<Failure> hasFailure = ValueNotifier(const NoFailure());

  /// Retrieves course category data from the backend to be stored locally.
  /// Sets [hasFailure] value if there is any failure.
  Future<void> getCourseCategoryData() async {
    hasFailure.value = const NoFailure();

    final response = await _apiService.getCourseCategories();
    response.fold(
          (l) {
        hasFailure.value = l;
      },
          (r) {
        _setUserCoursesData(r);
      },
    );
  }

  /// Stores the course categories retrieved from the backend into the local storage.
  void _setUserCoursesData(List<CourseCategory> response) {
    _courseCategoryData.categories = response;
  }
}