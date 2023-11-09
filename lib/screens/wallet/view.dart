import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/design/widgets/custom_buttons.dart';
import '../../core/logic/helper_methods.dart';
import '../cart/view.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Center(
              child: Text(
            "الـمـحـفـظـة",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Theme.of(context).primaryColor),
          )),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Text(
                "رصيدك",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "255 ر.س",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 10,
              ),
              CustomOutlineButton(
                text: "اشحن الان",
                opacity: false,
                onPress: () {
                  navigateTo(CartScreen());

                },
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "سجل المعاملات",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Text(
                      "عرض الكل",
                      style: TextStyle(
                          fontSize: 16, color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ItemWallet(isPay: false),
              ItemWallet(isPay: false),
              ItemWallet(isPay: true),
              ItemWallet(isPay: true),
              ItemWallet(isPay: false),
              ItemWallet(isPay: false),
              ItemWallet(isPay: true),

            ],
          )
        ],
      ),
    );
  }
}

class ItemWallet extends StatelessWidget {
   ItemWallet({Key? key,this.isPay=false}) : super(key: key);
bool isPay = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 12,left: 12,right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(isPay?"assets/icons/svg/Arrow - bottom.svg":"assets/icons/svg/Arrow - Top.svg"),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Text(
                  "شحن المحفظة",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )),
                Text(
                  "22 يونيو",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),

            Text(
              "       255 ر.س",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).primaryColor),
            ),



          ],
        ),

      );

  }
}
