import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thimar_course/screens/home/pages/favs/view.dart';
import 'package:thimar_course/screens/home/pages/home/view.dart';
import 'package:thimar_course/screens/home/pages/my_account/view.dart';
import 'package:thimar_course/screens/home/pages/my_orders/view.dart';
import 'package:thimar_course/screens/home/pages/notification/view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> titels = ["الرئيسية", "طلباتي", "الاشعارات", "المفضلة", "حسابي"];
  List<String> iocns = [
    "home",
    "my_orders",
    "notifications",
    "favs",
    "my_account"
  ];
  List<Widget> pages = [
    HomePage(),
    MyOrdersPage(),
    NotificationPage(),
    FavsPage(),
    MyAccountPage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages [currentPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            currentPage = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xffAED489),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: Theme.of(context).primaryColor,
          items: List.generate(
            titels.length,
            (index) => BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: SvgPicture.asset(
                    "assets/icons/svg/${iocns[index]}.svg",
                    color:
                        currentPage == index ? Colors.white : Color(0xffAED489),
                  ),
                ),
                label: titels[index]),
          )),
    );
  }
}
