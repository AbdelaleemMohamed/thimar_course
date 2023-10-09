import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_course/screens/authantication/forget_password/states.dart';
import 'package:thimar_course/screens/authantication/login/view.dart';
import 'package:thimar_course/screens/authantication/verify_code/view.dart';

import '../../../core/design/colors.dart';
import '../../../core/design/widgets/custom_buttons.dart';
import '../../../core/design/widgets/custom_input.dart';
import '../../../core/logic/helper_methods.dart';
import 'cubit.dart';

class ForgetPasswordScreen extends StatefulWidget {

  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: Builder(
        builder: (context) {

          ForgetPasswordCubit cubit = BlocProvider.of(context);

          return Scaffold(
            backgroundColor: Colors.white,
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
                      "نسيت كلمة المرور",
                      style: TextStyle(fontSize: 16.sp, color: primaryColor),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "أدخل رقم الجوال المرتبط بحسابك",
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    CustomInput(
                      contrroler: cubit.phoneController,
                      keyboardType: TextInputType.phone,

                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        }
                        return null;
                      },
                      text: " رقم الجوال",
                      iconPath: 'assets/icons/phone.png',
                      inputType: InputType.phone,
                      inputAction: TextInputAction.done,
                    ),

                    BlocConsumer(
                      listener: (context, state) {
                        if (state is ForgetPasswordSuccessStates) {
                          navigateTo(VerifyCodeScreen(phone:  cubit.phoneController.text,));
                        }
                      },
                      bloc: cubit,
                      builder: (context, state) {
                        if (state is ForgetPasswordLoadingStates) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return CustomElevatedButton(
                            onPress: () {
                              if (formKey.currentState?.validate() == true) {
                                print(cubit.phoneController.text);
                              //  cubit.phone=
                                cubit.forget_password();
                              }
                            },
                            text: "تأكيد رقم الجوال",
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
                          " لديك حساب بالفعل؟",
                          style: TextStyle(fontSize: 15.sp, color: primaryColor),
                        ),
                        TextButton(
                            onPressed: () {
                              navigateTo(LoginScreen());
                            },
                            child: Text(
                              "تسجيل الدخول",
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
        }
      ),
    );
  }
}
