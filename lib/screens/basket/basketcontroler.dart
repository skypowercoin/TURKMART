import 'package:bottom_bar_matu/utils/app_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:turkmart/screens/home/home_screen.dart';


import '../home/controlers/prudctviewcont.dart';
import '../home/model/apidatamodel.dart';
import '../home/model/productgrubemodel.dart';
import '../orders/controler.dart';
import '../orders/listoforders.dart';
import '../orders/model.dart';

class Basketcon extends GetxController {
  final p = Get.put(ProductView());

  List<Products> get productsbasket => _basketproducts;
  final List<Products> _basketproducts = [];
  late double _totalprice = 0.0;

  double get totalprice => _totalprice;

  ///order  for ui data
  var order = <Order>[].obs;

  /// list usege for uplode data befor send to fire base
  List<OrdProductList> productList = [];

  ///get to attrbite value choesd from user
  late List<String> size = p.lovedattributeValue;

  ///get to loved colr from user
  final List<Contents> color = ProductView().lovedcolor;

  ///coniction to data base
  FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  ///used for add orders key value fro get tl last order number
  final List<int> ordersidlist = [0];

  @override
  void onInit() {
    print('basket control init');
    super.onInit();
  }

  @override
  void onReady() {
    print('basket co ready');
    super.onReady();
  }

  @override
  void onClose() {
    print('cccolse');
    super.onClose();
  }

  void addtobasket(Products product) {
    if (_basketproducts.contains(product)) {
      
      print('product in basket');
    } else {
      _basketproducts.add(product);
      print(_basketproducts);

      order.add(Order(
          product: product,
          attributeValue:
              size.isEmpty ? product.variants![0].attributeValue : size[0],
          attributeName: product.variants![0].attributeName,
          numberofitems: 1,
          colorinfo: color.isEmpty
              ? Contents(
                  url: product.url.toString(),
                  id: product.id!.toInt(),
                  imageUrl: product.images![0].toString(),
                  name: product.name.toString())
              : color[0]));

      print('product add to basket');

      updatetotal();
    }
    update();
  }

  void removeproduct(int index) {
    print('product dilted');
    _basketproducts.remove(_basketproducts[index]);
    order.remove(order[index]);

    updatetotal();
    update();
  }

  void updatetotal() {
    if (_basketproducts.isNotEmpty && color.isNotEmpty) {
      _totalprice = 0;
      for (var p = 0; p < _basketproducts.length; p++) {
        _totalprice += order[p].colorinfo.price!.sellingPrice.value.toDouble() *
            order[p].numberofitems;
        print(_totalprice);
        print('image price');
      }
    } else {
      _totalprice = 0;
      for (var p = 0; p < _basketproducts.length; p++) {
        _totalprice +=
            _basketproducts[p].price!.sellingPrice * order[p].numberofitems;
        print(_totalprice);
      }
    }
    update();
  }

  ///used for uplode product to list bbefor send to fire base
  uplodedatatolist() {

    for (var i = 0; i < _basketproducts.length; i++) {
      print('lodingdata$i');
      if (productList.contains(OrdProductList)) {
        print("product in backend lis");
      } else {
        productList.add(OrdProductList(
            isNotInmarket: false,
            isOrderd: false,
            isshaped: false,
            isShapingAllowed: false,
            isUserAllowed: false,
            notes: "emptty",
            productId: _basketproducts[i].id.toString(),
            productweight:
                "https://www.trendyol.com${_basketproducts[i].url.toString()}",
            shelfNo: '0',
            productattributename:
                _basketproducts[i].variants![0].attributeName.toString(),
            productattributevalue: order[i].attributeValue!.isEmpty
                ? _basketproducts[i].variants![0].attributeValue.toString()
                : order[i].attributeValue.toString(),
            productbuyedprice:
                _basketproducts[i].price!.sellingPrice.toString(),
            producturl: order[i].colorinfo.imageUrl.isEmpty
                ? 'https://cdn.dsmcdn.com/${_basketproducts[i].url.toString()}'
                : 'https://cdn.dsmcdn.com/${order[i].colorinfo.imageUrl.toString()}',
            shapeprice: 7.6));
      }
    }
  }

  // get to last order id
  getlastorderNo() async {
    if (productList.isNotEmpty) {
      ordersidlist.add(0);
      final user = auth.currentUser;
      //get user id
      final uid = user!.uid;
      var co = db.collection('order');

      //var orders = co.doc(uid);
      co.doc(uid).get().then((DocumentSnapshot doc) {
        final data1 = doc.data();
        ;
        if (data1 != null) {
          final data = doc.data() as Map<String, dynamic>;
          data.forEach((key, value) {
            print(key);
            //convert data to int from string value
            key.toInt();
            //add orders number to list
            ordersidlist.add(key.toInt());
            //sort list bay value for choese a last order number
            ordersidlist.sort();
            //print(ordersidlist);
          });
          if (ordersidlist.length > 1) {
            uplodeorder();
          }
        } else {
          uplodeorder();
        }
      });
      update();
    } else {
      print(' the basket is empty');
    }
  }

  ///set firbase doc name

  ///uplode order value to data base
  uplodeorder() async {
    print(productList);
    if (productList.isNotEmpty) {
      final user = auth.currentUser;
      final uid = user!.uid;
      var co = db.collection('order');

      var id = (1 + ordersidlist.last).toString();

      co.doc(uid).set({
        id: Orders(
                // ignore: unnecessary_null_comparison
                orderNo: ordersidlist.last + 1,
                orderTime: FieldValue.serverTimestamp(),
                orderstatus: Ordercontroler().isuseraddaddress?2:1,
                paymentptatus: false,
                productList: productList,
                shapinginfo: uid, 
                totalPayment: totalprice)
            .tojson()
      }, SetOptions(merge: true)).onError(
          (e, _) => print("Error writing document: $e"));
    }

    print('datauplodde');

    _basketproducts.clear();
    productList.clear();
    order.clear();
    updatetotal();

    print(productList);
    if (_basketproducts.isEmpty) {
      ordersidlist.clear();
      color.clear();
      print("data delted");
      Get.off(HomeScreen());
    }
    update();
  }
}

///this my user for this uselk
///using by ser orf ers some iteam s
///can used for more models
///with all class
class Order {
  Products product;
  String? attributeValue;
  String? attributeName;
  int numberofitems;
  Contents colorinfo;

  Order(
      {required this.product,
      this.attributeValue,
      this.attributeName,
      required this.numberofitems,
      required this.colorinfo});
}
