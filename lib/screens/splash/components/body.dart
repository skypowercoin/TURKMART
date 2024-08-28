import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
// This is the best practice
import '../../../components/original_button.dart';
import '../../home/home_screen.dart';
import '../components/splash_content.dart';

class sBody extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<sBody> {
  int currentPage = 0;
  bool isuserlogind = false;
  List<Map<String, String>> splashData = [
    {"text": "splash1".tr, "image": "assetss/images/splash_1.png"},
    {"text": "splash2".tr, "image": "assetss/images/splash_2.png"},
    {"text": "splash3".tr, "image": "assetss/images/splash_3.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child:currentPage==2?OriginalButton(
                        textColor: Color.fromARGB(193, 13, 14, 13),
                        sidecolor: Color.fromARGB(255, 118, 67, 248),
                        color: Color.fromARGB(179, 255, 117, 67),
                        text: 'Letsshop'.tr,
                        onPressed: () {
                          Get.off(HomeScreen());
                          
                        },
                      ):Text(""),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 2000),
      margin: EdgeInsets.only(right: 1.w),
      height: 1.h,
      width: currentPage == index ? 6.w : 2.w,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xFFFF7643) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
