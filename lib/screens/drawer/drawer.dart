import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:animate_do/animate_do.dart';

import '../../local/controlerLocal.dart';
import '../home/controlers/categorries.dart';
import '../home/controlers/catgorycontroller.dart';
import '../home/controlers/items_controler.dart';
import '../home/controlers/productscontroller.dart';

class MyDrawer extends GetView {
  final poc = Get.put(ProductController());
  final glc = Get.put(CatgorysController());
  final itemscontroler = Get.put(Itemscontroler());
  final lancont = Get.put(MyLANController());
  MyDrawer({Key? key}) : super(key: key);
  late int tapindex = 0;
  final int itemindex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Drawer(
          backgroundColor: Color.fromARGB(255, 234, 252, 246),
          shadowColor: Color.fromARGB(255, 245, 121, 5),
          surfaceTintColor: Color.fromARGB(255, 78, 245, 147),
          child: FadeInLeftBig(
            child: Column(children: [
              Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 1.w, top: 1.h, bottom: 1.h)),
              Categories(),
              GetBuilder<Itemscontroler>(
                init: Itemscontroler(),
                initState: (_) {},
                builder: (itemscontroler) {
                  return itemscontroler.items.isEmpty
                      ? Padding(
                          padding: EdgeInsets.all(1.h * 1.w),
                          child: Image.asset(
                              fit: BoxFit.fitHeight,
                              'assetss/images/womlod.gif'),
                        )
                      : Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: itemscontroler.items.length,
                            itemBuilder: (context, index) =>
                                builditeams(index, context),
                          ),
                        );
                },
              ),
            ]),
          )),
    );
  }

  builditeams(int index, context) {
    return GetBuilder<Itemscontroler>(
        init: Itemscontroler(),
        initState: (_) {},
        builder: (ic) {
          if (itemscontroler.items.isEmpty) {
            return  Padding(
              padding: EdgeInsets.all(1.w*1.h),
              child: CircularProgressIndicator(),
            );
          } else {
            return ExpansionTile(
                onExpansionChanged: (value) {
                  ic.readsubitemsJson(ic.items[index].itId!.toInt());
                },
                title: Text(
                    "lanar".tr == 'العربية'
                        ? ic.items[index].itArName.toString()
                        : ic.items[index].itEnName.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: tapindex == index ? Colors.blue : Colors.black)),
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: itemscontroler.subitems.length,
                    itemBuilder: (contex, index) =>
                        builitsubeams(index, context),
                  )
                ]);
          }
        });
  }

  builitsubeams(int index, context) {
    return GetBuilder<Itemscontroler>(
        init: Itemscontroler(),
        initState: (_) {},
        builder: (ic) {
          return itemscontroler.subitems.isEmpty
              ?  Padding(
                  padding: EdgeInsets.all(1.w*1.h),
                  child: CircularProgressIndicator(),
                )
              : ListTile(
                  subtitle: Divider(
                    endIndent: tapindex == index ? 50.w : 20.w,
                    height: 0.01,
                    color: tapindex == index
                        ? Color.fromARGB(255, 126, 162, 241)
                        : Colors.black,
                  ),
                  onTap: () {
                    print(index);

                    poc.clearproducts();
                    print(ic.subitems[index].uRL.toString());
                    poc.getproductdetails(ic.subitems[index].uRL.toString());
                    Navigator.of(context).pushReplacementNamed('home');
                    tapindex = index;
                  },
                  minVerticalPadding: 1,
                  selectedTileColor: Colors.greenAccent,
                  title: Text(
                      "lanar".tr == 'العربية'
                          ? ic.subitems[index].subItArName.toString()
                          : ic.subitems[index].subItEnName.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: tapindex == index
                              ? Color.fromARGB(255, 247, 202, 80)
                              : Color.fromARGB(255, 13, 59, 40))));
        });
  }
}
