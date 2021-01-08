import 'package:goscele/service_locator.dart';
import 'package:goscele/services/hive_service.dart';
import 'package:goscele/utils/constants.dart';

/// Service class to handle the data access and storage of the user that is
/// currently logged in.
class UserCoursesRepository {
  static final _userCoursesBox = locator<HiveService>().boxUserCourses;

  int get courseID => _userCoursesBox.get(Constants.hiveKeyCourseID);

  String get shortname => _userCoursesBox.get(Constants.hiveKeyCourseShortname);

  String get fullname => _userCoursesBox.get(Constants.hiveKeyCourseFullname);

  int get category => _userCoursesBox.get(Constants.hiveKeyCourseCategory);

  set courseID(int value) => _userCoursesBox.put(Constants.hiveKeyCourseID, value);

  set shortname(String value) => _userCoursesBox.put(Constants.hiveKeyCourseShortname, value);

  set fullname(String value) => _userCoursesBox.put(Constants.hiveKeyCourseFullname, value);

  set category(int value) => _userCoursesBox.put(Constants.hiveKeyCourseCategory, value);
}
