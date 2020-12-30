import 'package:goscele/failures/failure.dart';

class NetworkFailure {
  static const noConnection = NoConnection();
  static const connectionTimeout = ConnectionTimeout();
  static const cancelled = RequestCancelled();

  static responseFailure(int statusCode) => ResponseFailure(statusCode);
}

class NoConnection implements Failure {
  const NoConnection();

  @override
  String get code => 'N1';

  @override
  String get message => 'No internet connection';
}

class ConnectionTimeout implements Failure {
  const ConnectionTimeout();

  @override
  String get code => 'N2';

  @override
  String get message => 'Connection timed out';
}

class RequestCancelled implements Failure {
  const RequestCancelled();

  @override
  String get code => 'N3';

  @override
  String get message => 'Request cancelled';
}

class ResponseFailure implements Failure {
  final int statusCode;

  const ResponseFailure(this.statusCode);

  @override
  String get code => 'N-$statusCode';

  @override
  String get message => 'Response status error';
}
