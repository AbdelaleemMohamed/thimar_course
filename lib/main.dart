import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_course/core/logic/cache_helper.dart';
import 'package:thimar_course/screens/home/pages/home/categories/cubit.dart';
import 'package:thimar_course/screens/home/pages/home/products/cubit.dart';
import 'package:thimar_course/screens/home/pages/home/slider/cubit.dart';
import 'package:thimar_course/screens/home/view.dart';
import 'core/design/colors.dart';
import 'core/logic/cache_helper.dart';
import 'core/logic/helper_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ChacheHelper.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => MultiBlocProvider(
      providers: [
        BlocProvider (create: (BuildContext context) => SliderCubit()..getSlider()),
        BlocProvider (create: (BuildContext context) => CategoriesCubit()..getCategories()),
        BlocProvider (create: (BuildContext context) => ProductCubit()..getProducts()),
      ],
        child: MaterialApp(
          title: "Thimar",
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          builder: (context, child) =>
              Directionality(textDirection: TextDirection.rtl, child: child!),
          theme: ThemeData(
            fontFamily: "Tajawal",
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(color: Colors.white,elevation: 0),
            primarySwatch: getMatrialColor(primaryColor.value),
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}

void showSnackBar(String msg,bool isSuccess) {
  ScaffoldMessenger.of(navigatorKey.currentState!.context)
      .showSnackBar(
      SnackBar(
        backgroundColor: isSuccess?Colors.green:Colors.red,
    content: Text(msg, style: TextStyle(fontSize: 16, fontFamily: "Tajawal"),),
    duration: Duration(seconds: 2),));
}
