import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_course/core/logic/dio_helper.dart';

import 'model.dart';
import 'states.dart';


class SliderCubit extends Cubit<SliderStates> {
  SliderCubit() : super(SliderStates());


  Future<void> getSlider() async {
    emit(GetSliderLoadingState());
    var response = await DioHelper.get("sliders");

    if (response.isSuccess) {
      print(response.response?.data);
      final data = SlidersData.fromJson(response.response!.data);
      emit(GetSliderSuccessState(list: data.list));
    } else {
      print(response.msg);
      emit(GetSliderFailedState(msg: response.msg));
    }
  }


}
