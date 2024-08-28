import 'dart:core';
 import 'dart:convert';
import 'dart:io';

import 'package:advance_notification/advance_notification.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/orders/model.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sqids/sqids.dart';

class mangerontroler extends GetxController {

  FirebaseFirestore db = FirebaseFirestore.instance;
  final storage = new FlutterSecureStorage();

  final List<Orders> _userorder = [];
  RxInt indexx = 0.obs;
  late bool isdataloded = false;
  List<Orders> get listoforders => _userorder;
  //used if user add addares info to database
  late bool isuseraddaddress = false;

  get isSelectedimage => null;

  @override
  void onInit() {
    print("mangercontroler - onInit");
    getMarker();
    

    super.onInit();
  }

  @override
  void onReady() {
    print("mangercontroler - onReady");

    super.onReady();
  }

  @override
  void onClose() {
    print("mangercontroler- onclose");

    super.onClose();
  }








chatwithcustomer(String Userid) async{
  final dbb =db.collection("order");
  dbb.doc(Userid).collection('userinfo').get().then((QuerySnapshot querySnapshot) {
     querySnapshot.docs.forEach((doc) async {
            print(doc["phonenum"]);
            var contact = "${doc["phonenum"]}";
            AdvanceSnackBar(message: "${doc["phonenum"]}");
            var userdata= "𝓽𝓾𝓻𝓴𝓶𝓪𝓻𝓽";

  var android_url = "whatsapp://send?phone="
      + contact +"&text= Hi we\n+$userdata" + "\nSupport Time";

  var iOS_url = "https://wa.me/$contact?text=${Uri.parse("Hi, we ${userdata} Support Time")}";

  if(Platform.isIOS){

    if(await canLaunch(iOS_url)){
      await launch(iOS_url, forceSafariVC: false);
    }else{
      print('Whatsapp is not installed');
    }
  }else{
    if(await canLaunch(android_url)){
      await launch(android_url);
      print(android_url);
    }else{
          AdvanceSnackBar(message: "plase choes your size");
                          
      print('Whatsapp is not installed');
    }
  }
        });
    

  });







  
   

}
getMarker()async  {
 
   final dbb =db.collection("order");
  //dbb.where("order_status", isEqualTo:"1");
  dbb.orderBy('order_status');
  dbb.orderBy('order_time');
  
  
  dbb.get().then(

    
  (querySnapshot) {
    
    
    for (var docSnapshot in querySnapshot.docs) {
      //print(docSnapshot.data());
      final data =docSnapshot.data() ;
      data.forEach((key, value) {
          //print(value);
          var data2 = Orders.fromjson(value);
          _userorder.add(data2);
          print(_userorder[0].totalPayment);
    });
    update();

      
      
      
      
    }
  },
  onError: (e) => print("Error completing: $e"),
);

  }


       
  getusersdata(){
    

    db.collection("order").where("order_time", isLessThanOrEqualTo: DateTime.now(),).get().then(
  (querySnapshot) {
    print("Successfully completed");
    
    for (var docSnapshot in querySnapshot.docs) {
      print(docSnapshot.data());
      
    }
  },
  onError: (e) => print("Error completing: $e"),
);

  }

 

  updaateindex(int index) {
    indexx == index;
    print(index);

    update();
  }



  paytr()async {
  // Link API Create Servisi icin kullanılacak örnek kod yapısı.

  var params = {
    // Add your parameters here
    
  };

  var result = await http.post(Uri.parse('https://www.paytr.com/odeme/api/link/create'), body: params);
  var res = json.decode(result.body);

  if (res['status'] == 'error') {
    print('Error: ${res['err_msg']}');
  } else if (res['status'] == 'failed') {
    print(result.body);
  } else {
    print(result.body);
  }
}

  




  chekorderstatuse(data) {}

}