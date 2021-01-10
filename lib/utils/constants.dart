class Constants {
  // Hive boxes names
  static const hiveBoxUserInfo = 'user_info';
  static const hiveBoxUserCourses = 'user_courses';
  static const hiveBoxCourseAssignments = 'course_assignments';

  // Hive user data box keys
  static const hiveKeyUserID = 'id';
  static const hiveKeyUserToken = 'token';
  static const hiveKeyUsername = 'username';
  static const hiveKeyUserFirstName = 'firstName';
  static const hiveKeyUserLastName = 'lastName';
  static const hiveKeyUserEmail = 'email';
  static const hiveKeyUserProfileImageUrl = 'profileImageUrl';
  static const hiveKeyUserProfileImageUrlSmall = 'profileImageUrlSmall';

  // Hive user courses box keys
  static const hiveKeyCourseID = 'id';
  static const hiveKeyCourseShortname = 'shortname';
  static const hiveKeyCourseFullname = 'fullname';
  static const hiveKeyCourseCategory = 'category';
  static const hiveAdapterCourse = 1;

  // Hive courses assignments box keys
  static const hiveKeyCourseAssignmentCourses = 'courses';
  static const hiveAdapterCourseAssignment = 3;

  // Hive courses (for assignments) box keys
  static const hiveKeyCourseAssignmentCourseID = 'id';
  static const hiveKeyCourseAssignmentCourseShortname = 'shortname';
  static const hiveKeyCourseAssignmentCourseFullname = 'fullname';
  static const hiveKeyCourseAssignmentsCourseAssigments = 'assignments';
  static const hiveAdapterCourseAssignmentCourse = 4;

  // Hive assignments box keys
  static const hiveKeyCourseAssignmentsAssigmentsID = 'id';
  static const hiveKeyCourseAssignmentsAssigmentsName = 'name';
  static const hiveKeyCourseAssignmentsAssignmentsDueDate = 'duedate';
  static const hiveAdapterAssignment = 5;

  // API urls
  static const baseUrl = 'https://scele-dev.cs.ui.ac.id/';
  static const loginUrl = baseUrl + 'login/token.php';
  static const webServiceUrl = baseUrl + 'webservice/rest/server.php';

  // API endpoints
  static const getUserByField = 'core_user_get_users_by_field';
  static const getUserCourses = 'core_enrol_get_users_courses';
  static const getAssignments = 'mod_assign_get_assignments';

  // API params
  static const paramFunction = 'wsfunction';
  static const paramToken = 'wstoken';
  static const paramFormat = 'moodlewsrestformat';
  static const paramService = 'service';
  static const paramUsername = 'username';
  static const paramPassword = 'password';
  static const paramField = 'field';
  static const paramValues = 'values';
  static const paramUserId = 'userid';

  // API values
  static const valueService = 'moodle_mobile_app';
  static const valueJsonFormat = 'json';
  static const valueUsername = 'username';
}