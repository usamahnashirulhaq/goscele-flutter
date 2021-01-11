class Constants {
  // Hive boxes names
  static const hiveBoxUserInfo = 'user_info';
  static const hiveBoxUserCourses = 'user_courses';
  static const hiveBoxForum = 'forum';
  static const hiveBoxDiscussion = 'discussion';

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

  // Hive forum box keys
  static const hiveAdapterForum = 3;
  static const hiveAdapterForumAttachments = 5;

  // Hive discussion box keys
  static const hiveAdapterDiscussion = 4;

  // API urls
  static const baseUrl = 'https://scele-dev.cs.ui.ac.id/';
  static const loginUrl = baseUrl + 'login/token.php';
  static const webServiceUrl = baseUrl + 'webservice/rest/server.php';

  // API endpoints
  static const getUserByField = 'core_user_get_users_by_field';
  static const getForumById = 'mod_forum_get_forum_discussions_paginated';
  static const getUserCourses = 'core_enrol_get_users_courses';
  static const getDiscussionById = "mod_forum_get_forum_discussion_posts";

  // API params
  static const paramFunction = 'wsfunction';
  static const paramToken = 'wstoken';
  static const paramFormat = 'moodlewsrestformat';
  static const paramService = 'service';
  static const paramUsername = 'username';
  static const paramPassword = 'password';
  static const paramField = 'field';
  static const paramValues = 'values';
  static const paramForumId = 'forumid';
  static const paramUserId = 'userid';
  static const paramDiscussionId = "discussionid";

  // API values
  static const valueService = 'moodle_mobile_app';
  static const valueJsonFormat = 'json';
  static const valueUsername = 'username';

  // Forum IDs
  static const generalForumId = 1;

  static var paramSortDirection = "sortdirection";
  static var sortDirectionAsc = "ASC";
  static var sortDirectionDesc = "DESC";


}
