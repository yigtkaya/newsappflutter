import 'package:dio/dio.dart';
import 'package:newsappflutter/core/environment/app_environment.dart';
import 'package:newsappflutter/core/network/interceptors/error_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Dio Client class
final class DioClient {
  /// Factory method
  factory DioClient() {
    return _instance;
  }

  DioClient._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppEnvironment.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    )..interceptors.addAll([
        ErrorInterceptor(),
        PrettyDioLogger(),
      ]);
  }
  static final DioClient _instance = DioClient._();
  late final Dio _dio;

  /// Get Dio instance
  Dio get dio => _dio;
}
