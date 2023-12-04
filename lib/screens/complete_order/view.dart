import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_course/screens/home/pages/my_orders/view.dart';
import 'package:thimar_course/screens/home/view.dart';
import '../../core/design/widgets/custom_buttons.dart';
import '../../core/logic/helper_methods.dart';

class CompleteOrderScreen extends StatelessWidget {
  CompleteOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text(
          "اتمام الطلب",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
      ),
      body: ListView(
        children: [
          // Padding(padding: EdgeInsets.only(right: 30,left: 8,),),
          Padding(
            padding: EdgeInsets.only(right: 16.0, left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "الاسم : محمد أحمد",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Theme.of(context).primaryColor),
                ),
                Text(
                  "الجوال : 0502153578",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "اختر عنوان التوصيل",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(2),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  width: 340.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    // color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "طريق الملك عبدالعزيز 119 | المنزل :",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "تحديد وقت التوصيل",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      width: 160.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        // color: Theme.of(context).primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "اختر اليوم والتاريخ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icons/svg/Calendar.svg",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      width: 160.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        // color: Theme.of(context).primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "اختر الوقت",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icons/svg/time.svg",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "ملاحظات وتعليمات",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "اختر طريقة الدفع",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      width: 100.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        // color: Theme.of(context).primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/svg/money.svg",
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Text(
                              "كــاش",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      width: 100.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        // color: Theme.of(context).primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                        "assets/icons/svg/visa.svg",
                      )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      width: 100.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        // color: Theme.of(context).primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Center(
                          child: SvgPicture.asset(
                        "assets/icons/svg/card.svg",
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "ملخص الطلب",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 330,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "اجمالي المنتجات",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          )),
                          Text(
                            "180 ر.س",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "سعر التوصيل",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          )),
                          Text(
                            "40 ر.س",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "الخصم",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          )),
                          Text(
                            "-40 ر.س",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "المجموع",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          )),
                          Text(
                            "140 ر.س",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  onPress: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.white,
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
                                      SvgPicture.asset(
                                          "assets/icons/svg/thanks.svg"),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      Text(
                                        "شكرا لقد تم تنفيذ طلبك بنجاح",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        "يمكنك مراجعة حالة الطلب او الرجوع الي الرئيسية",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 14.sp),
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomSmallButton(
                                            onPress: () {
                                              navigateTo(MyOrdersPage());
                                            },
                                            text: "طلباتي",
                                            isBig: true,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          CustomSmallButton(
                                            onPress: () {
                                              navigateTo(HomeScreen());
                                            },
                                            text: "الرئيسية",
                                            isBig: true,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ));
                  },
                  text: "انهاء الطلب",
                  isBig: true,
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
