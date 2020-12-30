import 'package:goscele/service_locator.dart';
import 'package:goscele/services/hive_service.dart';
import 'package:goscele/utils/constants.dart';

/// Service class to handle the data access and storage of the user that is
/// currently logged in.
class UserDataService {
  static final _userInfoBox = locator<HiveService>().boxUserInfo;

  int get userID => _userInfoBox.get(Constants.hiveKeyUserID);

  String get token => _userInfoBox.get(Constants.hiveKeyUserToken);

  String get username => _userInfoBox.get(Constants.hiveKeyUsername);

  String get firstName => _userInfoBox.get(Constants.hiveKeyUserFirstName);

  String get lastName => _userInfoBox.get(Constants.hiveKeyUserLastName);

  String get email => _userInfoBox.get(Constants.hiveKeyUserEmail);

  String get profileImage =>
      _userInfoBox.get(Constants.hiveKeyUserProfileImageUrl);

  String get profileImageSmall =>
      _userInfoBox.get(Constants.hiveKeyUserProfileImageUrlSmall);

  set userID(int value) => _userInfoBox.put(Constants.hiveKeyUserID, value);

  set token(String value) =>
      _userInfoBox.put(Constants.hiveKeyUserToken, value);

  set username(String value) =>
      _userInfoBox.put(Constants.hiveKeyUsername, value);

  set firstName(String value) =>
      _userInfoBox.put(Constants.hiveKeyUserFirstName, value);

  set lastName(String value) =>
      _userInfoBox.put(Constants.hiveKeyUserLastName, value);

  set email(String value) =>
      _userInfoBox.put(Constants.hiveKeyUserEmail, value);

  set profileImage(String value) =>
      _userInfoBox.put(Constants.hiveKeyUserProfileImageUrl, value);

  set profileImageSmall(String value) =>
      _userInfoBox.put(Constants.hiveKeyUserProfileImageUrlSmall, value);
}
