import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_course/main.dart';
import 'package:thimar_course/screens/authantication/change_password/states.dart';

class ChangeMessageCubit extends Cubit<ChangePasswordStates> {
  ChangeMessageCubit() : super(ChangePasswordStates());

  final passwordController = TextEditingController();
  late String phone;
  late String code;



  void reset_password() async {
    emit(ChangePasswordLoadingStates());

    final _map = {

      "password": passwordController.text,
      "phone" : phone,
      "code" : code,


    };
    print(_map);
    try {
      await Dio()
          .post("https://thimar.amr.aait-d.com/api/reset_password", data: _map);


      emit(ChangePasswordSuccessStates());
    } on DioException catch (e) {
      emit(ChangePasswordFailedStates());

      showSnackBar(e.response?.data['message'],false );
      print(e.response?.data);
      print(e.response?.data['message']);
    }
  }
}
