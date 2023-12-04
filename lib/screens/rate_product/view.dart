import 'package:flutter/material.dart';

class RateProductScreen extends StatelessWidget {
  const RateProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تقييم المنتجات" ,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 22,fontWeight: FontWeight.bold), ),

      ),

    );
  }
}
