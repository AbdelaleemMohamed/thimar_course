import 'package:flutter/material.dart';
import 'package:thimar_course/screens/order_details/view.dart';

import '../../../../core/logic/helper_methods.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "طلبـاتـــي",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          )),
          bottom: TabBar(
            automaticIndicatorColorAdjustment: true,
            unselectedLabelColor: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(10),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
            ),
            tabs: [
              Tab(
                child: Text(
                  "الحالية",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  "المنتهية",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
                child: GestureDetector(
                  onTap:(){navigateTo(OrderDetailsScreen());},
                  child: ListView.builder(
              itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(right: 16, left: 16, top: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.withOpacity(0.05),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "طلب | 2345",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                          Container(
                            width: 100,
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(child: Text("جاري التحضير")),
                          )
                        ],
                      ),
                      Text(
                        "27 يونيو ، 2021",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),

                      Row(
                        children: [
                           Expanded(
                             child: SizedBox(
                              height: 20,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) => Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Image.network(
                                      "https://pluspng.com/img-png/png-tomato-tomato-png-3531.png",
                                    ),
                                  ),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                separatorBuilder: (c, i) {
                                  return SizedBox(width: 4);
                                },

                              ),

                          ),

                           ),

                          Text("180 ر.س", style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 14),),



                        ],
                      ),
                    ],
                  ),
              ),
              itemCount: 6,
            ),
                )),
            Center(
                child: GestureDetector(
                  onTap:(){navigateTo(OrderDetailsScreen());},
                  child: ListView.builder(
              itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(right: 16, left: 16, top: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.withOpacity(0.05),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                "طلب | 2345",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                            width: 60,
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                              Colors.red.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(child: Text("منتهي")),
                          )
                        ],
                      ),
                      Text(
                        "27 يوليو ، 2021",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 20,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) => Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Image.network(
                                      "https://pluspng.com/img-png/png-tomato-tomato-png-3531.png",
                                    ),
                                  ),
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                separatorBuilder: (c, i) {
                                  return SizedBox(width: 4);
                                },

                              ),

                            ),

                          ),

                          Text("180 ر.س", style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 14),),



                        ],
                      ),
                    ],
                  ),
              ),
              itemCount: 3,
            ),
                )),
          ],
        ),
      ),
    );
  }
}
