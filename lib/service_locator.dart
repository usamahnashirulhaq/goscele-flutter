import 'package:get_it/get_it.dart';
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
  locator.registerSingletonAsync<UserDataService>(
    () async => UserDataService(),
    dependsOn: [HiveService],
  );
  locator.registerSingletonAsync<ApiService>(
    () async => ApiService(),
    dependsOn: [UserDataService],
  );
  locator.registerSingletonAsync<AuthService>(
        () async => AuthService(),
    dependsOn: [UserDataService, ApiService],
  );
}
