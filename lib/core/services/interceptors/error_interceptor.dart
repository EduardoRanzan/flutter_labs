import 'package:dio/dio.dart';
import 'package:flutter_labs/features/auth/services/auth_service.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async{
    if (err.response?.statusCode == 401) {
      await AuthService().logout();
    }
    return handler.reject(err);
  }
}
