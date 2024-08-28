///import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
///import 'package:translator/translator.dart';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/services.dart';

//import 'package:web_scraper/web_scraper.dart';

import '../model/localjosnmodel.dart';

class Itemscontroler extends GetxController {
  ///WebScraper webScraper = WebScraper('https://www.trendyol.com');
  ///GoogleTranslator translator = GoogleTranslator();
  ScrollController itemsscrolcontroller = ScrollController();
  final box = GetStorage();
  List<Items> get items => _items;
  final List<Items> _items = [];

  RxInt isSelected = 1.obs;
  RxInt isitemSelected = 1.obs;

  final List<Subitems> _sitems = [];
  List<Subitems> get subitems => _sitems;
  @override
  void onInit() {
    print("Itemscontroler - onInit");
    readitemssJson(0);
    readsubitemsJson(1);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void removeitemslist() {
    _items.removeRange(0, _items.length);
    print('items obj data removed from list');

    update();
  }

  Future<void> removesubitemslist() async {
    _sitems.removeRange(0, _sitems.length);
    print(_sitems);

    //box.remove('catgorys id');
    //box.remove('subitemsurl');

    update();
  }

  void backbootum() {
    _items.clear();

    //var subitemsurl = box.read('subitemsurl');

    update();
  }

  void changetemScolor(int index) {
    isitemSelected = index.obs;
    update();
  }

  void changecolor(int index) {
    isSelected = index.obs;

    update();
  }

  Future<void> readitemssJson(int catgoryid) async {
    print(catgoryid);
    removeitemslist();
    final String response =
        await rootBundle.loadString('assetss/JSON/items.json');
    var data = await json.decode(response);
    print(data);
    Itemsmodel i = Itemsmodel.fromJson(data);

    ///loop for list of items
    for (int m = 0; m < i.items!.length; m++) {
       var  catno = i.items![m].itCatId.toInt();

      ///chek if catgorys id index ctgorys
      if (catgoryid + 1 == catno) {
        print('catgorys in list$catgoryid');
        print(catno);

        ///add loop data to list
        _items.add(i.items![m]);
        print(items);

        //print(i.items![m].itCatId);
      }
    }

    update();
    print('items ADDto list');
    update();
  }

  readsubitemsJson(int itemindex) async {
    removesubitemslist();
    final String response =
        await rootBundle.loadString('assetss/JSON/subitems.json');
    var data = await json.decode(response);
    var msitems = Subitemsmodel.fromJson(data);

    print(msitems.jsonsubitems!.length);
    for (int m = 0; m < msitems.jsonsubitems!.length; m++) {
      var itemno = msitems.jsonsubitems![m].itemsGroub.toInt();

      ///chek if catgorys id index ctgorys
      if (itemno == itemindex) {
        print('item  list$itemno');
        //print(itemindex);

        ///add loop data to list

        _sitems.add(msitems.jsonsubitems![m]);
        print('subitems add to list');
      }
    }

    update();
  }
}

/////https://public.trendyol.com/discovery-web-searchgw-service/v2/api/filter /sr?fl=luks-ve-tasarim-markalarda-en-begenilenler
