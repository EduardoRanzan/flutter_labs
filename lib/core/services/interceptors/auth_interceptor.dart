import 'package:dio/dio.dart';
import 'package:flutter_labs/core/storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage secureStorage;

  AuthInterceptor(this.secureStorage);

  static const publicRoutes = [
    '/login',
  ];

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    if (!publicRoutes.contains(options.path)) {
      final token = await secureStorage.getToken();

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    handler.next(options);
  }
}
