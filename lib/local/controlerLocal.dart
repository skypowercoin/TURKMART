import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLANController extends GetxController {
  void changelan(String localcode) {
    Locale locale = Locale(localcode);
    Get.updateLocale(locale);
  }
}
