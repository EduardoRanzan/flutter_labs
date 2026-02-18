import 'package:flutter_labs/core/services/api/app_base_api.dart';
import 'package:flutter_labs/core/services/api/app_page_result.dart';
import 'package:flutter_labs/core/services/api/app_paged.dart';
import 'package:flutter_labs/core/services/dio_client.dart';
import 'package:flutter_labs/features/master_data/menu/product/entity/product_dto.dart';

class ProductService implements AppBaseApi<ProductDto> {
  final _dio = DioClient().dio;

  String path = 'rest/v1/products?select=*';

  @override
  Future<AppPageResult<ProductDto>> findAll({
    int page = 1,
    int pageSize = 5,
  }) {
    return AppPaged().getPaged<ProductDto>(
      path: path,
      page: page,
      pageSize: pageSize,
      fromJson: ProductDto.fromJson,
    );
  }

  @override
  Future<ProductDto> findById(String id) async {
    final response = await _dio.get('$path&id=eq.$id');

    final List data = response.data;

    return ProductDto.fromJson(data.first);
  }

  @override
  Future<void> create(ProductDto body) async {
    await _dio.post(path, data: body.toJson());
  }

  @override
  Future<dynamic> remove(String id) async {
    await _dio.delete('$path&id=eq.$id');
  }

  @override
  Future<dynamic> update(String id, ProductDto body) async {
    await _dio.patch('$path&id=eq.$id', data: body.toJson());
  }
}
