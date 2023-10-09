import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thimar_course/screens/authantication/change_password/view.dart';
import 'package:thimar_course/screens/authantication/login/view.dart';
import 'package:thimar_course/screens/authantication/verify_code/states.dart';
import '../../../core/design/colors.dart';
import '../../../core/design/widgets/custom_buttons.dart';
import '../../../core/logic/helper_methods.dart';
import 'cubit.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String phone;
   VerifyCodeScreen({Key? key,required this.phone}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool hide = true;
  final formKey = GlobalKey<FormState>();
  //final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCodeCubit(),

      child: Builder(
        builder: (context) {
          VerifyCodeCubit cubit = BlocProvider.of(context);
          cubit.phone = widget.phone;


          return Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key:formKey ,
              child: SafeArea(
                child: ListView(
                  padding: EdgeInsets.all(16).h,
                  children: [
                    Center(child: Image.asset("assets/images/logo.png")),
                    SizedBox(
                      height: 24.h,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "نسيت كلمة المرور",
                        style: TextStyle(fontSize: 16.sp, color: primaryColor),
                      ),
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
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    PinCodeTextField(
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

                      controller: cubit.codeController,

                      pinTheme: PinTheme(


                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedColor: Color(0xfc6ba542),
                        activeColor: Color(0xff4C8613),
                        inactiveColor: Color(0xffF3F3F3),
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15).r,
                        fieldHeight: 70.h,
                        fieldWidth: 70.w,
                        activeFillColor: Colors.white,


                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        debugPrint("Completed");

                      },
                      onChanged: (value) {
                        debugPrint(value);
                         (String? value) {
                          if (value!.isEmpty) {
                            return 'هذا الحقل مطلوب';
                          }
                          return null;
                        };
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");

                        return true;
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    BlocConsumer(
                      listener: (context, state) {
                        if (state is VerifyCodeSuccessStates) {
                          navigateTo(ChangePasswordScreen(code: cubit.codeController.text,phone: widget.phone,));
                        }
                      },
                      bloc: cubit,
                      builder: (context, state) {
                        if (state is VerifyCodeLoadingStates) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return CustomElevatedButton(
                            onPress: () {
                              print ("hello");
                              if (formKey.currentState?.validate() == true) {
                                print("-00-0-0-0-0  xx");

                                cubit.check_code();
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        initialDuration: 0,
                        duration: 120,
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
                        isTimerTextShown: true,
                        autoStart: true,
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
