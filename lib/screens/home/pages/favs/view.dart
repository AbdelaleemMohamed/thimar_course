import 'package:flutter/material.dart';

class FavsPage extends StatelessWidget {
  const FavsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        title: Center(child: Text("المفضلة", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),)),
      ),
    );

  }
}
