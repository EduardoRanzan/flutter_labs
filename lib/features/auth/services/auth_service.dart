import 'package:flutter_labs/core/services/dio_client.dart';
import 'package:flutter_labs/features/auth/entity/auth_request_dto.dart';
import 'package:flutter_labs/features/auth/entity/auth_response_dto.dart';

class AuthService {
  final dio = DioClient().dio;

  Future<AuthResponseDto> login(AuthRequestDto body) async {
    final response = await dio.post(
      'sessions',
      data: body.toJson()
    );

    if (response.statusCode == 401) {
      return Future.error('error');
    } else {
      return AuthResponseDto.fromJson(response.data);
    }
  }
}