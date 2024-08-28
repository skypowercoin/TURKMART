import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

///import 'package:web_scraper/web_scraper.dart';

import '../model/localjosnmodel.dart';

class CatgorysController extends GetxController {
  ///WebScraper webScraper = WebScraper('https://www.trendyol.com');

  Catgorysmodel get catmodil => _catmodel;

  RxInt isSelected = 0.obs;

  late final Catgorysmodel _catmodel;

  @override
  void onInit() {
    print("GlobalController - onInit");
    getCategories('');

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  //get list of categorys
  ///{title: Kadın, attributes: {href: /butik/liste/1/kadin}}

  Future<void> getCategories(String partUrl) async {
    final String response =
        await rootBundle.loadString('assetss/JSON/catgoris.json');
    var data = await json.decode(response);

    ///if (await webScraper.loadWebPage(partUrl)) {
    //var data = webScraper.getElement('a.category-header', ['href']);
    _catmodel = Catgorysmodel.fromJson(data);
    // for (int i = 0; i < data.length; i++) {

    //}

    update();
  }

  void changecolor(int index) {
    isSelected = index.obs;
    update();
  }

  Future<void> readCatgorisJson() async {
    final String response =
        await rootBundle.loadString('assetss/JSON/catgoris.json');
    var data = await json.decode(response);
    Catgorysmodel cat = Catgorysmodel.fromJson(data);
    print(cat.data![0].uRL);
  }
}
