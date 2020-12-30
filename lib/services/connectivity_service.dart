import 'package:connectivity/connectivity.dart';

/// Service to handle the Internet connectivity.
class ConnectivityService {
  final _connectivity = Connectivity();

  /// Checks if the application can connect to the internet.
  Future<bool> isInternetAvailable() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) return true;
    return false;
  }
}