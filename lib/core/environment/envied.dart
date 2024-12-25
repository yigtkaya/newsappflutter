import 'package:envied/envied.dart';
import 'package:newsappflutter/core/environment/app_configuration.dart';

part 'envied.g.dart';

/// The development environment
@Envied(path: '.env', obfuscate: true)
final class DevEnv implements AppConfiguration {
  /// The news api key
  @EnviedField(varName: 'NEWS_API_KEY')
  static final String _newsApiKey = _DevEnv._newsApiKey;

  /// The base url
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _DevEnv._baseUrl;

  @override
  String get newsApiKey => _newsApiKey;

  @override
  String get baseUrl => _baseUrl;
}
