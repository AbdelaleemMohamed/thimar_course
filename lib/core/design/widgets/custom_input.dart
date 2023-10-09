import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors.dart';

enum InputType { phone, password, normal, email }

class CustomInput extends StatefulWidget {
  final String text;
  final dynamic iconPath;
  final dynamic validator;
  final InputType inputType;
  final TextInputAction inputAction;
  final TextInputType keyboardType;
  final dynamic contrroler;
  final VoidCallback? onPress;

  const CustomInput({
    Key? key,
    this.validator,
    required this.text,
    required this.iconPath,
    this.inputType = InputType.normal,
    this.inputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.contrroler,
    this.onPress,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isPasswordShown = false;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: widget.onPress,
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: TextFormField(
              enabled: widget.onPress != null ? false : true,
              controller: widget.contrroler,
              validator:
                  //widget.validator??

                  (value) {
                if (value == null || value.isEmpty) {
                  return 'هذا الحقل مطلوب';
                }
                return null;
              },
              keyboardType: widget.keyboardType,
              obscureText:
                  widget.inputType == InputType.password && !isPasswordShown,
              textInputAction: widget.inputAction,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15).r,
                      borderSide:
                          BorderSide(color: Color(0xffF3F3F3), width: 2.w)),
                  suffixIcon: widget.inputType == InputType.password
                      ? GestureDetector(
                          onTap: () {
                            isPasswordShown = !isPasswordShown;
                            setState(() {});
                          },
                          child: Icon(isPasswordShown
                              ? Icons.visibility
                              : Icons.visibility_off))
                      : null,
                  prefixIcon: Image.asset(widget.iconPath),
                  icon: widget.inputType == InputType.phone
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 4.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15).r,
                              border: Border.all(
                                  color: Color(0xffF3F3F3), width: 2.w)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              Image.asset("assets/images/sudia.png"),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "+966",
                                style: TextStyle(
                                    fontSize: 15.sp, color: primaryColor),
                              ),
                            ],
                          ),
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  labelText: widget.text,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15).r,
                  ))),
        ),
      );
    });
  }
}
