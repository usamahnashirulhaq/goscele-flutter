import 'package:flutter/foundation.dart';
import 'package:goscele/failures/failure.dart';
import 'package:goscele/service_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

/// Mixin that adds a failure listener functionality to a ViewModel.
mixin FailureListener on BaseViewModel {
  static final _snackbarService = locator<SnackbarService>();

  /// Adds a listener to failures through a ValueListenable.
  /// The listener will show a snackbar to the UI if there is a connection Failure.
  /// It has an option to wait for a [future] to finish before executing the listener.
  /// If the [future] is not supplied, execute the listener right away.
  void listenToFailures(
    ValueListenable<Failure> listenable, {
    Future<dynamic> future,
  }) {
    listenable.addListener(() async {
      if (listenable.value is! NoFailure) {
        if (future != null)
          future?.then((value) => _snackbarService.showSnackbar(
                message: '${listenable.value.message}',
                duration: Duration(seconds: 2),
              ));
        else
          _snackbarService.showSnackbar(
            message: '${listenable.value.message}',
            duration: Duration(seconds: 2),
          );
      }
    });
  }
}
