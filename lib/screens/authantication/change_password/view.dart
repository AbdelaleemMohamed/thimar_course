import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_course/screens/authantication/change_password/states.dart';
import 'package:thimar_course/screens/authantication/login/view.dart';
import '../../../core/design/colors.dart';
import '../../../core/design/widgets/custom_buttons.dart';
import '../../../core/design/widgets/custom_input.dart';
import '../../../core/logic/helper_methods.dart';
import 'cubit.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String phone,code;

  ChangePasswordScreen({Key? key,  required this.phone, required this.code}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeMessageCubit(),
      child: Builder(
        builder: (context) {
          ChangeMessageCubit cubit = BlocProvider.of(context);
          cubit.phone = widget.phone;
          cubit.code = widget.code;
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
                      "أدخل كلمة المرور الجديدة",
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomInput(
                      contrroler: cubit.passwordController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        }
                        return null;
                      },
                      text: "كلمة المرور",
                      inputType: InputType.password,
                      iconPath: 'assets/icons/password.png',
                    ),
                    CustomInput(
                      text: "تأكيد كلمة المرور",
                      inputType: InputType.password,
                      inputAction: TextInputAction.done,
                      iconPath: 'assets/icons/password.png',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    BlocConsumer(
                      listener: (context, state) {
                        if (state is ChangePasswordSuccessStates) {
                          navigateTo(LoginScreen());
                        }
                      },
                      bloc: cubit,
                      builder: (context, state) {
                        if (state is ChangePasswordLoadingStates) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return CustomElevatedButton(
                            onPress: () {
                              if (formKey.currentState?.validate() == true) {
                                print(cubit.passwordController.text);
                                cubit.reset_password();
                              }
                            },
                            text: "تأكيد رقم الجوال",
                          );
                        }
                      },
                    ),


                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " لديك حساب بالفعل ؟",
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
