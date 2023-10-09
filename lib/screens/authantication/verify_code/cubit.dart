import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_course/main.dart';
import 'package:thimar_course/screens/authantication/verify_code/states.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeStates> {
  VerifyCodeCubit() : super(VerifyCodeStates());

  late String phone;

  final codeController = TextEditingController();

  void check_code() async {
    emit(VerifyCodeLoadingStates());

    final _map = {
      "phone": phone,
      "code": codeController.text,
    };
    print(_map);
    try {
      print("-0-0-0-0-0-");
      final response = await Dio()
          .post("https://thimar.amr.aait-d.com/api/check_code", data: _map);

      print(response.data.toString());
      emit(VerifyCodeSuccessStates());
    } on DioException catch (e) {
      emit(VerifyCodeFailedStates());

      showSnackBar(e.response?.data['message'], false);
      print(e.response?.data);
      print(e.response?.data['message']);
    }
  }
}
