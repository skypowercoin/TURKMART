import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';

import '../basket/add_to_cart.dart';
import 'controler.dart';
import 'orderstatuse.dart';

class Orderinfo extends GetView {
  final int index;

  Orderinfo({Key? key, required this.index}) : super(key: key);
  final Ordercontroler con = Get.put(Ordercontroler());

  @override
  Widget build(BuildContext context) {
    print(index);
    print("_________________");
    DateTime t = con.listoforders[index].orderTime!.toDate();
    return Scaffold(
        appBar: AppBar(
          shadowColor: const Color.fromARGB(202, 93, 247, 175),
          backgroundColor: const Color(0xFFFFFFFF),
          automaticallyImplyLeading: false,
          title: Text(
            'TRACKER ORDER'.tr,
            style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      end: 65.w, top: 3.h, bottom: 3.h),
                  child: Text(
                      '${"order_Number".tr}\n${con.listoforders[index].orderNo.toString()}${t.day}${t.month}${t.year}',
                      style: TextStyle(fontSize: 20)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 2.h),
              child: EasyStepper(
                //lineLength: 5.h,
                ///lineType: LineType.normal,
                activeStep: con.listoforders[index].orderstatus!.toInt(),
                direction: Axis.horizontal,
                unreachedStepIconColor: Colors.white,
                unreachedStepBorderColor: Colors.black54,
                finishedStepBackgroundColor: Color.fromARGB(255, 193, 194, 194),
                unreachedStepBackgroundColor:
                    const Color.fromARGB(255, 248, 124, 86),
                showTitle: true,
                onStepReached: (index) => {con.updaateindex(index)},
                steps: [
                  EasyStep(
                      icon: const Icon(CupertinoIcons.cart),
                      title: 'Cart'.tr,
                      activeIcon: const Icon(CupertinoIcons.cart),
                      lineText: 'Cart Line'.tr,
                      enabled: true),
                  EasyStep(
                      icon: const Icon(Icons.file_present),
                      activeIcon: const Icon(Icons.file_present),
                      title: 'Address'.tr,
                      enabled: true),
                  EasyStep(
                      icon: const Icon(Icons.filter_center_focus_sharp),
                      activeIcon: const Icon(Icons.filter_center_focus_sharp),
                      title: 'Checkout'.tr,
                      enabled: true),
                  EasyStep(
                      icon: const Icon(Icons.money),
                      activeIcon: const Icon(Icons.money),
                      title: 'Payment'.tr,
                      enabled: true),

                  EasyStep(
                      icon: const Icon(Icons.local_shipping_outlined),
                      activeIcon: const Icon(Icons.local_shipping_outlined),
                      title: 'Shipping'.tr,
                      enabled: true
                          ),

                  ///EasyStep(
                  //icon: const Icon(Icons.file_copy_outlined),//
                  //activeIcon: const Icon(Icons.file_copy_outlined),//
                  //title: 'Order Details'.tr,//
                  //enabled: con.orderdat.userorders.products.isUserAllowed//
                  //),///
                  EasyStep(
                      icon: const Icon(Icons.check_circle_outline),
                      activeIcon: const Icon(Icons.check_circle_outline),
                      title: 'Finish'.tr,
                      enabled:
                          true),
                ],
              ),
            ),
            SizedBox(
              width: 63.w,
              child: con.listoforders[index].orderstatus!.toInt() == 0
                  ? CartBody()
                  : con.listoforders[index].orderstatus!.toInt() == 1
                      ? AdressStatuse()
                      : con.listoforders[index].orderstatus!.toInt() == 2
                          ? PaymentStatuse(
                              index: index,
                            )
                          : con.listoforders[index].orderstatus!.toInt() == 3
                              ? shapingStatuse(index)
                              : con.listoforders[index].orderstatus!.toInt() ==
                                      4
                                  ? FinishStatuse()
                                  : Center(
                                      child: Text(
                                      con.listoforders[index].productList[0]
                                          .notes,
                                      style: TextStyle(
                                          fontSize: 5.w,
                                          color:
                                              Color.fromARGB(255, 243, 43, 43)),
                                    )),
            ),
          ],
        ));
  }
}
