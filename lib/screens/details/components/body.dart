import 'package:advance_notification/advance_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

import '../../basket/basketcontroler.dart';
import '../../../components/original_button.dart';
import '../../home/controlers/prudctviewcont.dart';
import '../../home/home_screen.dart';
import '../../home/model/apidatamodel.dart';
import 'carousel_slider.dart';
import 'color_and_size.dart';
import 'description.dart';

class DetailsScreen extends GetView {
  final Products product;
  final Basketcon basketcon = Get.put(Basketcon());
  final ProductView _conProductView = Get.put(ProductView());

  DetailsScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width

    return Scaffold(
        appBar: HomeScreen().buildAppBar(),
        body: ListView(
          padding: EdgeInsetsDirectional.all(1.w),
          children: [
            VerticalSlider(
              product: product,
            ),
            GetBuilder(
              init: ProductView(),
              initState: (_) {},
              builder: (c) {
                return c.colorimages.isNotEmpty
                    ? Text("clors".tr,
                        style: TextStyle(
                            letterSpacing: 0.5.w,
                            fontSize: 5.w,
                            color: Color.fromARGB(255, 98, 125, 212)))
                    : Text(product.id.toString());
              },
            ),
            GetBuilder<ProductView>(
              init: ProductView(),
              initState: (_) {},
              builder: (_) {
                return SizedBox(
                    height: _.colorimages.isNotEmpty ? 15.h : 1.h,
                    child: Colorsview(
                      product: product,
                    ));
              },
            ),
            SizedBox(height: 5.h, child: Attrbittype()),
            SizedBox(
              height: 10.h,
              child: Attribute(product: product),
            ),
            Description(product: product),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 1.h),
              child: OriginalButton(
                textColor: Color.fromARGB(193, 13, 14, 13),
                sidecolor: Color.fromARGB(255, 118, 67, 248),
                color: Color.fromARGB(179, 255, 117, 67),
                text: 'addtobasket'.tr,
                onPressed: () {
                  //basketcon.addtobasket(product);
                  if (_conProductView.colorimages.isEmpty) {
                    if (_conProductView.lovedattributeValue.length < 1) {
                      AdvanceSnackBar(message: "plase choose size".tr)
                          .show(context);
                    } else {
                      basketcon.addtobasket(product);
                      AdvanceSnackBar(message: "done!")
                          .show(context);
                      _conProductView.clearsizeandcolor();
                    }
                  } else {
                    if (_conProductView.colorimages.isNotEmpty &&
                        _conProductView.lovedcolor.isEmpty) {
                       AdvanceSnackBar(message: "please choose color".tr)
                          .show(context);
                      ;

                      print(
                          ' plase add new Attrbit  to basket with color & size &new price');
                    } else {
                      if (_conProductView.lovedattributeValue.isEmpty) {
                        AdvanceSnackBar(message: "plase choose size".tr)
                            .show(context);
                      } else {
                        basketcon.addtobasket(product);
                          AdvanceSnackBar(message: "!:${_conProductView.lovedattributeValue}")
                            .show(context);
                        
                        _conProductView.clearsizeandcolor();
                      }
                    }
                  }

                  ///add product data to basket with number of product user nieded
                },
              ),
            )
          ],
        ));
  }
}


//   AlertDialog(
                    //: new Text("Alert Dialog title"),
                    ////content: new Text("Alert Dialog body"),
                    ///actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      //TextButton(
                        //: new Text("Close"),
                        //onPressed: () {
                          //Navigator.of(context).pop();
                        ///},
                      //),
                    //],
                  //);
//
//
//
//
//
//
//
