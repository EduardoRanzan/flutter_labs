import 'package:flutter_labs/core/services/dio_client.dart';
import 'package:flutter_labs/features/auth/entity/auth_request_dto.dart';

class AuthService {
  final dio = DioClient().dio;

  Future login(AuthRequestDto body) async {
    final response = await dio.post(
      'sessions',
      data: body.toJson()
    );

    return response;
  }
}