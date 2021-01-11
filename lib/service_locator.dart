import 'package:get_it/get_it.dart';
import 'package:goscele/repositories/course_assignments_repository.dart';
import 'package:goscele/repositories/course_category_repository.dart';
import 'package:goscele/repositories/discussion_repository.dart';
import 'package:goscele/repositories/forum_repository.dart';
import 'package:goscele/repositories/user_courses_repository.dart';
import 'package:goscele/services/forum_service.dart';
import 'package:goscele/services/services.dart';
import 'package:goscele/services/user_courses_service.dart';
import 'package:goscele/viewmodels/forum_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

/// Service locator and dependency injection manager
// Service locator
GetIt locator = GetIt.instance;

/// Setup and manage the dependencies of the services
void setupLocator() {
  locator.registerSingleton(DialogService());
  locator.registerSingleton(SnackbarService());
  locator.registerSingleton(NavigationService());
  locator.registerSingleton(ConnectivityService());
  locator.registerSingleton(HttpService());

  /// Bad practices: shouldn't make a singleton
  /// viewmodel. Issue!
  locator.registerSingleton(ForumViewModel());
  locator.registerSingletonAsync<HiveService>(() async => HiveService().init());

  locator.registerSingletonAsync<UserCoursesRepository>(
    () async => UserCoursesRepository(),
    dependsOn: [HiveService],
  );

  locator.registerSingletonAsync<UserDataRepository>(
    () async => UserDataRepository(),
    dependsOn: [HiveService],
  );

  locator.registerSingletonAsync<ForumRepository>(
        () async => ForumRepository(),
    dependsOn: [HiveService],
  );

  locator.registerSingletonAsync<DiscussionRepository>(
        () async => DiscussionRepository(),
    dependsOn: [HiveService],
  );

  locator.registerSingletonAsync<CourseCategoryRepository>(
        () async => CourseCategoryRepository(),
    dependsOn: [HiveService],
  );

  locator.registerSingletonAsync<CourseAssignmentsRepository>(
        () async => CourseAssignmentsRepository(),
    dependsOn: [HiveService],
  );

  locator.registerSingletonAsync<ApiService>(
    () async => ApiService(),
    dependsOn: [UserDataRepository],
  );

  locator.registerSingletonAsync<UserCoursesService>(
    () async => UserCoursesService(),
    dependsOn: [UserCoursesRepository, ApiService],
  );

  locator.registerSingletonAsync<CourseAssignmentsService>(
        () async => CourseAssignmentsService(),
    dependsOn: [CourseAssignmentsRepository, ApiService],
  );

  locator.registerSingletonAsync<AuthService>(
    () async => AuthService(),
    dependsOn: [UserDataRepository, ApiService],
  );

  locator.registerSingletonAsync<ForumService>(
    () async => ForumService(),
    dependsOn: [ForumRepository, ApiService],
  );

  locator.registerSingletonAsync<DiscussionService>(
        () async => DiscussionService(),
    dependsOn: [DiscussionRepository, ApiService],
  );

  locator.registerSingletonAsync<CourseCategoryService>(
        () async => CourseCategoryService(),
    dependsOn: [CourseCategoryRepository, ApiService],
  );
}
