import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/design/widgets/custom_input.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "البيانات الشخصية",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                child: Center(child: GestureDetector(child: SvgPicture.asset("assets/icons/svg/Camera.svg",))),
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(height: 10,),
            Text("اسم المستخدم" , style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 14,fontWeight: FontWeight.bold),),
            Text("96654787856+" , style: TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.3),fontSize: 14,fontWeight: FontWeight.bold),),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomInput(inputType: InputType.normal,iconPath: "assets/icons/person.png", text: 'اسم المستخدم',),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomInput(inputType: InputType.phone,iconPath: "assets/icons/password.png", text: 'رقم الجوال',keyboardType: TextInputType.phone),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomInput(inputType: InputType.normal,iconPath: "assets/icons/city.png", text: 'المدينة',),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomInput(inputType: InputType.password,iconPath: "assets/icons/person.png", text: 'كلمة المرور',),
            ),


          ],
        ),
      ),
    );
  }
}
