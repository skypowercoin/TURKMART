import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:animate_do/animate_do.dart';
import 'package:turkmart/screens/home/controlers/productscontroller.dart';

import '../../../global_controler/constants.dart';
import 'brandcon.dart';
import 'catgorycontroller.dart';
import 'items_controler.dart';

// We need satefull widget for our categories

class Categories extends GetView {
  //GoogleTranslator translator = GoogleTranslator();

  // Response of getElement is always List<Map<String, dynamic>>

  // By default our first item will be selecte
  final int selectedIndex = 0;
  final cont = Get.put(CircleBrandController());
  final contp = Get.put(ProductController());
  final itemscontroler = Get.put(Itemscontroler());
  final gc = Get.put(CatgorysController());

  @override
  Widget build(BuildContext context) {
    return gc.catmodil.data!.isEmpty
        ? Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 31, 143, 199),
            ),
          )
        : Padding(
            padding:  EdgeInsets.all(1.w*1.h),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 7.h,
              child: GetBuilder<CatgorysController>(
                init: CatgorysController(),
                initState: (_) {},
                builder: (c) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: c.catmodil.data!.length,
                    itemBuilder: (context, index) => buildCategory(index),
                  );
                },
              ),
            ),
          );
  }

  Widget buildCategory(int index) {
    return GetBuilder<CatgorysController>(
      init: CatgorysController(),
      initState: (_) {},
      builder: (C) {
        return Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: FadeInDownBig(
            duration: Duration(milliseconds: 1000),
            child: Container(
              decoration: BoxDecoration(
                  color: C.isSelected.value == index
                      ? Colors.pink[200]
                      : Colors.cyan,
                  borderRadius: BorderRadius.circular(50.0)),
              child: GestureDetector(
                onTap: () {
                  // ignore: avoid_print
                  print('catgorys index$index');
                  //var selectedIndex = index;
                  cont.removelist();
                  ///cont.getcircleavatar('/butik/liste/1/kadin');

                  itemscontroler.readitemssJson(index);

                  C.changecolor(index);
                  contp.clearproducts();

                  //C.changecolor(index, selectedIndex);

                  //print(C.catmodil.data![index].uRL);
                },
                child: Padding(
                  padding:
                       EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<CatgorysController>(
                        init: CatgorysController(),
                        initState: (_) {},
                        builder: (c) {
                          return Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Text(
                              "lanar".tr == 'العربية'
                                  ? c.catmodil.data![index].cName.toString()
                                  : c.catmodil.data![index].cEnName.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


//////// How to transform Future<List<Map> to List<Map> in Dart language?
///https://stackoverflow.com/questions/44297839/how-to-transform-futurelistmap-to-listmap-in-dart-language