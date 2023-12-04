import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "أسئلة متكررة",
            style: TextStyle(
                fontSize: 22,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                initiallyExpanded: false,
                controlAffinity: ListTileControlAffinity.trailing,
                childrenPadding: EdgeInsets.symmetric(horizontal: 10),
                title: Text(
                  'كيفية الدفع عن طريق البطاقة الإئتمانيه؟',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                trailing: Container(
                  padding: EdgeInsets.all(4),
                  height: 20,
                  width: 20,
                  child:
                      SvgPicture.asset("assets/icons/svg/Arrow - Right 2.svg"),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربي، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التي يولدها التطبيق .إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 9,
        separatorBuilder: (context, index) => SizedBox(
          height: 2,
        ),
      ),
    );
  }
}
