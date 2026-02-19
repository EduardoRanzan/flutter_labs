import 'package:dio/dio.dart';
import 'package:flutter_labs/core/global/app_navigator.dart';
import 'package:flutter_labs/core/services/dio_client.dart';
import 'package:flutter_labs/core/storage/secure_storage.dart';
import 'package:flutter_labs/features/auth/entity/auth_request_dto.dart';
import 'package:flutter_labs/features/auth/entity/auth_response_dto.dart';

class AuthService {
  final dio = DioClient().dio;
  final secureStorage = SecureStorage();
  bool _isLoggingOut = false;

  Future<AuthResponseDto> login(AuthRequestDto body) async {
    final response = await dio.post(
      'auth/v1/token?grant_type=password',
      data: body.toJson(),
    );

    return AuthResponseDto.fromJson(response.data);
  }

  Future<bool> hasValidSession() async {
    final token = await secureStorage.getToken();
    final refreshToken = await secureStorage.getRefreshToken();
    final expiresAt = await secureStorage.getExpiresAt();

    if (token == null || refreshToken == null || expiresAt == null) {
      await secureStorage.clear();
      return false;
    }

    final expirationDate = DateTime.fromMillisecondsSinceEpoch(expiresAt * 1000);
    final nowWithBuffer = DateTime.now().add(const Duration(seconds: 30));

    if (expirationDate.isAfter(nowWithBuffer)) {
      return true;
    }

    try {
      await refreshSession(refreshToken);
      return true;
    } on DioException {
      await secureStorage.clear();
      return false;
    } catch (_) {
      await secureStorage.clear();
      return false;
    }
  }

  Future<void> refreshSession(String refreshToken) async {
    final response = await dio.post(
      'auth/v1/token?grant_type=refresh_token',
      data: {'refresh_token': refreshToken},
    );

    final authResponse = AuthResponseDto.fromJson(response.data);

    await secureStorage.saveResponse(
      token: authResponse.accessToken,
      refreshToken: authResponse.refreshToken,
      expiresAt: authResponse.expiresAt,
      userName: authResponse.user.email,
      userId: authResponse.user.id,
    );
  }

  Future<void> logout() async {
    if (_isLoggingOut) return;
    _isLoggingOut = true;

    await secureStorage.clear();

    navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);

    _isLoggingOut = false;
  }
}
