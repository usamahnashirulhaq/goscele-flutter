import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'file:///F:/Semester%209/OSSD/goscele/goscele/lib/viewmodels/home_screen_viewmodel.dart';
import 'package:goscele/pages/Home.dart';
import 'package:goscele/pages/Login.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/setup_dialog_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  // Set up services and their dependency injection
  setupLocator();
  await locator.allReady();
  // Set up dialog builders
  setupDialogUI();
  // Force the application to portrait orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /**
   * @statusBarColor mengubah status bar aplikasi menjadi warna biru dengan kode ARGB(0, 142, 223, 1)
   */
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(0, 172, 223, 1),
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.nonReactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      onModelReady: (model) => model.checkIsLoggedIn(),
      viewModelBuilder: () => HomeScreenViewModel(),
      builder: (context, model, child) {
        return MaterialApp(
          navigatorKey: locator<NavigationService>().navigatorKey,
          home: Scaffold(
            backgroundColor: Colors.grey[200],
            body: SafeArea(
              child: HomeScreen(),
            ),
          ),
        );
      },
    );
  }
}

class HomeScreen extends HookViewModelWidget<HomeScreenViewModel> {
  @override
  Widget buildViewModelWidget(
    BuildContext context,
    HomeScreenViewModel viewModel,
  ) {
    if (viewModel.isBusy) return Center(child: CircularProgressIndicator());

    // Listen to the isAuthenticated value. Will rebuild the widget if it changes.
    final isAuthenticated = useValueListenable(viewModel.isAuthenticated);

    if (!isAuthenticated)
      return Login();
    else
      return Home();
  }
}
