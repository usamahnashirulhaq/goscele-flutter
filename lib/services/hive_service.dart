import 'package:goscele/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Service class to handle the local storage system.
/// Uses Hive boxes to store the data.
class HiveService {
  Box<dynamic> boxUserInfo;

  Future<HiveService> init() async {
    await Hive.initFlutter();
    _registerAdapters();
    await _openBoxes();
    return this;
  }

  /// Hive needs to register class adapters in case of storing complex objects
  /// to the boxes. Register the class adapters here.
  void _registerAdapters() {}

  /// Opens all the boxes. This will allow the app to use them to access the
  /// data stored in the local storage.
  Future<void> _openBoxes() async {
    await Hive.openBox<dynamic>(Constants.hiveBoxUserInfo);

    boxUserInfo = Hive.box<dynamic>(Constants.hiveBoxUserInfo);
  }

  /// Clears all the data stored in all boxes.
  Future<void> clearBoxes() async {
    await boxUserInfo.clear();
  }

  /// Close the boxes so they may not be accessible anymore unless reopened.
  Future<void> closeBoxes() async {
    await Hive.close();
  }
}