import 'package:goscele/models/user_course.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/hive_service.dart';

/// Service class to handle the data access and storage of the user that is
/// currently logged in.
class UserCoursesRepository {
  static final _userCoursesBox = locator<HiveService>().boxUserCourses;

  List<UserCourse> get courses => _userCoursesBox.values;

  set courses(List<UserCourse> courses) {
    courses.forEach((course) => _userCoursesBox.put(course.id, course));
  }
}
