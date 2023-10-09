import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thimar_course/screens/authantication/login/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg.png",
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
              child: Image.asset(
            "assets/images/logo.png",
            width: 159.57,
            height: 159.57,
          )),
        ],
      ),
    );
  }
}
