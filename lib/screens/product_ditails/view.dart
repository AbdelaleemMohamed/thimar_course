import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_course/core/logic/helper_methods.dart';
import 'package:thimar_course/screens/home/pages/favs/view.dart';
import '../../core/design/widgets/icon_app_bar.dart';
import '../cart/view.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

int currentIndex = 0;
late int text = 1;

final List<String> imageUrls = [
  'https://i.ytimg.com/vi/jBW-ATo9bGI/maxresdefault.jpg',
  'https://agrohemija.com.mk/wp-content/uploads/2018/05/FreeGreatPicture.com-11984-tomatoes-features.jpg',
  'https://i.pinimg.com/originals/14/3a/90/143a90aca4745cf4e6e381a0d4d43e2e.jpg',
  'https://gardenseedsmarket.com/images/watermarked/5/thumbnails/1205/749/detailed/31/pomidor_betalux_(2)_r.jpg',
];

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 230,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          height: 220.h,
                          onPageChanged: (index, reason) {
                            currentIndex = index;
                            setState(() {});
                          },
                          // enlargeCenterPage: true,
                          autoPlay: true,
                          viewportFraction: 1),
                      items: List.generate(
                        imageUrls.length,
                        (index) => Image.network(
                          imageUrls[index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconAppBar(
                        onPress: () {
                          navigateTo(FavsPage());
                        },
                        iconName: 'heart-empty',
                      ),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      imageUrls.length,
                      (index) => Padding(
                            padding: EdgeInsetsDirectional.only(end: 3),
                            child: CircleAvatar(
                                radius: 3.5.r,
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(
                                        currentIndex == index ? 1 : 0.38)),
                          ))),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "طماطم",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 95,
                        ),
                        Text(
                          "40%",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "45 ر.س",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "56 ر.س",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "السعر / 1 كجم",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 103,
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 4, right: 2),
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.2),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                          child: GestureDetector(
                                        onTap: () {
                                          text++;
                                          setState(() {});
                                        },
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .primaryColor,
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
                                          child: GestureDetector(
                                        onTap: () {
                                          if (text > 1) text--;
                                          setState(() {});
                                        },
                                        child: Text(
                                          "-",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 18),
                                        ),
                                      )),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "كود المنتج : ",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "56638",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "تفاصيل المنتج : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    Divider(),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "التقييمات : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      height: 90,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) => Container(
                          width: 310,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "محمد علي",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 30,
                                          width: 110,
                                          child: RatingBar.builder(
                                            initialRating: 3,
                                            itemSize: 20,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 1.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص .",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                trailing: ClipRRect(
                                    child: Image.network(
                                      "https://d3b3by4navws1f.cloudfront.net/152731256.jpg",
                                      height: 100.h,
                                      width: 50.w,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          width: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "منتجات مشابهة : ",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      height: 210,
                      width: double.infinity,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                                padding: EdgeInsets.all(9.r),
                                child: GestureDetector(
                                  onTap: () {
                                    navigateTo(ProductDetailsScreen());
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(11.r),
                                        child: Stack(
                                          alignment: Alignment.topLeft,
                                          children: [
                                            Image.network(
                                              "https://gardenseedsmarket.com/images/watermarked/5/detailed/31/pomidor-saint-pierre-nasiona-2.jpg",
                                              height: 117.h,
                                              width: 145.w,
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 3.w,
                                                  horizontal: 10.h),
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 4.0),
                                                child: Text(" % 20 ",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .only(
                                                  bottomStart:
                                                      Radius.circular(11),
                                                ),
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.85),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "طماطم",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "سعر" + " 1 " + "كجم",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 14,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text: " 65 ر.س | ",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: "85",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ])),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        offset: Offset(0, 1),
                                        blurRadius: 2.r)
                                  ],
                                ),
                              )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: ListTile(
          minLeadingWidth: 10,
          horizontalTitleGap: 8,
          leading: Container(
            padding: EdgeInsets.all(4),
            height: 30,
            width: 30,
            child: SvgPicture.asset("assets/icons/svg/shoppingcart.svg"),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          title: GestureDetector(
            onTap: (){navigateTo(CartScreen());},
            child: Text(
              "أضف الي السلة",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          trailing: Text(
            "225 ر.س",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
