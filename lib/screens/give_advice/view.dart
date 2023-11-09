import 'package:flutter/material.dart';
import 'package:thimar_course/core/design/widgets/custom_buttons.dart';
import 'package:thimar_course/core/design/widgets/custom_input.dart';

class GiveAdviceScreen extends StatelessWidget {
  const GiveAdviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text("الاقتراحات والشكاوي", style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 22,fontWeight: FontWeight.bold),),
      ),
      body:
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                CustomInput(text: "الاسم", iconPath: "assets/images/User.png"),
                CustomInput(text: "رقم الموبايل", iconPath: "assets/images/Phone.png", keyboardType: TextInputType.phone,),
                CustomInput(text: "الموضوع", iconPath: "assets/images/Edit - 3.png",),
                CustomElevatedButton(onPress: (){},text: "ارسال",)
              ],
            ),
          )


    );
  }
}
