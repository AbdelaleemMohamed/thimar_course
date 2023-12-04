import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_course/core/design/widgets/custom_buttons.dart';
import '../../core/logic/helper_methods.dart';
import '../complete_order/view.dart';

class CartScreen extends StatefulWidget {
   CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
late int text = 1 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text(
          "السلة",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            "https://pixnio.com/free-images/2017/09/19/2017-09-19-07-03-42-1100x729.jpg",
                            height: 70,
                            width: 90,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "طماطم",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                "45 ر.س",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                height: 25,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.2)),
                                child: Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 4, right: 2),
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                          child: GestureDetector(onTap: (){
                                            text++;
                                            setState(() {

                                            });
                                          },
                                            child: Text(
                                        "+",
                                        style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Theme.of(context).primaryColor,
                                              fontSize: 18),
                                      ),
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 4),
                                      padding: EdgeInsets.only(top: 2),
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "$text",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 14),
                                      )),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                          child: GestureDetector(onTap: (){
                                            if(text > 1)
                                            text--;
                                            setState(() {

                                            });
                                          },
                                            child: Text(
                                        "-",
                                        style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Theme.of(context).primaryColor,
                                              fontSize: 18),
                                      ),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          padding: EdgeInsets.only(top: 6),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.red.withOpacity(0.3),
                          ),
                          child: Center(
                              child: SvgPicture.asset(
                                  "assets/icons/svg/delet.svg")),
                        ),
                      ],
                    ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                      height: 12,
                    ),
                itemCount: 8),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, right: 16, left: 16, bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: TextStyle(fontSize: 18),
                    keyboardType: TextInputType.phone,
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                      filled: true,

                      label: Text(
                        "عندك كوبون ؟ ادخل رقم الكوبون",
                        style: TextStyle(fontSize: 12),
                      ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15).r,
                        ),
                      isDense: true,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                CustomSmallButton(
                  onPress: () {},
                  text: "تطبيق",
                  isBig: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 12.0 ,top: 12),
            child: Center(
              child: Text(
                "جميع الاسعار تشمل قيمة الضريبة المضافة 15%",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            width: 330,
            height: 95,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
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
              navigateTo(CompleteOrderScreen());
            },
            text: "الانتقال لاتمام الطلب",
            isBig: true,
          ),
          SizedBox(height: 16.h,),
        ],
      ),
    );
  }
}
