import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_course/main.dart';
import 'package:thimar_course/screens/authantication/forget_password/states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(ForgetPasswordStates());

  final phoneController = TextEditingController();
  late String phone;


  void forget_password() async {
    emit(ForgetPasswordLoadingStates());

    final _map = {

      "phone": phoneController.text,

    };
    print(_map);
    try {
      await Dio()
          .post("https://thimar.amr.aait-d.com/api/forget_password", data: _map);


      emit(ForgetPasswordSuccessStates());
    } on DioException catch (e) {
      emit(ForgetPasswordFailedStates());

     showSnackBar(e.response?.data['message'],false );
      print(e.response?.data);
      print(e.response?.data['message']);
    }
  }
}
