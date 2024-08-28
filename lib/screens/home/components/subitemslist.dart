import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:turkmart/screens/home/home_screen.dart';

import '../controlers/items_controler.dart';
import '../controlers/productscontroller.dart';

// We need satefull widget for our categories

class Subitems extends GetView {
  //GoogleTranslator translator = GoogleTranslator();

  // Response of getElement is always List<Map<String, dynamic>>

  // By default our first item will be selecte
  late int tapindex = 0;

  final contp = Get.put(ProductController());
  final itemscontroler = Get.put(Itemscontroler());

  Subitems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(4),
          child: SizedBox(
            height: 5.h,
            child: GetBuilder<Itemscontroler>(
              init: Itemscontroler(),
              initState: (_) {},
              builder: (c) {
                return ListView.builder(
                  controller: c.itemsscrolcontroller,
                  scrollDirection: Axis.horizontal,
                  itemCount: c.subitems.length,
                  itemBuilder: (context, index) => buildsubiteams(index),
                );
              },
            ),
          ),
        ),
      ],
    ));
  }

  Widget buildsubiteams(int index) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      initState: (_) {},
      builder: (poc) {
        return Padding(
          padding:  EdgeInsetsDirectional.only(start: 1.w),
          child: GestureDetector(
            onLongPress: () {
              print(Itemscontroler().subitems[index].uRL);
               
              print('lonnnnnnnnngpres');
            },
            onTap: () {
              print(index);
          
                  poc.clearproducts();
                  print(itemscontroler.subitems[index].uRL.toString());
                  poc.getproductdetails(itemscontroler.subitems[index].uRL.toString());
                  Get.to(HomeScreen());
                   tapindex = index;
                  itemscontroler.update();
              
              
              
              
          
              //var l = itemscontroler.subitems.length;
              itemscontroler.changecolor(index);
          
              //print(itemscontroler.subitemsss[index].subitemslink);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<Itemscontroler>(
                  init: Itemscontroler(),
                  initState: (_) {},
                  builder: (Itemscontroler) {
                    return Container(
                        child: Padding(
                      padding:  EdgeInsetsDirectional.only(start: 1.w,top: 1.h,end: 1.w),
                      child: Text(
                        "lanar".tr == 'العربية'
                        ? Itemscontroler.subitems[index].subItArName.toString()
                        : Itemscontroler.subitems[index].subItEnName.toString(),
                        //Itemscontroler.subitems[index].subItEnName.toString(),
                        style: TextStyle(
                          fontSize: 2.h,
                          fontWeight: FontWeight.bold,
                          color: tapindex == index
                            ? Color.fromARGB(255, 235, 101, 12)
                            : Color.fromARGB(255, 7, 71, 50),
                        ),
                      ),
                    ));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


//////// How to transform Future<List<Map> to List<Map> in Dart language?
///https://stackoverflow.com/questions/44297839/how-to-transform-futurelistmap-to-listmap-in-dart-language