import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

import 'package:animate_do/animate_do.dart';

import '../controlers/productscontroller.dart';
import 'Brands.dart';
import 'product_data_list_view.dart';
import 'package:sizer/sizer.dart';

import 'subitemslist.dart';

// We need satefull widget for our categories

class Homebody extends GetView {
  //GoogleTranslator translator = GoogleTranslator();

  Homebody({Key? key}) : super(key: key);
  final ProductController cont = Get.put(ProductController());
  ScrollController controller2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller:controller2 ,
      shrinkWrap: true,
      children: [
        FadeInUp(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "",//"BRANDS".tr,
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 248, 124, 86)))
                ],
                text: "find your".tr,
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 12, 11, 9)),
              ),
            ),
          ),
        ),
        FadeInLeftBig(
          duration: Duration(milliseconds: 1000),
          child: SizedBox(
            height: 7.h,
            child:  Subitems()//CircleBrands(pageurl: ''),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: Container(
              height: 59.h,
              width: 70.w,
              color: Color.fromRGBO(255, 255, 255, 1),
              child: GetBuilder<ProductController>(
                init: ProductController(),
                initState: (_) {},
                builder: (c) {
                  return c.products.isEmpty
                      ? ListView(
                          children: [Empty(), Empty(), Empty()],
                          scrollDirection: Axis.horizontal,
                        )
                      : Productlist(
                          pageurl: '',
                        );
                },
              )),
        ),
        Padding(
          padding: EdgeInsets.all(0.3.h * 0.2.w),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "must".tr,
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 248, 124, 86)))
              ],
              text: "popular".tr,
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 12, 11, 9)),
            ),
          ),
        ),
        /////////for loved product list of loved items
        Container(
            height: 30.h,
            width: 70.w,
            color: Color.fromRGBO(255, 255, 255, 1),
            child: GetBuilder<ProductController>(
              init: ProductController(),
              initState: (_) {},
              builder: (c) {
                return c.products.isEmpty
                    ? SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                            shape: BoxShape.circle, width: 50, height: 50),
                      )
                    : FadeInDown(
                        child: SizedBox());
              },
            ))
      ],
    );
  }
}

class Empty extends GetView {
  Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SkeletonItem(
        child: SkeletonLine(
            style: SkeletonLineStyle(
          height: 50.h,
          width: 35.w,
          padding: EdgeInsetsDirectional.only(start: 2.w, end: 2.w),
          borderRadius: BorderRadius.circular(50),
          minLength: 100.w / 3,
          maxLength: 100.w / 2,
        )),
      ),
    );
  }
}
