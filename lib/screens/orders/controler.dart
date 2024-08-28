import 'dart:core';
 import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'listoforders.dart';
import 'model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Ordercontroler extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  final storage = new FlutterSecureStorage();

  late List<int> activeStepa = [3];
  final List<Orders> _userorder = [];
  RxInt indexx = 0.obs;
  late bool isdataloded = false;
  List<Orders> get listoforders => _userorder;
  //used if user add addares info to database
  late bool isuseraddaddress = false;

  @override
  void onInit() {
    print("Ordercontroler - onInit");
    

    super.onInit();
  }

  @override
  void onReady() {
    print("Ordercontroler - onReady");

    super.onReady();
  }

  @override
  void onClose() {
    print("Ordercontroler- onclose");

    super.onClose();
  }

  getorderlist() async {
    String? value = await storage.read(key: 'isuseraddinfo')??"No data found!";
    if(value=='true'){
      print(value);
              isuseraddaddress==true;

            }
    _userorder.clear();
    _userorder.contains(Orders);
    final user = auth.currentUser;
    final uid = user!.uid;
    final docRef = db.collection("order").doc(uid);
    await docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        data.forEach((key, value) {
          print(value);
          var data2 = Orders.fromjson(value);
          _userorder.add(data2);
          print(data2.orderNo);
          print(data2.productList[0].productId);
          //if (data2.paymentptatus == false) {
          //activeStep.clear();
          //activeStep.add(data2.orderstatus!);
          isdataloded = true;

          update();
          //}
        });
        Get.to(ListofOrders());
      },
      onError: (e) => print("Error getting document: $e"),
    );
    update();
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

  
  void adduserinfotodatabase(
    
    String name, String country, String city, String addressInformation, String phonenumber 
  )async {
    
    final user = auth.currentUser;
    final uid = user!.uid;
    if (uid!= null) {
      try {
        await db
            .collection("order")
            .doc(uid)
            .collection("userinfo")
            .doc("usreid")
            .set({'name': name, "country": country, "city": city,"addressInformation":addressInformation},SetOptions(merge: true));
            
            await storage.write(key: 'isuseraddinfo', value:"true");
            String? value = await storage.read(key: 'isuseraddinfo');
            if(value=='true'){
      
              isuseraddaddress==true;

            }
            print(value);
            
            
            
             
      } on FirebaseFirestore catch (e) {
        var errorMessage = e.toString();
        print(errorMessage);
      }
    }

     
  }
}
