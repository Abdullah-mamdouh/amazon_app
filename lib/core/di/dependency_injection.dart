import 'package:amazon_app/features/auth/data/repo/auth_repo.dart';
import 'package:amazon_app/features/auth/logic/sign-up_cubit/sign_up_cubit.dart';
import 'package:amazon_app/features/get_products/data/repo/product_repo.dart';
import 'package:amazon_app/features/get_products/logic/cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // firebase
  final firebaseauth = FirebaseAuth.instance;
  getIt.registerLazySingleton<AuthRepo>(() =>AuthRepo(firebaseauth));
  getIt.registerFactory(() => SignUpCubit(getIt()));

  // login

  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(getIt()));
  getIt.registerFactory(() => GetProductCubit(getIt()));

}
