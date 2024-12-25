import 'package:newsappflutter/core/environment/app_configuration.dart';

/// App environment
final class AppEnvironment {
  /// Setup the app environment
  AppEnvironment.setup({required AppConfiguration configuration}) {
    _configuration = configuration;
  }

  static late final AppConfiguration _configuration;

  /// The key for the news api
  static String get newsApiKey => _configuration.newsApiKey;

  /// The base url
  static String get baseUrl => _configuration.baseUrl;
}
