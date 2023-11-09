import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_course/core/logic/dio_helper.dart';

import 'model.dart';
import 'states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesStates());



  Future<void> getCategories() async {
    emit(GetCategoriesLoadingState());
    var response = await DioHelper.get("categories");

    if (response.isSuccess) {
      final data = CategoriesData.fromJson(response.response!.data);
      emit(GetCategoriesSuccessState(list: data.list));
    } else {
      emit(GetCategoriesFailedState(msg: response.msg));
    }
  }
}
