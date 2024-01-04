
import 'package:amazon_app/features/get_products/data/model/product.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'api_constant.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApisConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApisConstant.productsEndPoint)
  Future<List<Product>> getAllProducts();
}