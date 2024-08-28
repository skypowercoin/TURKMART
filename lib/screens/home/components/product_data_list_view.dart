import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

import '../../details/components/Dot_color.dart';
import '../../details/components/body.dart';
import '../controlers/productscontroller.dart';
import '../controlers/prudctviewcont.dart';

class Productlist extends GetView<ProductController> {
  Productlist({required pageurl});

  final String _startlink = 'https://cdn.dsmcdn.com';
  final ProductView _conProductView = Get.put(ProductView());
  
  ProductController homePageController = Get.put(ProductController(),permanent: true);
  int tapindex =0;

  bool ishaveclorors = false;

  bool islovedproduct = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GetBuilder<ProductController>(
            init:homePageController ,
            initState: (_) {},
            builder: (Value) {
              return Scaffold(
                body: ListView.builder(
                    shrinkWrap: true,
                    controller: Value.pcontroller,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    itemCount: Value.products.length,
                    itemBuilder: (context, index) {
                      
                      //print('index is $index');

                      return buildproductlist(index, context);
                    }),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildproductlist(int index, context) {
    return GetBuilder<ProductController>(
        init: ProductController(),
        initState: (_) {},
        builder: (c) {
          return Stack(
            children: <Widget>[
              InkWell(
                splashColor: Colors.transparent,
                onTap: () => {
                  _conProductView.colorimages.clear(),
                  _conProductView.getproductimagescolors(
                      c.products[index].productGroupId.toString()),

                  _conProductView.size.clear(),
                  _conProductView
                      .getproductsize(c.products[index].id.toString()),
                  Get.to(DetailsScreen(
                    product: c.products[index],
                  )),
                  //c.getTRYprice(
                  //c.products[index].price!.sellingPrice!.toDouble())
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 226, 227, 228).withOpacity(0.6),
                        offset: const Offset(2.5, 2.5),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(0.5.w * 0.5.h),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: FadeInImage.assetNetwork(
                        fit: BoxFit.fill,
                        fadeInDuration: const Duration(milliseconds: 1),
                        placeholder: 'assetss/images/camion.gif',
                        fadeInCurve: Curves.bounceIn,
                        image: _startlink + c.products[index].images![0]),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.h * 0.9.w),
                child: InkWell(
                    onTap: () {
                      c.addtofavorites(index,c.products[index].id!.toInt());
                      c.update();
                      tapindex == index;
                      
                      
                    },
                    child: SvgPicture.asset(
                      "assetss/icons/heart.svg",
                      height: 4.h,
                      width: 4.w,
                      color: c.isFavorit(c.products[index].id!.toInt())?Color.fromARGB(200, 255, 4, 4):Color.fromARGB(179, 100, 100, 100)
                          
                    )),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 45.w, bottom: 3.h),
                child: Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Row(
                      children: [
                        Text(
                          '${roundDouble(c.products[index].price!.sellingPrice!.toDouble()/c.exchangerate, 2)}',
                          style: TextStyle(
                              color: Color.fromARGB(186, 142, 143, 142),
                              fontSize: 20),
                        ),
                        const Text(
                          '\$',
                          style:
                              TextStyle(color: Color(0xFFF8760C), fontSize: 30),
                        )
                      ],
                    )),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 3.w, bottom: 2.h),
                child: Align(
                    widthFactor: 0.5,
                    alignment: AlignmentDirectional.bottomStart,
                    child: ishaveclorors == false
                        ? Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(start: 6.w),
                                child: ColorDot(
                                    color: Color.fromARGB(68, 24, 253, 127)),
                              ),
                              ColorDot(
                                  color: Color.fromARGB(197, 255, 217, 48)),
                              Padding(
                                padding: EdgeInsetsDirectional.only(start: 3.w),
                                child: ColorDot(
                                  color: Color.fromARGB(224, 197, 180, 250),

                                  ///set number of product colore
                                  text: c.products[index].images!.length
                                      .toString(),
                                  textcolor: Color.fromARGB(255, 7, 6, 6),
                                ),
                              ),
                            ],
                          )
                        : const Text('do something here')),
              ),
            ],
          );
        });
  }
}

/// round price from 00.000 to 0.00 
double roundDouble(double value, int places) {
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}
