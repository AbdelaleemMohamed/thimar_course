import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_course/core/design/colors.dart';
import 'package:thimar_course/core/design/colors.dart';
enum ButtonType { rejectButton, outlineButton, cancelButton, elevatedButton }

class CustomButton extends StatelessWidget {
  final String text;
  final ButtonType buttonType;
  final VoidCallback onPress;


  const CustomButton(
      {Key? key,
      this.buttonType = ButtonType.elevatedButton,
      this.text = "",
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.cancelButton:
        return CancelButton(
          text: text,
          onPress: onPress,
        );
      case ButtonType.rejectButton:
        return CustomRejectButton(
          text: text,
          onPress: onPress,
        );
      case ButtonType.outlineButton:
        return CustomOutlineButton(
          text: text,
          onPress: onPress,
        );
      case ButtonType.elevatedButton:
        return CustomElevatedButton(
          text: text,
          onPress: onPress,
        );
    }
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;


  const CustomElevatedButton({Key? key, this.text = "", required this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff4C8613).withOpacity(0.19),
          blurRadius: 6.r,
          offset: Offset(0.w, 3.h),
        )
      ]),
      child: ElevatedButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          onPress();
        },
        child: Text(text),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(343.w, 60.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15).r)),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final bool opacity;

  const CustomOutlineButton(
      {Key? key, this.text = "", this.opacity = true, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      child: opacity
          ? SizedBox(
              height: 48.h,
            )
          : DecoratedBox(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.19),
                  blurRadius: 6.r,
                  offset: Offset(0.w, 3.h),
                )
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      onPress();
                    },
                    child: Text(text),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(color: primaryColor),
                        fixedSize: Size(133.w, 47.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15).r)),
                  ),
                ],
              ),
            ),
    );
  }
}

class CustomRejectButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const CustomRejectButton({Key? key, this.text = "", required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff4C8613).withOpacity(0.19),
          blurRadius: 6.r,
          offset: Offset(0.w, 3.h),
        )
      ]),
      child: ElevatedButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          onPress();
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            fixedSize: Size(163.w, 60.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15).r)),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  final String text;

  final VoidCallback onPress;

  const CancelButton({Key? key, this.text = "", required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xffFFE1E1),
          blurRadius: 6.r,
          offset: Offset(0.w, 3.h),
        )
      ]),
      child: ElevatedButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          onPress();
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.red),
        ),
        style: ElevatedButton.styleFrom(
            primary: Color(0xffFFE1E1),
            fixedSize: Size(343.w, 60.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15).r)),
      ),
    );
  }
}
