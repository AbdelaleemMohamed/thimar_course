import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAccountRow extends StatelessWidget  {
  const MyAccountRow(
      {Key? key, required this.text, required this.image, required this.onTap})
      : super(key: key);

  final String text, image;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 30,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset("assets/icons/svg/$image.svg"),
              ),

              Expanded(
                child: Text(
                 text ,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset("assets/icons/svg/arrow.svg"),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
