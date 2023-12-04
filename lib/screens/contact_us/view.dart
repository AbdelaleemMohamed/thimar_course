import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/design/widgets/custom_buttons.dart';
import '../../core/design/widgets/custom_input.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: Center(
            child: Text(
          "تواصل معنا",
          style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        )),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/icons/svg/rec.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/svg/Location1.svg"),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                          "13 شارع الملك فهد , جدة , المملكة العربية السعودية ."),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/svg/Calling1.svg"),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(child: Text("+966 054 87452")),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/svg/Message1.svg"),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(child: Text("info@thimar.com ")),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "أو يمكنك ارسال رسالة",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CustomInput(
                        text: "الاسم", iconPath: "assets/images/User.png"),
                    CustomInput(
                      text: "رقم الموبايل",
                      iconPath: "assets/images/Phone.png",
                      keyboardType: TextInputType.phone,
                    ),
                    CustomInput(
                      text: "الموضوع",
                      iconPath: "assets/images/Edit - 3.png",
                    ),
                    CustomElevatedButton(
                      onPress: () {},
                      text: "ارسال",
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
