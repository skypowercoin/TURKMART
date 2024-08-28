import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkmart/global_controler/binding.dart';

import '../../favorits/favoritsproduct.dart';
import '../../orders/controler.dart';
import 'navbarcontroller.dart';
import '../../drawer/drawer.dart';
import '../../profile/profile_screen.dart';

class Navigationbar extends GetView {
  Navigationbar({Key? key}) : super(key: key);
  final int iconsSelected = 0;
  final Ordercontroler con = Get.put(Ordercontroler());

  final Navibar navbarcon = Get.put(Navibar());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Navibar>(
        init: Navibar(),
        initState: (_) {},
        builder: (_) {
          return BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 253, 251, 249),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      navbarcon.changeiconScolor(0);
                      MyBinding().dependencies();
                      Get.off(Favorets() );
                    },
                  ),
                  label: 'Favorite'.tr),
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.list_alt),
                    onPressed: (){

                    FirebaseAuth.instance
                              .authStateChanges()
                              .listen((User? user) async {
                            if (user == null) {
                              Navigator.pushNamed(context, 'login');
                              
                              print(user?.uid);
                            } else {
                              con.getorderlist();
                              print(' plase waite to looding  ordrs data');
                              if (con.isdataloded) {
                        //Get.to(OrderScreen1());
                        navbarcon.changeiconScolor(1);
                      } else {
                        MyBinding().dependencies();
                         await Get.off(Ordercontroler());
                      }
                          
                          
                              
                            }
                          });

                      
                      
                    },
                  ),
                  label: "orders".tr),
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: const Icon(
                      Icons.view_list,
                    ),
                    onPressed: () {
                      MyBinding().dependencies();
                      Get.to(MyDrawer());
                      navbarcon.changeiconScolor(2);
                    },
                  ),
                  label: 'categories'.tr),
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      MyBinding().dependencies();
                      navbarcon.changeiconScolor(3);
                      Get.off(ProfileScreen());
                    },
                  ),
                  label: 'Setting'.tr),
            ],
            currentIndex: _.iconsSelected.value,
            selectedIconTheme:
                IconThemeData(color: Color.fromARGB(255, 7, 212, 168)),
            unselectedIconTheme: IconThemeData(
              color: Color(0xFFFF7643),
            ),
            onTap: (index) => () {},
          );
        });
  }
}
