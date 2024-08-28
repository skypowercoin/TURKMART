import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final String text;
  final Color textcolor;
  final BoxShape shape;
  late TextStyle style;
  final double hight;
  final double aWidth;
  final double fontsize;
  ColorDot(
      {super.key,
      this.shape = BoxShape.circle,
      this.isSelected = false,
      this.text = "",
      this.textcolor = Colors.black,
      required this.color,
      this.hight = 75,
      this.aWidth = 25,
      this.fontsize = 15

      // by default isSelected is false
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 2.h,
        right: 1.5.w,
      ),
      padding: EdgeInsets.all(0.5.w * .05.h),
      height: hight,
      width: aWidth,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Color.fromARGB(5, 248, 246, 244),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: shape,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textcolor, fontSize: fontsize),
          ),
        ),
      ),
    );
  }
}
