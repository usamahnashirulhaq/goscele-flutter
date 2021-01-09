import 'package:get_it/get_it.dart';
import 'package:goscele/repositories/user_courses_repository.dart';
import 'package:goscele/services/user_courses_service.dart';
import 'package:goscele/services/services.dart';
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
  locator.registerSingletonAsync<HiveService>(() async => HiveService().init());

  locator.registerSingletonAsync<UserCoursesRepository>(
        () async => UserCoursesRepository(),
    dependsOn: [HiveService],
  );

  locator.registerSingletonAsync<UserDataRepository>(
        () async => UserDataRepository(),
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

  locator.registerSingletonAsync<AuthService>(
        () async => AuthService(),
    dependsOn: [UserDataRepository, ApiService],
  );
}