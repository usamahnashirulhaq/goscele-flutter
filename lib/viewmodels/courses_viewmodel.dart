import 'package:flutter/cupertino.dart';
import 'package:goscele/models/user_course.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/services.dart';
import 'package:goscele/utils/failure_listener_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CoursesViewModel extends BaseViewModel with FailureListener {
  static final _userCoursesService = locator<UserCoursesService>();
  static final _userDataRepository = locator<UserDataRepository>();
  static final _userCoursesBox = locator<HiveService>().boxUserCourses;

  ValueNotifier<List<UserCourse>> courses = ValueNotifier([]);

  void onModelReady() {
    int userId = _userDataRepository.userID;
    _userCoursesService.getUserCoursesData(userId);

    /// Listen to local storage changes and update live data (user_course)
    _userCoursesBox.listenable().addListener(() {
      courses.value = _userCoursesBox.values.toList();
    });
    //TODO: Add snackbar untuk interaksi user buat error message
    //TODO: Kasih app feedback kalau data masih loading
  }
}
