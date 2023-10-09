// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/main_app_bar.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}
List <String> images = [
  "https://lh3.googleusercontent.com/mS-fflRGaT1EaI3QMcA4F8jHeHJw3DJrRarvBaaXc0JZAPWAVEccG1k1tvJzaRn6hLg8",
  "https://avatars.mds.yandex.net/i?id=3d65b931577be1e218a0b459afba01b0699fc06f-10023438-images-thumbs&n=13",
  "https://lh3.googleusercontent.com/pYVMBG_z2Jf34fQlA19gA_2ZN9V5XLqN0-SSFQFWW8ohLauRQ_1Xrf2GQAJtkXMIAHLP=h500",
  "https://jofo.me/data/userfiles/106/images/2047368-naslovna.jpg"
];

int currentIndex = 0 ;
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: ListView(
        // padding: EdgeInsets.symmetric(vertical: 16.w),
        children: [
          Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                fillColor: Color(0xff4C8613).withOpacity(.03),
                labelText: "ابحث عما تريد",
                labelStyle: TextStyle(color: Color(0xffB9C9A8)),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset("assets/icons/svg/search.svg"),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15).r,
                    borderSide: BorderSide.none),

              ))),

    //       SizedBox(
    //         height: 164.h,
    //         width: 375.h,
    //         child: CarouselSlider(
    //           options: CarouselOptions(height: 164, onPageChanged: (index , reason) => currentIndex  = index ;
    //           setState((){
    //
    // });
    //               ,enlargeCenterPage: true, autoPlay: true),
    //
    //           items: List.generate(images.length, (index) => Image.network(
    //        images[index],fit: BoxFit.fill,),),)
    //         )
    //

        ],
      ),
    );
  }
}
