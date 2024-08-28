import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controlers/brandcon.dart';
import '../controlers/productscontroller.dart';

class CircleBrands extends GetView {
  CircleBrands({Key? key, required pageurl}) : super(key: key);

  final cont = Get.put(CircleBrandController());
  final contp = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        Expanded(
            child: Scaffold(
          body: GetBuilder<CircleBrandController>(
            init: CircleBrandController(),
            initState: (_) {},
            builder: (_) {
              return ListView.builder(
                  padding: EdgeInsets.only(top: 0.5.h),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  // _.images.length,
                  itemCount:10,
                  itemBuilder: (context, index) => buildcat(index));
            },
          ),
        )),
      ],
    ));
  }

  Widget buildcat(int index) {
    return GetBuilder<CircleBrandController>(
      init: CircleBrandController(),
      initState: (_) {},
      builder: (_) {
        return GestureDetector(
            onTap: () {
              contp.clearproducts();

              ///print(cont.imageslinks[index].titales);
              contp.getproductdetails(_.imageslinks[index].titales);
              // insert data her categorylist[index]['attributes']['href']
              //print(cont.images[index].titales);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 2.w, left: 3.w),
              child: CircleAvatar(
                  //categorylist[index]['attributes']['src']
                  //child: Image.network(_.images[index].titales),
                  child: Image.asset('assetss/images/coming-soon-page.png'),
                  radius: 30,
                  backgroundColor: Color.fromARGB(255, 255, 255, 254)),
            ));
      },
    );
  }
}
