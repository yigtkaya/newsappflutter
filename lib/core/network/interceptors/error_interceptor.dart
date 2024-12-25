import 'package:dio/dio.dart';
import 'package:newsappflutter/core/network/failure.dart';

/// Error Interceptor
final class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw NetworkFailure(
          message: 'Connection timeout',
          code: err.response?.statusCode?.toString() ?? '408',
        );
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw NetworkFailure(
              message: 'Bad request',
              code: '400',
            );
          case 401:
            throw NetworkFailure(
              message: 'Unauthorized',
              code: '401',
            );
          case 403:
            throw NetworkFailure(
              message: 'Forbidden',
              code: '403',
            );
          case 404:
            throw NetworkFailure(
              message: 'Not found',
              code: '404',
            );
          case 500:
            throw NetworkFailure(
              message: 'Internal server error',
              code: '500',
            );
          default:
            throw NetworkFailure(
              message: err.message ?? 'Unknown error occurred',
              code: err.response?.statusCode?.toString() ?? '000',
            );
        }
      default:
        throw NetworkFailure(
          message: err.message ?? 'Unknown error occurred',
          code: err.response?.statusCode?.toString() ?? '000',
        );
    }
  }
}
