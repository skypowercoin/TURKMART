import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../basket/body.dart';
import '../drawer/drawer.dart';
import '../nvibar/controler1/navbar.dart';
import 'components/homebody.dart';

class HomeScreen extends GetView {
  HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navigationbar(),
      appBar: buildAppBar(),
      body: Homebody(),
      drawer: MyDrawer(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.blue),
      elevation: 0,
      title: FadeInRightBig(
        child: Text(
          'appname'.tr,
          style: TextStyle(
              fontFamily: "AlegreyaSans-Bold",
              letterSpacing: 5,
              fontSize: 30,
              fontWeight: FontWeight.normal,
              color: Color.fromARGB(255, 98, 125, 212)),
          selectionColor: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(
            Icons.shopping_basket,
            color: Color.fromARGB(255, 19, 74, 224),
          ),
          onPressed: () {
            Get.to(basket());
          },
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.search))
      ],
    );
  }
}
