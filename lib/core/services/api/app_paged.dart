import 'package:dio/dio.dart';
import 'package:flutter_labs/core/services/api/app_page_result.dart';
import 'package:flutter_labs/core/services/dio_client.dart';

class AppPaged {
  Future<AppPageResult<T>> getPaged<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
    int page = 1,
    int pageSize = 5,
  }) async {
    final start = (page - 1) * pageSize;
    final end = start + pageSize - 1;

    final _dio = DioClient().dio;

    final response = await _dio.get(
      path,
      options: Options(
        headers: {
          'Range-Unit': 'items',
          'Range': '$start-$end',
        },
      ),
    );

    final data = (response.data as List)
        .map((e) => fromJson(e))
        .toList();

    int? total;
    final contentRange = response.headers['content-range']?.first;

    if (contentRange != null && contentRange.contains('/')) {
      total = int.tryParse(contentRange.split('/').last);
    }

    return AppPageResult<T>(
      data: data,
      total: total,
    );
  }
}