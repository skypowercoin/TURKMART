import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ColorsBigPage extends GetView {
  ColorsBigPage({
    Key? key,
    @required required this.image,
  }) : super(key: key);
  final String _startlink = 'https://cdn.dsmcdn.com';
  final String image;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      debugPrint("${constraints.toString()}");
      return SizedBox(
        height: constraints.maxHeight * .3,
        width: constraints.maxWidth,
        child: PageView(
          
          children: [Image.network(_startlink + image)],
        ),
      );
    });
  }
}
