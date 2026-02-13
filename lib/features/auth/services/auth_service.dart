import 'package:flutter_labs/core/services/dio_client.dart';
import 'package:flutter_labs/features/auth/entity/auth_request_dto.dart';
import 'package:flutter_labs/features/auth/entity/auth_response_dto.dart';

class AuthService {
  final dio = DioClient().dio;

  Future<AuthResponseDto> login(AuthRequestDto body) async {
    final response = await dio.post(
      'auth/v1/token?grant_type=password',
      data: body.toJson()
    );

    return AuthResponseDto.fromJson(response.data);
  }
}