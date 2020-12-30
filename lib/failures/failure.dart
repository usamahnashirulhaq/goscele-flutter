abstract class Failure {
  final String message;
  final String code;

  const Failure(this.message, this.code);
}

class NoFailure implements Failure {
  const NoFailure();

  @override
  String get code => '0';

  @override
  String get message => 'Default Failure value. No failure happened.';
}