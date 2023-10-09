
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_course/main.dart';
import 'package:thimar_course/screens/authantication/register/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterStates());

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
  final genderController = TextEditingController();
  final password_confirmationController = TextEditingController();
  late  final cityNameController = TextEditingController();
  final latController = TextEditingController();
  final lngController = TextEditingController();
  int ?cityId;
  void register() async {
    emit(RegisterLoadingStates());

    final _map = {
      "phone": phoneController.text,
      "password": passwordController.text,
      "fullname": fullnameController.text,
      "gender": genderController.text,
      "password_confirmation": password_confirmationController.text,
      "lat": latController.text ,
      "lng": lngController.text ,

    };
    print(_map);
    try {
      final response = await Dio()
          .post("https://thimar.amr.aait-d.com/api/client_register", data: _map);

     showSnackBar(response.data['message'],true);
      emit(RegisterSuccessStates());
    } on DioException catch (e) {
      emit(RegisterFailedStates());


      showSnackBar(e.response?.data['message'],false);


      print(e.response?.data);
      print(e.response?.data['message']);
    }
  }
}
