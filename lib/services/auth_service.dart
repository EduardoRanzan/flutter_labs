import 'package:flutter_labs/services/dio/dio_client.dart';
import 'package:flutter_labs/services/dto/auth/auth_request_dto.dart';

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