import 'package:flutter/material.dart';

class AboutApppScreen extends StatelessWidget {
  const AboutApppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text("عن التطبيق", style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 22,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Center(child: Image.asset("assets/images/logo.png")),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(" هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص"
            "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. ",


              style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w200,fontSize: 14,),),
          )
        ],
      ),



    );
  }
}
