import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../nvibar/controler1/navbar.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(),
        bottomNavigationBar: Navigationbar(),
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Color.fromARGB(202, 93, 247, 175),
          backgroundColor: Color.fromARGB(151, 93, 247, 175),
          automaticallyImplyLeading: false,
          title: Text(
            'Setting'.tr,
            style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
          ),
        ));
  }
}
