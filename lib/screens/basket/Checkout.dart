import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:turkmart/screens/home/controlers/productscontroller.dart';

import '../../global_controler/constants.dart';
import '../details/components/product_title_with_image.dart';
///import '../orders/body.dart';
import '../orders/controler.dart';
////import '../orders/listoforders.dart';
import 'basketcontroler.dart';

class CheckoutCard extends GetView {
  final Basketcon basketcon = Get.put(Basketcon());
  final Ordercontroler ordercon = Get.put(Ordercontroler());
  CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4.w, right: 4.w),
      height: 26.h,
      decoration: BoxDecoration(
        color: Color.fromARGB(64, 253, 252, 251),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 20),
            blurRadius: 300,
            color: Color.fromARGB(255, 2, 201, 92).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  
                    icon: SvgPicture.asset("assetss/icons/receipt.svg",width: 5.w,height: 5.h,),
                    onPressed: () {}),
                const Spacer(),
                Text("vouchercode".tr),
                 SizedBox(width: 5.w),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: 4.h),
            GetBuilder<Basketcon>(
              init: Basketcon(),
              initState: (_) {},
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "total".tr+ "\$",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: [
                          TextSpan(
                            text: roundDouble( _.totalprice/ProductController().exchangerate, 2).toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 21, 206, 129)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100.w/3,
                      child: TextButton(
                        child: Text("checkout".tr),
                        onPressed: () {
                          FirebaseAuth.instance
                              .authStateChanges()
                              .listen((User? user) {
                            if (user == null&&_.order.isNotEmpty) {
                              Navigator.pushNamed(context, 'login');
                              
                              print(user?.uid);
                            } else {
                              print('add card chekout page');
                          _.uplodedatatolist();
                          _.getlastorderNo();
                              
                            }
                          });
                          
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
