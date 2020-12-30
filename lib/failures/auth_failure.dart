import 'package:goscele/failures/failure.dart';

class AuthFailure {
  static const invalidCredentials = InvalidCredentials();
  static const userDoesNotExist = UserDoesNotExist();
}

class InvalidCredentials implements Failure {
  const InvalidCredentials();

  @override
  String get code => 'A1';

  @override
  String get message => 'Invalid username or password';
}

class UserDoesNotExist implements Failure {
  const UserDoesNotExist();

  @override
  String get code => 'A2';

  @override
  String get message => 'User does not exists';
}