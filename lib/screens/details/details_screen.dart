import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../home/model/apidatamodel.dart';
import 'components/body.dart';

class Detailsscreen extends StatelessWidget {
  final Products product;

  const Detailsscreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Colors.blueGrey,
      appBar: buildAppBar(context),
      body: DetailsScreen(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.yellowAccent,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assetss/icons/back.svg',
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assetss/icons/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assetss/icons/cart.svg"),
          onPressed: () {},
        ),
        SizedBox(width: 2.w)
      ],
    );
  }
}
