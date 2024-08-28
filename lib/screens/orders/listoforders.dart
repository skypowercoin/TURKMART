import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../home/components/product_data_list_view.dart';
import '../home/controlers/productscontroller.dart';
import '../nvibar/controler1/navbar.dart';
import 'controler.dart';
import 'orderinf.dart';

class ListofOrders extends GetView {
  ListofOrders({Key? key}) : super(key: key);
  final Ordercontroler con = Get.put(Ordercontroler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Navigationbar(),
        appBar: AppBar(
          shadowColor: const Color.fromARGB(202, 93, 247, 175),
          backgroundColor: const Color(0xFFFFFFFF),
          automaticallyImplyLeading: false,
          title: Text(
            'TRACKER ORDER'.tr,
            style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
          ),
        ),
        body: GetBuilder<Ordercontroler>(
          init: Ordercontroler(),
          initState: (_) {},
          builder: (oc) {
            return ListView.builder(
              itemCount: oc.listoforders.length,
              itemBuilder: (BuildContext context, int index) {
                DateTime t = con.listoforders[index].orderTime!.toDate();

                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                            style: const ButtonStyle(),
                            onPressed: () {
                              ;
                              print(index);
                              Get.to(Orderinfo(
                                index: index,
                              ));
                            },
                            child: Text(
                              '${"order_Number".tr}\n${t.day}_${t.month}_${t.year}_${oc.listoforders[index].orderNo}',
                              style: TextStyle(
                                  fontSize: 5.w,
                                  color: oc.listoforders[index].orderstatus == 5
                                      ? Colors.grey
                                      : Color.fromARGB(255, 7, 212, 168)),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${"Number of products".tr}\n${oc.listoforders[index].productList.length}',
                              style: TextStyle(fontSize: 4.w),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 39.w, end: 2.w),
                              child: Text(
                                  '${"total".tr}\n${roundDouble(oc.listoforders[index].totalPayment!/ProductController().exchangerate .toDouble(),4)}USD',
                                  style: TextStyle(fontSize: 4.w)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
