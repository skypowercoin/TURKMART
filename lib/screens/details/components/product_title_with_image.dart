import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../home/controlers/prudctviewcont.dart';
import '../../home/model/apidatamodel.dart';

class ProductTitleWithImage extends GetView {
  ProductTitleWithImage({
    Key? key,
    @required required this.product,
  }) : super(key: key);

  final Products product;
  final String _startlink = 'https://cdn.dsmcdn.com';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.productGroupId.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              GetBuilder<ProductView>(
                init: ProductView(),
                initState: (_) {},
                builder: (_) {
                  return Hero(
                    tag: "${product.id}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        _.images.isEmpty
                            ? _startlink + product.images![0]
                            : _startlink + _.images[0],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Text(
            product.id.toString(),
            style: TextStyle(color: Color.fromARGB(255, 7, 2, 2), fontSize: 15),
          ),
        ],
      ),
    );
  }
}

/// round price from 00.000 to 0.00
double roundDouble(double value, int places) {
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}
