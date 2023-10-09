import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_course/main.dart';
import 'package:thimar_course/screens/authantication/login/model.dart';
import 'package:thimar_course/screens/authantication/login/states.dart';
import '../../../core/logic/cache_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStates());

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    emit(LoginLoadingStates());

    final _map = {
      "phone": phoneController.text,
      "password": passwordController.text,
      "device_token": "test",
      "type": Platform.operatingSystem,
      "user_type": "client"
    };
    print(_map);
    try {
      final response = await Dio()
          .post("https://thimar.amr.aait-d.com/api/login", data: _map);

      final model = UserData.fromJson(response.data);
      ChacheHelper.saveLoginData(model);
      emit(LoginSuccessStates());
    } on DioException catch (e) {
      emit(LoginFailedStates());
      showSnackBar(e.response?.data['message'],false);

      print(e.response?.data);
      print(e.response?.data['message']);
    }
  }
}
