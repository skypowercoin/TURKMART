import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../home/home_screen.dart';
import 'Checkout.dart';
import 'add_to_cart.dart';
import 'basketcontroler.dart';

class basket extends GetView {
  basket({Key? key}) : super(key: key);
  final Basketcon basketcon = Get.put(Basketcon());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: buildAppBar(),
          preferredSize: Size.fromHeight(6.h),
        ),
        body: Stack(children: [CartBody(), CheckoutCard()]));
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          'assetss/icons/back.svg',
          theme: const SvgTheme(
              currentColor: Color.fromARGB(255, 5, 5, 5), fontSize: 20),
        ),
        onPressed: () {
          Get.to(HomeScreen());
        },
      ),
      centerTitle: true,
      shadowColor: Color.fromARGB(202, 93, 247, 175),
      backgroundColor: Color.fromARGB(151, 93, 247, 175),
      automaticallyImplyLeading: false,
      title: Text(
        "basket".tr,
        style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
      ),
    );
  }
}
