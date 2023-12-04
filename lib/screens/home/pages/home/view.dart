import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_course/screens/home/pages/home/categories/cubit.dart';
import 'package:thimar_course/screens/home/pages/home/categories/states.dart';
import 'package:thimar_course/screens/home/pages/home/products/cubit.dart';
import 'package:thimar_course/screens/home/pages/home/products/states.dart';
import 'package:thimar_course/screens/home/pages/home/slider/cubit.dart';
import '../../../../core/design/widgets/custom_buttons.dart';
import '../../../../core/logic/helper_methods.dart';
import '../../../cart/view.dart';
import '../../../product_ditails/view.dart';
import '../../widgets/main_app_bar.dart';
import 'slider/states.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int currentIndex = 0;

class _HomePageState extends State<HomePage> {
  late SliderCubit sliderCubit;
  late CategoriesCubit categoriesCubit;
  late ProductCubit productCubit;

  @override
  void initState() {
    super.initState();
    sliderCubit = BlocProvider.of(context);
    categoriesCubit = BlocProvider.of(context);
    productCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: ListView(
        // padding: EdgeInsets.symmetric(vertical: 16.w),
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
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

          BlocBuilder(
            bloc: sliderCubit,
            builder: (context, state) {
              print(state);
              if(state is GetSliderFailedState)
                {
                  return Text(state.msg);
                }else if (state is GetSliderSuccessState)
                  {
                   return Column(
                     children: [
                       SizedBox(
                            height: 164.h,
                            // width: 375.h,
                            child:
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 164.h,
                                onPageChanged: (index, reason) {
                                  currentIndex = index;
                                  setState(() {});
                                },
                                // enlargeCenterPage: true,
                                autoPlay: true,
                                viewportFraction: 1
                              ),
                              items: List.generate(
                                state.list.length,
                                    (index) => Image.network(
                                  state.list[index].image,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )

                       ),


                       SizedBox(
                         height: 10.h,
                       ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            state.list.length,
                            (index) => Padding(
                                  padding: EdgeInsetsDirectional.only(end: 3),
                                  child: CircleAvatar(
                                      radius: 3.5.r,
                                      backgroundColor: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(currentIndex == index
                                              ? 1
                                              : 0.38)),
                                ))),
                  ],
                   );
                  }else
                    {
                      return SizedBox(height: 164.h,child: Center(child: CircularProgressIndicator()));
                    }
            },
          ),

          BlocBuilder(
            bloc: categoriesCubit,
            builder: (context, state) {
              print(state);
              if(state is GetCategoriesFailedState)
                {
                  return Text(state.msg);
                }else if (state is GetCategoriesSuccessState)
                  {
                   return Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(16),
                         child: Row(
                           children: [
                             Text(
                               "الاقسام",
                               style: TextStyle(
                                   fontSize: 16.sp,
                                   fontWeight: FontWeight.w900,
                                   color: Colors.black),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 70.h,
                         child: ListView.builder(
                           itemBuilder: (context, index) => Container(
                             color: Colors.white,
                             margin: EdgeInsets.symmetric(horizontal: 16),
                             width: 70.h,
                             child: Column(
                               children: [
                                 Expanded(
                                     child: Container(
                                         // padding: EdgeInsets.all(15.r),
                                         clipBehavior: Clip.antiAlias,
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10),
                                         ),
                                         child: Image.network(state.list[index].image))),
                                 SizedBox(
                                   height: 5.h,
                                 ),
                                 Text(
                                   state.list[index].name,
                                   style: TextStyle(
                                       fontSize: 16.sp,
                                       fontWeight: FontWeight.w500,
                                       color: Theme.of(context).primaryColor),
                                 )
                               ],
                             ),
                           ),
                           itemCount: state.list.length,
                           scrollDirection: Axis.horizontal,
                         ),
                       ),
                       SizedBox(
                         height: 10.h,
                       ),
                     ],
                   );
                  }else
                    {
                      return SizedBox(height: 70.h,child: Center(child: CircularProgressIndicator()));
                    }
            },
          ),


          BlocBuilder(
            bloc: productCubit,
            builder: (context, state) {
              print(state);
              if(state is GetProductsFailedState)
              {
                return Text(state.msg);
              }else if (state is GetProductsSuccessState)
              {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "الاصــنــاف",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){navigateTo(ProductDetailsScreen());},
                      child: GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.list.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 160 / 260,
                              crossAxisSpacing: 16.h,
                              mainAxisSpacing: 16.h),
                          itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.all(9.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(11.r),
                                  child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Image.network(state.list[index].mainImage,height: 117.h ,width: 145.w,fit: BoxFit.fill,),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 3.w, horizontal: 10.h),
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 4.0),
                                          child: Text(state.list[index].discount.toString()+ " % ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadiusDirectional.only(
                                            bottomStart: Radius.circular(11),
                                          ),
                                          color: Theme.of(context).primaryColor.withOpacity(0.85),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  state.list[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor),
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
                                    text:  state.list[index].price.toString()+ " ر.س | " ,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: state.list[index].priceBeforeDiscount.toString(),
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ])),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                                    child: CustomSmallButton(
                                      isBig: true,
                                      onPress: () {
                                        navigateTo(CartScreen());
                                      },
                                      text: "أضف للسلة ",
                                    ),
                                  ),
                                )
                              ],
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


                    SizedBox(
                      height: 20,
                    ),

                  ],
                );
              }else
              {
                return SizedBox(height: 164.h,child: Center(child: CircularProgressIndicator(),));
              }
            },
          ),

        ],
      ),
    );
  }
}
