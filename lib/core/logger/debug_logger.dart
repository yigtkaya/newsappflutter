import 'package:newsappflutter/core/logger/logger.dart';

/// Log for network
void networkLog({
  required String repository,
  required dynamic message,
  dynamic error,
  StackTrace? stackTrace,
}) {
  loggerNoMethod.e('REPOSITORY: $repository');
  logger.e(message);
}

/// Log for dio
void dioLog(dynamic message) {
  loggerNoMethod.w(message);
}

/// Log for dio data
void dioDataLog(dynamic message) {
  loggerData.w(message);
}

/// Log for app exceptions
void appExceptionLog(dynamic message, dynamic error, StackTrace? stackTrace) {
  logger
    ..e('APP EXCEPTION:')
    ..e(message);
}

/// Log for data
void dataLog(dynamic message) {
  loggerData.w(message);
}

/// Log for navigation
void navigationLog(dynamic message) {
  loggerData.v(message);
}
