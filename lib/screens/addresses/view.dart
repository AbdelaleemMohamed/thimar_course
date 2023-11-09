import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_course/core/design/widgets/custom_buttons.dart';

import '../../core/logic/helper_methods.dart';
import '../add_adress/view.dart';
import '../cart/view.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "العناوين",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body:
            GridView.builder(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 360 / 100,
                  mainAxisSpacing: 10.h),
              itemBuilder: (BuildContext context, int index) => Container(
                padding: EdgeInsets.only(right: 8, top: 4, left: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1.w)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "المنزل",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                        Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SvgPicture.asset(
                              "assets/icons/svg/Edit - 2.svg",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/svg/delet.svg",
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "طريق الملك عبدالعزيز 119 | العنوان :",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 15),
                    ),
                    Text(
                      "الوصف : ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      "الجوال : ",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(onPress: (){
        navigateTo(AddAdressScreen());

      },text: "اضافه عنوان",),
        );

  }
}
