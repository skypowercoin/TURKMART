import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Networcont extends GetxController {
  final Connectivity _connectvity = Connectivity();

  void OnInit() {
    super.onInit();
    _connectvity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.other) {
      print('lostconection');
      Get.rawSnackbar(
          messageText: Center(
            child: Text(
              "networkmsg".tr,
              style: TextStyle(color: Colors.black, fontSize: 10.w),
            ),
          ),
          isDismissible: false,
          duration: Duration(days: 1),
          backgroundColor: Color.fromARGB(255, 248, 101, 101),
          icon: const Icon(Icons.wifi_off),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
