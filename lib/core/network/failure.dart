/// Failure class to handle error messages and codes
final class Failure {
  /// Constructor for Failure.
  Failure({required this.message, required this.code});

  /// Message of the failure.
  final String message;

  /// Code of the failure.
  final String code;
}

/// Auth exception class.
final class AuthException extends Failure {
  /// Constructor for AuthException.
  AuthException({required super.message, required super.code});
}
