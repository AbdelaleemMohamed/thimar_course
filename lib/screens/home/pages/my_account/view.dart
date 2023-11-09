import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:thimar_course/screens/authantication/profile/view.dart';

import '../../../../core/logic/helper_methods.dart';
import '../../../about_app/view.dart';
import '../../../addresses/view.dart';
import '../../../authantication/login/view.dart';
import '../../../contact_us/view.dart';
import '../../../faqs/view.dart';
import '../../../give_advice/view.dart';
import '../../../privacy/view.dart';
import '../../../wallet/view.dart';
import '../../widgets/my_account_row.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(bottom: 10),
        children: [
          Container(
            height: 200,
            width: 375,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white.withOpacity(0.05),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white.withOpacity(0.05),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white.withOpacity(0.05),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "حــــسابي",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://img.freepik.com/free-photo/handsome-cheerful-man-with-happy-smile_176420-18028.jpg?w=740&t=st=1697112947~exp=1697113547~hmac=ca1ac819bd6606679753579fc68bcebeca023a0323b3f17a4722fd8bcd779087",
                        ),
                        radius: 30,
                        backgroundColor: Colors.white),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "اســـم المــستــخدم",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70)),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          MyAccountRow(text: "البيانات الشخصية", image: "User", onTap: (){navigateTo(ProfileScreen());}),
          MyAccountRow(text: "المحفظة", image: "Wallet", onTap: (){navigateTo(WalletScreen());}),
          MyAccountRow(text: "العناوين", image: "Location", onTap: (){navigateTo(AddressesScreen());}),
          MyAccountRow(text: "أسئلة متكررة", image: "Question", onTap: (){navigateTo(FaqsScreen());}),
          MyAccountRow(text: "سياسة الخصوصية", image: "Shield - check", onTap: (){navigateTo(PrivacyScreen());}),
          MyAccountRow(text: "تواصل معنا", image: "Call - Calling", onTap: (){navigateTo(ContactUsScreen());}),
          MyAccountRow(text: "الشكاوي والاقتراحات", image: "Edit", onTap: (){navigateTo(GiveAdviceScreen());}),
          // MyAccountRow(text: "مشاركة التطبيق", image: "Share", onTap: (){navigateTo(LoginScreen());}),
          MyAccountRow(text: "عن التطبيق", image: "Info", onTap: (){navigateTo(AboutApppScreen());}),
          // MyAccountRow(text: "تغيير اللغة", image: "Translate", onTap: (){navigateTo(LoginScreen());}),
          // MyAccountRow(text: "الشروط والاحكام", image: "Note", onTap: (){navigateTo(LoginScreen());}),
          // MyAccountRow(text: "تقييم التطبيق", image: "Star", onTap: (){navigateTo(LoginScreen());}),
          MyAccountRow(text: "تسجيل الدخول", image: "Turn off", onTap: (){navigateTo(LoginScreen());}),



          






        ],
      ),
    );
  }
}
