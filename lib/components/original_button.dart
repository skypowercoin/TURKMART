import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

///import 'package:translator/translator.dart';

class OriginalButton extends StatelessWidget {
  ///final GoogleTranslator translator = GoogleTranslator();
  final dynamic text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final Color sidecolor;

  OriginalButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.textColor,
      required this.sidecolor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      width: 63.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color,
            elevation: 10,
            side: BorderSide(color: sidecolor),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30))),
        onPressed: onPressed,
        child: new FittedBox(
          //fit long text
          fit: BoxFit.contain,
          child: Text(text, style: TextStyle(color: textColor, fontSize: 18)),
        ),
      ),
    );
  }
}
