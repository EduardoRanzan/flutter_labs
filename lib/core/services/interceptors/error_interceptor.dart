import 'package:dio/dio.dart';
import 'package:flutter_labs/l10n/app_localizations.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;

    if (response != null) {
      switch (response.statusCode) {
        case 401:
          return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              response: response,
              type: DioExceptionType.badResponse,
            )
          );
        default:
          return handler.reject(
            DioException(
              requestOptions: err.requestOptions,
              response: response,
              type: DioExceptionType.badResponse,
            )
          );
      }
    }

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      return handler.reject(
          DioException(
              requestOptions: err.requestOptions,
              response: response,
              type: DioExceptionType.badResponse,
          )
      );
    }

    return handler.reject(err);
  }
}
