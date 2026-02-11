import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_labs/core/services/interceptors/auth_interceptor.dart';
import 'package:flutter_labs/core/services/interceptors/error_interceptor.dart';
import 'package:flutter_labs/core/storage/secure_storage.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  final secureStorage = SecureStorage();

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: dotenv.get('API_URL'),
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    dio.interceptors.add(AuthInterceptor(secureStorage));
    dio.interceptors.add(ErrorInterceptor());
  }
}