import 'package:flutter/foundation.dart' show immutable;

@immutable

/// AppConstants class
abstract final class AppConstants {
  const AppConstants._();

  /// App name
  static const String appName = 'NewsApp: Your own news app';

  /// Init function name
  static const String initFunctionName = 'setup';

  /// EMAIL REGEX
  static const String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'; //r'^[^@]+@[^@]+\.[^@]+'
}
