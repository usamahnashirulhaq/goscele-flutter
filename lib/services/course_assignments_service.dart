import 'package:flutter/material.dart';
import 'package:goscele/failures/failures.dart';
import 'package:goscele/models/course_assignments.dart';
import 'package:goscele/repositories/course_assignments_repository.dart';
import 'package:goscele/services/services.dart';

import '../service_locator.dart';
import 'api_service.dart';

class CourseAssignmentsService {
  static final _apiService = locator<ApiService>();
  static final _courseAssignmentData = locator<CourseAssignmentsRepository>();

  ValueNotifier<Failure> hasFailure = ValueNotifier(const NoFailure());

  /// Retrieves user courses data from the backend to be stored locally.
  /// Sets [hasFailure] value if there is any failure.
  Future<void> getCourseAssignmentsData() async {
    hasFailure.value = const NoFailure();

    final response = await _apiService.getCourseAssignments();
    response.fold(
      (l) {
        hasFailure.value = l;
      },
      (r) {
        _setCourseAssignmentsData(r);
      },
    );
  }

  /// Stores the user data retrieved from the backend into the local storage.
  void _setCourseAssignmentsData(CourseAssignments response) {
    _courseAssignmentData.courseAssignments = response;
  }
}
