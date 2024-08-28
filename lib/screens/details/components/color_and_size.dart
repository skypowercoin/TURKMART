import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';

import '../../home/controlers/prudctviewcont.dart';
import '../../home/model/apidatamodel.dart';
import 'Dot_color.dart';
import 'counter_with_fav_btn.dart';

class Attribute extends GetView {
  final ProductView _conProductView = Get.put(ProductView());
  Attribute({
    Key? key,
    @required required this.product,
  }) : super(key: key);
  final Products product;

  Widget build(BuildContext context) {
    return GetBuilder<ProductView>(
      init: ProductView(),
      initState: (_) {},
      builder: (_) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _conProductView.size.length,
            itemBuilder: (context, index) =>
                buildiAttributeList(index, context));
      },
    );
  }

  Widget buildiAttributeList(int index, context) {
    return GetBuilder<ProductView>(
      init: ProductView(),
      initState: (_) {},
      builder: (C) {
        return GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(0.5.h * 0.7.w),
            child: ColorDot(
              isSelected: false,
              color: C.isSelected.value == index
                  ? Color.fromARGB(129, 113, 248, 143)
                  : Color.fromARGB(155, 145, 106, 243),
              shape: BoxShape.circle,
              text: C.size[index],
              textcolor: Color.fromRGBO(14, 13, 13, 1),
              hight: 15.h,
              aWidth: 10.w,
              fontsize: 3.w,
            ),
          ),
          onTap: () {
            print('add attrtibus value to basket for ordering mang');

            C.changecolor(index);
            C.choesesize(index);

            ;
          },
        );
      },
    );
  }
}

class Colorsview extends GetView {
  final ProductView _conProductView = Get.put(ProductView());

  final Products product;
  late  int isSelectedimage=0;
  final String _startlink = 'https://cdn.dsmcdn.com';
  Colorsview({super.key, required this.product});

  Widget build(BuildContext context) {
    return GetBuilder<ProductView>(
      init: ProductView(),
      initState: (_) {},
      builder: (_) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _.colorimages.length,
            itemBuilder: (context, index) => buildimagestList(index, context));
      },
    );
  }

  Widget buildimagestList(int index, context) {
    return GestureDetector(
      onTap: () {
        print(index);
        _conProductView.changeselctedimage(index);
        var id = _conProductView.colorimages[index].id;

        ///change product id befor the colors id is defrent
        print(product.id);

        print('updatea attrbits valuse by product id$id');
        _conProductView.size.clear();
        _conProductView.getproductsize(id.toString());
        _conProductView.choesedcolor(_conProductView.colorimages[index]);

        ///GET TO  COLORS PAGE
        Get.to(
            ColorsBigPage(image: _conProductView.colorimages[index].imageUrl));
            ProductView().update();
      },
      child: Padding(
        padding: EdgeInsets.all(1.h * 1.w),
        child: GetBuilder<ProductView>(
          init: ProductView(),
          initState: (_) {},
          builder: (_) {
            
            return isSelectedimage == index
                ? ClipRRect(
                    child: Image.network(
                    _startlink + _conProductView.colorimages[index].imageUrl,
                    height: 2.h,
                    width: 6.w,
                  ))
                : ClipOval(
                    child: Image.network(
                    _startlink + _conProductView.colorimages[index].imageUrl,
                    height: 5.h,
                    width: 5.w,
                  ));
          },
        ),
      ),
    );
  }
}

class Attrbittype extends GetView {
  Attrbittype({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<ProductView>(
            init: ProductView(),
            initState: (_) {},
            builder: (c) {
              return Text(c.attrbutetype.value,
                  style: TextStyle(
                      letterSpacing: 0.5.w,
                      fontSize: 5.w,
                      color: Color.fromARGB(255, 98, 125, 212)));
            }),
      ],
    );
  }
}
