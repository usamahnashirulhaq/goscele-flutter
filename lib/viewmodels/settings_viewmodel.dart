import 'package:goscele/repositories/user_data_repository.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/auth_service.dart';
import 'package:goscele/setup_dialog_ui.dart';
import 'package:goscele/utils/failure_listener_mixin.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel with FailureListener {
  static final _authService = locator<AuthService>();
  static final _dialogService = locator<DialogService>();
  static final _userDataRepository = locator<UserDataRepository>();

  Future<DialogResponse> _dialogResponse;

  /// Logout from the Moodle service while showing a [FutureLoaderDialog].
  /// Also listens to any Failure events to show a snackbar in case of Failure.
  void logout() {
    _dialogResponse = _dialogService.showCustomDialog(
      variant: DialogType.loader,
      title: 'Logging out ...',
      customData: _authService.logout(),
    );

    listenToFailures(
      _authService.hasFailure,
      future: _dialogResponse,
    );
  }

  String getFullname() => "${_userDataRepository.firstName} ${_userDataRepository.lastName}";

  String getUsername() => "${_userDataRepository.username}";
}