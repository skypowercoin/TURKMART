import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../home/model/apidatamodel.dart';

class VerticalSlider extends StatelessWidget {
  VerticalSlider({
    super.key,
    required this.product,
  });

  final Products product;
  final String _startlink = 'https://cdn.dsmcdn.com';

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: product.images!.length,
        options: CarouselOptions(
          aspectRatio: 1.1,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
        ),
        itemBuilder: (context, index, realindex) =>
            buildimagestList(index, context));
  }

  Widget buildimagestList(int index, context) {
    return GestureDetector(
      onTap: () {
        print(index);
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 1.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            _startlink + product.images![index],
            height: 20.h,
          ),
        ),
      ),
    );
  }
}
