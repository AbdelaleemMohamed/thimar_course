import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_course/main.dart';
import 'package:thimar_course/screens/authantication/verify_account/states.dart';

import '../../../core/logic/cache_helper.dart';
import '../login/model.dart';

class VerifyAccountCubit extends Cubit<VerifyAccountStates> {
  VerifyAccountCubit() : super(VerifyAccountStates());

  late String phone;

  final codeController = TextEditingController();

  void verify() async {
    emit(VerifyAccountLoadingStates());

    final _map = {
      "phone": phone,
      "device_token": "test",
      "code": codeController.text,
      "type": Platform.operatingSystem,
    };
    print(_map);
    try {
      final response = await Dio()
          .post("https://thimar.amr.aait-d.com/api/verify", data: _map);

      final model = UserData.fromJson(response.data);
      ChacheHelper.saveLoginData(model);
      emit(VerifyAccountSuccessStates());
    } on DioException catch (e) {
      emit(VerifyAccountFailedStates());

      showSnackBar(e.response?.data['message'], false);
      print(e.response?.data);
      print(e.response?.data['message']);
    }
  }
}
