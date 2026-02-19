import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_labs/core/storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage secureStorage;

  AuthInterceptor(this.secureStorage);

  static const publicRoutes = [
    'auth/v1/token?grant_type=password',
    'auth/v1/token?grant_type=refresh_token',
  ];

  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    options.headers['apikey'] = dotenv.get('API_KEY');

    if (!publicRoutes.contains(options.path)) {
      final token = await secureStorage.getToken();

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }


    handler.next(options);
  }
}
