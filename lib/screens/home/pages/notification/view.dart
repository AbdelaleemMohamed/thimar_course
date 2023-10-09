
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "الاشعارات",
          style: TextStyle(
              color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) => ItemNotifocation(),
        itemCount: 3,
      ),
    );
  }
}

class ItemNotifocation extends StatelessWidget {
  const ItemNotifocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsetsDirectional.only(start : 10 , bottom: 6 , end: 11 ,top: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 5), blurRadius: 10, color: Color(0x01000000))
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      // color: Colors.green,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.13),
              borderRadius: BorderRadius.circular(9)
            ),
            child: Image.network(
              "https://cdn-icons-png.flaticon.com/128/953/953810.png?ga=GA1.1.68093170.1641081572",
              width: 19.5,
              height: 19.5,
              errorBuilder: (context , error, stackTrace) => Text("Image not founded"),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تم قبول طلبك وجاري تحضيره الأن",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى ",
                  style: TextStyle(fontSize: 10, color: Color(0xff989898)),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "منذ ساعتان",
                  style: TextStyle(fontSize: 10, color: Color(0xff091022)),
                ),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
          )
        ],
      ),
      margin: EdgeInsetsDirectional.only(top: 16),
    );
  }
}
