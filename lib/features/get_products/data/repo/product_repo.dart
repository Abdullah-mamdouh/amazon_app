
import 'package:amazon_app/features/get_products/data/model/product.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class ProductRepo {
  final ApiService _apiService;

  ProductRepo(this._apiService);

  Future<ApiResult<List<Product>>> getAllProducts() async {
    try {
      final response = await _apiService.getAllProducts();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro) );
    }
  }
}
