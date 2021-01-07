import 'package:goscele/service_locator.dart';
import 'package:goscele/services/auth_service.dart';
import 'package:goscele/setup_dialog_ui.dart';
import 'package:goscele/utils/failure_listener_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel with FailureListener {
  static final _authService = locator<AuthService>();
  static final _dialogService = locator<DialogService>();

  Future<DialogResponse> _dialogResponse;

  /// Login to the Moodle service while showing a [FutureLoaderDialog].
  /// Also listens to any Failure events to show a snackbar in case of Failure.
  void login(String username, String password) {
    _dialogResponse = _dialogService.showCustomDialog(
      variant: DialogType.loader,
      title: 'Logging in ...',
      customData: _authService.login(username, password),
    );

    listenToFailures(
      _authService.hasFailure,
      future: _dialogResponse,
    );
  }
}
