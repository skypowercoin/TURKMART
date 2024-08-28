import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Spacer(),
          const Text(
            "𝓽𝓾𝓻𝓴𝓶𝓪𝓻𝓽",
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFFFF7643),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            style: const TextStyle(fontSize: 20),
            text!,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h),
            child: Image.asset(
              fit: BoxFit.cover,
              image!,
              height: 50.h,
              width: 99.w,
            ),
          ),
        ],
      ),
    );
  }
}
