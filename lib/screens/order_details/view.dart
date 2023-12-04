import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_course/core/design/widgets/custom_buttons.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leadingWidth: 0,
        title: Center(child: Text("تفاصيل الطلب" ,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 22,fontWeight: FontWeight.bold), )),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(right: 16, left: 16, top: 10),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.withOpacity(0.05),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            "طلب | 2345",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                        width: 110,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Text("بانتظار الموافقة"),),
                      ),
                    ],
                  ),
                  Text(
                    "27 يوليو ، 2021",
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 20,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) => Container(
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Image.network(
                                  "https://pluspng.com/img-png/png-tomato-tomato-png-3531.png",
                                ),
                              ),
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            separatorBuilder: (c, i) {
                              return SizedBox(width: 4);
                            },

                          ),

                        ),

                      ),

                      Text("180 ر.س", style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 14),),
                    ],
                  ),
                ],
              ),
            ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("عنوان التوصيل",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold, fontSize: 20,),),
          ),
          ListTile(
            title: Text("المنزل", style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("شقة 40", style: TextStyle(fontSize: 16,color: Colors.grey),),
                Text("شارع الغليا 1453 | الرياض ، السعودية", style: TextStyle(fontSize: 16,color: Colors.grey),),
              ],
            ),
            trailing: Image.asset("assets/images/group332.png" ,height: 100,width: 100,),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("ملخص الطلب",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold, fontSize: 20,),),
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              width: 330,
              height: 140,
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
                  Divider(
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 54.0,left: 16),
                        child: Text(
                          "تم الدفع بواسطة",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SvgPicture.asset("assets/icons/svg/visacolor.svg"),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CancelButton(onPress: (){},text: "الغاء الطلب",),
      ),


    );
  }
}
