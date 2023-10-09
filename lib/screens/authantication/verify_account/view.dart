import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar_course/screens/authantication/login/view.dart';
import 'package:thimar_course/screens/authantication/verify_account/cibit.dart';
import 'package:thimar_course/screens/authantication/verify_account/states.dart';
import '../../../core/design/colors.dart';
import '../../../core/design/widgets/custom_buttons.dart';
import '../../../core/logic/helper_methods.dart';
import '../../home/pages/home/view.dart';

class VerifyAccountScreen extends StatefulWidget {
  final bool isAccount;
  final String phone;


   VerifyAccountScreen({Key? key, required this.isAccount,required this.phone})
      : super(key: key);

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  bool hide = true;
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => VerifyAccountCubit(),

      child: Builder(
        builder: (context) {
          VerifyAccountCubit cubit = BlocProvider.of(context);
          cubit.phone = widget.phone;
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "تفعيل الحساب",
                          style: TextStyle(fontSize: 16.sp, color: primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال",
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Text(
                          "+9660548745",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "تغيير رقم الهاتف",
                              style: TextStyle(
                                  fontSize: 16.h,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    PinCodeTextField(
                      controller: cubit.codeController,
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return " I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedColor: Color(0xfc6ba542),
                        activeColor: Color(0xff4C8613),
                        inactiveColor: Color(0xffF3F3F3),
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15).r,
                        fieldHeight: 70,
                        fieldWidth: 70,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    BlocConsumer(
                      listener: (context, state) {
                        if (state is VerifyAccountSuccessStates) {
                          navigateTo(HomePage());
                        }
                      },
                      bloc: cubit,
                      builder: (context, state) {
                        if (state is VerifyAccountLoadingStates) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return CustomElevatedButton(
                            onPress: () {
                              if (formKey.currentState?.validate() == true) {
                                cubit.verify();
                              }
                            },
                            text: "تأكيد الكود",
                          );
                        }
                      },
                    ),


                    SizedBox(
                      height: 16.h,
                    ),
                    Column(
                      children: [
                        Text(
                          "لم تستلم الكود ؟",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff707070)),
                        ),
                        Text(
                          "يمكنك إعادة إرسال الكود بعد",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff707070)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    if (hide)
                      CircularCountDownTimer(
                        duration: 60,
                        width: 66.w,
                        height: 70.h,
                        ringColor: Colors.grey[300]!,
                        fillColor: Theme.of(context).primaryColor,
                        backgroundColor: Colors.transparent,
                        strokeWidth: 3.0.w,
                        strokeCap: StrokeCap.round,
                        textFormat: CountdownTextFormat.MM_SS,
                        textStyle: TextStyle(
                          fontSize: 21.0.sp,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.normal,
                        ),
                        isReverse: true,
                        isReverseAnimation: true,
                        onComplete: () {
                          hide = false;

                          setState(() {});
                          debugPrint('Countdown Ended');
                        },
                      ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomOutlineButton(
                        onPress: () {
                          hide = true;
                          setState(() {});
                        },
                        text: "اعادة الارسال",
                        opacity: hide),
                    SizedBox(
                      height: 10.h,
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
                              style:
                                  TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
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
