import 'package:flutter_labs/core/services/api/app_base_api.dart';
import 'package:flutter_labs/core/services/api/app_page_result.dart';
import 'package:flutter_labs/core/services/api/app_paged.dart';
import 'package:flutter_labs/core/services/dio_client.dart';
import 'package:flutter_labs/features/master_data/menu/product/entity/product_dto.dart';

class ProductService extends AppBaseApi {
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

    return ProductDto.fromJson(response.data);
  }

  @override
  Future<dynamic> create(body) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<dynamic> remove(body) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<dynamic> update(body) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
