
import '../data/model/product.dart';
import '../data/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  ProductRepo _productRepo;
  GetProductCubit(this._productRepo) : super(const GetProductState.initial());

  static GetProductCubit get(context) => BlocProvider.of<GetProductCubit>(context);

  static List<Product> products = [];
  void emitGetProductStates() async {
    emit(const GetProductState.loading());
    final response = await _productRepo.getAllProducts();
    response.when(success: (productResponse) {
      products = productResponse;
      emit(GetProductState.success(productResponse));
    }, failure: (error) {
      emit(GetProductState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}