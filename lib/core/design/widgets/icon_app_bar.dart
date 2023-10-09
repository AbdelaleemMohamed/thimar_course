import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_course/core/design/colors.dart';

class IconAppBar extends StatelessWidget {
  final String iconName;

  final VoidCallback onPress;

  final Color color;

  final double iconPadding;

  IconAppBar(
      {Key? key,
      required this.iconName,
      required this.onPress,
      this.color = primaryColor,
      this.iconPadding = 7})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(iconPadding),
        height: 33.h,
        width: 33.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.r),
          color: color.withOpacity(0.13),
        ),
        child: SvgPicture.asset(
          "assets/icons/svg/$iconName.svg",
          color: color,
        ),
      ),
    );
  }
}
