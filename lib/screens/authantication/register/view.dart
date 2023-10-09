import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_course/core/logic/helper_methods.dart';
import 'package:thimar_course/screens/authantication/login/view.dart';
import 'package:thimar_course/screens/authantication/register/states.dart';
import 'package:thimar_course/screens/authantication/verify_account/view.dart';
import '../../../core/design/colors.dart';
import '../../../core/design/widgets/custom_buttons.dart';
import '../../../core/design/widgets/custom_input.dart';
import '../login/states.dart';
import 'cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(builder: (context) {
        RegisterCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Form(
            key: formKey,
            child: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(16).h,
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
                    height: 5.h,
                  ),
                  Text(
                    "يمكنك تسجيل حساب جديد الان",
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomInput(
                    contrroler: cubit.fullnameController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                    text: "اسم المستخدم",
                    iconPath: 'assets/icons/person.png',
                  ),
                  CustomInput(
                    contrroler: cubit.phoneController,
                    text: " رقم الجوال",
                    iconPath: 'assets/icons/phone.png',
                    inputType: InputType.phone,
                    keyboardType: TextInputType.phone,
                  ),
                  CustomInput(
                    onPress: () async {
                       await showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),
                          builder: (context) => SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text(
                                          "اختار مدينتك",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(
                                              40,
                                              (index) => Container(

                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context,
                                                            "City $index");
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 16),
                                                        child: Column(
                                                          children: [
                                                            Text("City $index"),
                                                            Divider(
                                                              height: 10,
                                                              color:
                                                                  Colors.green,
                                                              thickness: 0.5,
                                                              indent: 40,
                                                              endIndent: 40,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                    },
                    contrroler: cubit.cityNameController,
                    text: "المدينة",
                    iconPath: 'assets/icons/city.png',
                  ),
                  CustomInput(
                    contrroler: cubit.passwordController,
                    text: "كلمة المرور",
                    inputType: InputType.password,
                    iconPath: 'assets/icons/password.png',
                  ),
                  CustomInput(
                    contrroler: cubit.password_confirmationController,
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
                      if (state is RegisterSuccessStates) {
                        navigateTo(VerifyAccountScreen(
                          isAccount: true,
                          phone: cubit.phoneController.text,
                        ));
                      }
                    },
                    bloc: cubit,
                    builder: (context, state) {
                      if (state is LoginLoadingStates) {
                        return const Center(
                            child: const CircularProgressIndicator());
                      } else {
                        return CustomElevatedButton(
                          onPress: () {
                            if (formKey.currentState?.validate() == true) {
                              cubit.register();
                            }
                          },
                          text: "تسجيل ",
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
      }),
    );
  }
}
