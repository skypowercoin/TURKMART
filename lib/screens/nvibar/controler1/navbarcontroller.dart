import 'package:get/get.dart';

class Navibar extends GetxController {
  RxInt iconsSelected = 1.obs;

  void changeiconScolor(int index) {
    iconsSelected = index.obs;
    update();
  }

  @override
  void onClose() {
    print('cccolse');
    super.onClose();
  }
}
