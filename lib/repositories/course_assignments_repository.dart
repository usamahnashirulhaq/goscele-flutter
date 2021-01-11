import 'package:goscele/models/course_assignments.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/hive_service.dart';
import 'package:goscele/utils/constants.dart';

/// Service class to handle the data access and storage of the user that is
/// currently logged in.
class CourseAssignmentsRepository {
  static final _courseAssignmentsBox = locator<HiveService>().boxCourseAssignments;

  CourseAssignments get courseAssignments => _courseAssignmentsBox.get(Constants.hiveKeyCourseAssignmentCourses);

  set courseAssignments(CourseAssignments courseAssignments) {
    _courseAssignmentsBox.put(Constants.hiveKeyCourseAssignmentCourses, courseAssignments);
  }
}
