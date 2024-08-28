import 'package:get/get.dart';
import 'package:turkmart/internetcon/networkcont.dart';

import '../screens/home/controlers/productscontroller.dart';
import '../screens/home/controlers/prudctviewcont.dart';

import '../screens/home/controlers/brandcon.dart';
import '../screens/home/controlers/catgorycontroller.dart';
import '../screens/home/controlers/items_controler.dart';
import '../screens/orders/controler.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    ///use perment with fixx class
    Get.put<Networcont>(Networcont(), permanent: true);
    Get.put(() => Ordercontroler());
    Get.put(() => ProductController(),permanent: true);
    Get.lazyPut(() => CatgorysController(), fenix: true);

    Get.lazyPut(() => Itemscontroler(), fenix: true);

    Get.lazyPut(() => CircleBrandController(), fenix: true);
    Get.lazyPut(() => ProductView(), fenix: true);
  }

  static void init() {}
}
