import 'package:cloud_firestore/cloud_firestore.dart';

class Userinfo {
  final String district;
  final String apartman;
  final String country;
  final String city;
  final String homeno;
  final int phonenum; //phone_num
  final bool isonline;
  final String lastname;
  final String useremail; //user_email
  final String moreinfoadres;

  final String name;
  final String age; //age
  final String strets;
  final String userlanguage;
  final GeoPoint userlocation;
  final Timestamp lastlogin; //last_login

  Userinfo(
      {required this.district,
      required this.age,
      required this.apartman,
      required this.country,
      required this.city,
      required this.homeno,
      required this.phonenum,
      required this.isonline,
      required this.lastname,
      required this.useremail,
      required this.moreinfoadres,
      required this.name,
      required this.lastlogin,
      required this.strets,
      required this.userlanguage,
      required this.userlocation});

  static Map<String, dynamic> tojson(Userinfo orderinfo) {
    return {
      'District': orderinfo.district,
      'apartman': orderinfo.apartman,
      'country': orderinfo.country,
      'city': orderinfo.city,
      'hose_no': orderinfo.homeno,
      'phone_num': orderinfo.phonenum,
      'is_online': orderinfo.isonline,
      'last_name': orderinfo.lastname,
      'user_email': orderinfo.useremail,
      'more info': orderinfo.moreinfoadres,
      'name': orderinfo.name,
      "last_login": orderinfo.lastlogin,
      "strets": orderinfo.strets,
      "user_language": orderinfo.userlanguage,
      'user_location': orderinfo.userlocation,
      'age': orderinfo.age

      // 'paymentInfo': paymentInfo!.toMap(),
    };
  }

  factory Userinfo.fromjson(Map<String, dynamic> map) {
    return Userinfo(
        district: map['District'] ?? '+91 1234567890',
        apartman: map['apartman'] ?? 'unknowadress',
        country: map['country'] ?? "no data",
        city: map['city'] ?? "no data",
        homeno: map['hose_no'] ?? "no data",
        phonenum: map['phone_num'] ?? "no data",
        isonline: map['is_online'] ?? "no data",
        lastname: map['last_name'],
        useremail: map['user_email'] ?? "no data",
        moreinfoadres: map['more info'] ?? "no data",
        name: map['name'] ?? "no data",
        lastlogin: map['last_login'],
        strets: map['strets'] ?? 0,
        userlanguage: map['user_language'] ?? 'AR',
        userlocation: map['user_location'],
        age: map['age']

        // paymentInfo: Payment.fromMap(
        //   map['paymentInfo'],
        //   FirebaseAuth.instance.currentUser!,
        //////strets: map['orderedDate'] ?? DateTime.now().toString(),
        );
  }
}

class Orders {
  late final bool? paymentptatus; //payment_status
  late final int? orderNo; //order_no
  late final int? orderstatus; //order_status
  late final dynamic orderTime; //order_time

  late final List<OrdProductList> productList; //
  late final String? shapinginfo; //shaping_info
  late final double? totalPayment; //total_payment

  Orders(
      {required this.orderTime,
      required this.paymentptatus,
      required this.productList,
      required this.totalPayment,
      required this.orderstatus,
      required this.shapinginfo,
      required this.orderNo});

  Map<String, dynamic> tojson() {
    return {
      "order_no": orderNo,
      "payment_status": paymentptatus,
      "order_status": orderstatus,
      "total_payment": totalPayment,
      "order_time": orderTime,
      "shaping_info": shapinginfo,
      " product_List": productList.map((e) => e.tojson()).toList()
    };
  }

  Orders.fromjson(Map<String, dynamic> map) {
    //print(map['product_List']);
    paymentptatus = map['payment_status'];
    orderNo = map['order_no'];
    orderstatus = map['order_status'];
    totalPayment = map['total_payment'];
    orderTime = map['order_time'] as Timestamp?;
    shapinginfo = map['shaping_info'];
    productList = <OrdProductList>[];
    map[' product_List'].forEach((v) {
      productList.add(OrdProductList.fromJson(v));
    });
  }
}

class OrdProductList {
  ///box_no
  late final bool isNotInmarket; //is_not_in_market
  late final bool isOrderd; //is_orderd
  late final bool isshaped; //is_shaped
  late final bool isShapingAllowed; //is_shaping_allowed
  late final bool isUserAllowed; //is_user_allowed
  late final String notes;
  late final String productId; //product_id
  late final String productweight; //product_width
  late final String shelfNo; //shelf_no
  late final double shapeprice;
  late final String productattributename;
  late final String productattributevalue;
  late final String productbuyedprice;
  late final String producturl;

  //shpe_price

  OrdProductList(
      {required this.isNotInmarket,
      required this.isOrderd,
      required this.isshaped,
      required this.isShapingAllowed,
      required this.isUserAllowed,
      required this.notes,
      required this.productId,
      required this.productweight,
      required this.shelfNo,
      required this.productattributename,
      required this.productattributevalue,
      required this.productbuyedprice,
      required this.producturl,
      required this.shapeprice});

  Map<String, dynamic> tojson() => {
        'is_not_in_market': isNotInmarket,
        'is_orderd': isOrderd,
        'is_shaped': isshaped,
        'is_shaping_allowed': isShapingAllowed,
        'is_user_allowed': isUserAllowed,
        'notes': notes,
        'product_id': productId,
        'product_weight': productweight,
        'shelf_no': shelfNo,
        'product_attribute_name': productattributename,
        'product_attribute_value': productattributevalue,
        'product_buyed_price': productbuyedprice,
        'product_url': producturl,
        'shape_price': shapeprice,
      };

  OrdProductList.fromJson(Map<String, dynamic> value) {
    isNotInmarket = value['is_not_in_market'];
    isOrderd = value['is_orderd'];
    isshaped = value['is_shaped'];
    isShapingAllowed = value['is_shaping_allowed'];
    isUserAllowed = value['is_user_allowed'];
    notes = value['notes'];
    productId = value['product_id'];
    productweight = value['product_weight'];
    shelfNo = value['shelf_no'];
    productattributename = value['product_attribute_name'];
    productattributevalue = value['product_attribute_value'];
    productbuyedprice = value['product_buyed_price'];
    producturl = value['product_url'];
    shapeprice = value['shape_price'];
  }
}
