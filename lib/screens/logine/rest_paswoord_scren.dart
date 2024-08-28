import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'controler/restpaswrdform.dart';

class rsetpaswoed extends StatelessWidget {
  const rsetpaswoed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[Padding(
            padding:  EdgeInsetsDirectional.only(top: 1.h,start: 2.w,end: 2.w),
            child: Image.asset('assetss/images/Password_Header.gif',height:63.h,),
          ),
          
            
            RsetPaswordForm()
          ],
        ),
      ),
    );
  }
}
