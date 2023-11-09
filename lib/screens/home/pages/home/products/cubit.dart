import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_course/core/logic/dio_helper.dart';

import 'model.dart';
import 'states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductStates());

  Future<void> getProducts() async {
    emit(GetProductsLoadingState());
    var response = await DioHelper.get("products");

    if (response.isSuccess) {
      final data = ProductsData.fromJson(response.response!.data);
      emit(GetProductsSuccessState(list: data.list));
    } else {
      emit(GetProductsFailedState(msg: response.msg));
    }
  }
}
