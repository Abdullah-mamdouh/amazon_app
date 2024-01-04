import 'package:amazon_app/features/get_products/data/repo/product_repo.dart';
import 'package:amazon_app/features/get_products/logic/cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(getIt()));
  getIt.registerFactory(() => GetProductCubit(getIt()));

}
