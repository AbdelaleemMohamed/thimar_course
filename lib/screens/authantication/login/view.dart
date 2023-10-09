import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_course/screens/authantication/forget_password/view.dart';
import 'package:thimar_course/screens/authantication/login/cubit.dart';
import 'package:thimar_course/screens/authantication/login/states.dart';
import 'package:thimar_course/screens/authantication/register/view.dart';
import '../../../core/design/colors.dart';
import '../../../core/design/widgets/custom_buttons.dart';
import '../../../core/design/widgets/custom_input.dart';
import '../../../core/logic/helper_methods.dart';
import '../../home/pages/home/view.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        LoginCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Form(
            key: formKey,
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.all(16).h,
                children: [
                  Center(child: Image.asset("assets/images/logo.png")),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "مرحبا بك مره أخري",
                    style: TextStyle(fontSize: 16.sp, color: primaryColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "يمكنك تسجيل الدخول الان",
                    style: TextStyle(fontSize: 16.h, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  CustomInput(
                    contrroler: cubit.phoneController,
                    text: " رقم الجوال",
                    iconPath: 'assets/icons/phone.png',
                    inputType: InputType.phone,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  CustomInput(
                    contrroler: cubit.passwordController,
                    text: "كلمة المرور",
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                    inputType: InputType.password,
                    inputAction: TextInputAction.done,
                    iconPath: 'assets/icons/password.png',
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 21).h,
                      child: TextButton(
                          onPressed: () {
                            navigateTo(ForgetPasswordScreen());
                          },
                          child: Text("نسيت كلمة المرور؟")),
                    ),
                  ),
                  BlocConsumer(
                    listener: (context, state) {
                      if (state is LoginSuccessStates) {
                        navigateTo(HomePage());
                      }
                    },
                    bloc: cubit,
                    builder: (context, state) {
                      if (state is LoginLoadingStates) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return CustomElevatedButton(
                          onPress: () {
                            if (formKey.currentState?.validate() == true) {
                              print(cubit.passwordController.text);
                              print(cubit.phoneController.text);
                              cubit.login();
                            }
                          },
                          text: "تسجيل الدخول",
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ليس لديك حساب ؟",
                        style: TextStyle(fontSize: 15.sp, color: primaryColor),
                      ),
                      TextButton(
                          onPressed: () {
                            navigateTo(RegisterScreen());
                          },
                          child: Text(
                            "تسجيل الآن",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
