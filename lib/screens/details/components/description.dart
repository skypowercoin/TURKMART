import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../home/components/product_data_list_view.dart';
import '../../home/controlers/productscontroller.dart';
import '../../home/model/apidatamodel.dart';

class Description extends StatelessWidget {
  
  Description({
    @required required this.product,
  });

  final Products product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 1.w, end: 1.w),
          child: Text(
            product.categoryName!.toString(),
            style: const TextStyle(height: 1.5, fontSize: 15),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 1.w, end: 1.w),
          child: RichText(
            textAlign: TextAlign.end,
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      "\$${roundDouble(product.price!.sellingPrice!.toDouble()/ProductController().exchangerate, 2)}",
                  style: TextStyle(
                      color: Color.fromARGB(255, 253, 124, 19), fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
