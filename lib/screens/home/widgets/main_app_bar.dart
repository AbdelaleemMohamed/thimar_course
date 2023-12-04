import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_course/core/design/widgets/icon_app_bar.dart';
import 'package:thimar_course/screens/cart/view.dart';

import '../../../core/logic/helper_methods.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, right: 8.h),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 30.h,
              width: 30.h,
            ),
            SizedBox(
              width: 3.h,
            ),
            Center(
                child: Text(
              "سلة ثمار",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 14.sp),
            )),
            SizedBox(
              width: 28.h,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "التوصيل الي",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 12.sp),
                ),
                Text(
                  "شارع الملك فهد جدة",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 14.sp),
                ),
              ],
            ),
            SizedBox(
              width: 75.h,
            ),
            Stack(
              children: [
                IconAppBar(
                  onPress: () {
                    navigateTo(CartScreen());

                  },
                  iconName: "cart",
                ),
                CircleAvatar(
                  radius: 5,
                  backgroundColor: Theme.of(context).primaryColor ,
                  child: Text("4",style: TextStyle(fontSize: 5.sp , fontWeight: FontWeight.bold,color: Colors.white),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45.h);
}
