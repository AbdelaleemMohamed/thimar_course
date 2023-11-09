import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text(
          "السلة",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            "https://pixnio.com/free-images/2017/09/19/2017-09-19-07-03-42-1100x729.jpg",
                            height: 70,
                            width: 90,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "طماطم",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                "45 ر.س",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                height: 25,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.2)),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 4, right: 2),
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                          child: Text(
                                        "+",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 18),
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
                                        "5",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).primaryColor,
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
                                          child: Text(
                                        "-",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 18),
                                      )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          padding: EdgeInsets.only(top: 6),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.red.withOpacity(0.3),
                          ),
                          child: Center(
                              child: SvgPicture.asset("assets/icons/svg/delet.svg")

                          ),
                        ),
                      ],
                    ),
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 12,),
                itemCount: 4),
          ),
         Row(
           children: [
            Text("عندك كوبون ؟ ادخل رقم الكوبون") 
           ],
         ) ,
        ],
      ),
    );
  }
}
