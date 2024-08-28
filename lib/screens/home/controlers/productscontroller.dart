import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
///import 'package:translator/translator.dart';

//import 'package:web_scraper/web_scraper.dart';
import 'package:http/http.dart' as http;
import 'package:turkmart/screens/home/home_screen.dart';
import 'package:turkmart/screens/home/model/apidatamodel.dart';
import 'package:turkmart/screens/nvibar/controler1/navbar.dart';
import 'dart:convert' as convert;

import '../model/apidatamodel.dart';
import '../model/try.dart';

import 'package:shared_preferences/shared_preferences.dart';

// Create storage

class ProductController extends GetxController {
  
  //WebScraper webScraper = WebScraper('https://www.trendyol.com');
   final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

   

  List<dynamic> get result => _result;
  List<Products> get products => _products;
  List<String> get text => _text;
   List<Products> get favoritlist => _favoritlist;
   int  get exchangerate=> _exchangerate;
   final int _exchangerate = 30;
  


  final List<String> _text = [];

  final List<dynamic> _result = [];
  final List<Products> _products = [];

  final List<String> _linkurl = [];
  int pageindex = 1;
  List get tryprice => _tryprice;

  final List<Converttru> _tryprice = [];
  final List<Products> _favoritlist =[];

   ScrollController pcontroller =new ScrollController();
  
  

  

  @override
  void onInit()async {
    getproductdetails('/elbise-x-c56');
     update();

    pcontroller.addListener(() {
      addItems();
       var offset =pcontroller.position.pixels;
    });
     //add saved proudact 
    final SharedPreferences prefs = await SharedPreferences.getInstance();
          //read new list after add data
      String? json = prefs.getString("favolist");
      //convert data
      List list = jsonDecode(json!);
      //loop to ricevd data list
      for (var i=0; i<list.length; i++) {
        var favjson = Products.fromJson(list[i]);
        //add new data to list 
         favoritlist.add(favjson);
         print(favoritlist.length);
    

    

    
}
    super.onInit();
    

  }

  @override
  void onReady() {
    pcontroller.addListener(() {
      addItems();
    });
     
    super.onReady();
  }

  addItems() async {
    if (pcontroller.hasClients){
    

      if ( pcontroller.position.pixels==pcontroller.position.maxScrollExtent) {
        pageindex = pageindex + 1;
        print("lode more data page index $pageindex");
        getproductdetails( _linkurl[0]);
        
        //for (int i = 0; i < 2; i++) {
          
          update();
        }
      

  }}
  

  ///delet products from list befor dawonlode anthore
  ///
  void clearproducts() {
    _products.clear();
    _linkurl.clear();
    _text.clear();
    pageindex = 1;

    update();
  }

  /// product group detalis useing for get colors name  with colors images

  /// get card data price and title colors
  getproductdetails(String partUrl) async {
    print(partUrl);
    // add url to list for fitch more data with scrolling
    _linkurl.add(partUrl);

    if (true) {
      var url = Uri.https(
          'public.trendyol.com',
          '/discovery-web-searchgw-service/v2/api/infinite-scroll$partUrl',
          {'pi': '$pageindex'});

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final data = convert.jsonDecode(response.body) as Map<String, dynamic>;

        ///print(data);
        List prodct = data['result']['products'];
        for (var i = 0; i < prodct.length; i++) {
          products.add(Products.fromJson(prodct[i]));
          //Translation tr = await products[i].categoryName!.translate(to: 'ar');

          //text.add(tr.toString());
          //print('looding product list >from product controler');
          //print(tr);

          print(products[i].productGroupId);
          //await getproductimagescolors(products[i].productGroupId.toString());
          ////print(products[i].variants![0].attributeName);
          ///print(products[i].variants![0].attributeValue);
          ////print(products[i].imageAlt);
        }

        print('data  loded and add to list ');

        update();
        

        //// {isSuccess: true, statusCode: 200, error: null, result: {slpName: , products: [{id: 1815977, name: Fruity Rhythm Edt 50 ml Kadın Parfüm  3412244510004, images: [/ty128/product/media/images/20210609/14/97887842/11443082/1/1_org_zoom.jpg], imageAlt: adidas Fruity Rhythm Edt 50 ml Kadın Parfüm  3412244510004, brand: {id: 33, name: adidas}, tax: 18, businessUnit: Parfüm, ratingScore: {averageRating: 4.480769230769231, totalCount: 104}, showSexualContent: true, productGroupId: 1464347, hasReviewPhoto: true, sections: [{id: 1}, {id: 2}, {id: 11}, {id: 12}, {id: 101405}], variants: [{attributeValue: Tek Ebat, attributeName: beden, price: {discountedPrice: 80.95, buyingPrice: 0, originalPrice: 80.95, sellingPrice: 80.95}, listingId: bba8c0af5ce8af3a2d576b9256d5d35f, campaignId: 61, merchantId: 127624, discountedPriceInfo: , hasCollectableCoupon: false}], categoryHierarchy: Kozmetik & Kişisel Bakım/Parfüm/Parfüm ve Deodorant, categoryId: 661, categoryName: Parfüm, url: /adidas/fruity-rhythm-edt-50-ml-kadin-
      } else {
        var url = 'https://public.trendyol.com'
                '/discovery-web-searchgw-service/v2/api/filter$partUrl'
                '&pi='
                '$pageindex',
            request = http.Request('GET', Uri.parse(url));
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          var data = convert.jsonDecode(await response.stream.bytesToString())
              as Map<String, dynamic>;

          List prodct = data['result']['products'];
          //print(prodct);
          for (var i = 0; i < prodct.length; i++) {
            ///print(prodct[i]);
            products.add(Products.fromJson(prodct[i]));

            ///print(products[i].productGroupId);
          }
        } else
          print(url);
        _linkurl.clear();

        print('the url is not avibalee ');
        Get.to(
        Empytscren());
      }
    }
    update();
  }

  getTRYprice(double price) async {
    String url =
        "https://api.exchangeratesapi.io/v1/latest?access_key = 13c92fe51a5b2ed9d534600068ece9d7";
    var request = http.Request('GET', Uri.parse(url));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(await response.stream.bytesToString());
      _tryprice.add(Converttru.fromJson(data));

      var usd = _tryprice[0].results?.uSD;
      print(usd! * price);
      print("price");

      return usd * price;
    }
    throw {};
  }


  bool isFavorit(int id){
    return favoritlist.any((Products)=>Products.id==id);
  }

  void addtofavorites(int index ,int id )async {
    
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    if(favoritlist.any((Products)=>Products.id==id)){
      print("product in fav list");    
  }else{
    print('product add to database');
    //add product to list
    favoritlist.add(products[index]);
    if(favoritlist.contains(products[index])){
      print("data is in list and we add to database");
      //convert list to string
      String json2=jsonEncode(favoritlist);
      //add product to data base
      prefs.setString("favolist",json2);
      //print(favoritlist.length);
      //claerlist to update
      favoritlist.clear();
      //read new list after add data
      String? json = prefs.getString("favolist");
      //convert data
      List list = jsonDecode(json!);
      //loop to ricevd data list
      for (var i=0; i<list.length; i++) {
        var favjson = Products.fromJson(list[i]);
        //add new data to list 
         favoritlist.add(favjson);
         print(favoritlist.length);
    

    

    
}}
      
      
      
       

      //favoritlist.add(favjson);
         
      //print(favjson);
   

  } update();








  
}
}

class Empytscren extends GetView {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset
                  ("assetss/icons/Question mark.svg"
                  ,
                  color: Color.fromARGB(179, 231, 39, 25),
                  width: 30.w,
                ),
              Text('sorry this page cant be found',style: TextStyle(fontSize: 1.w*1.h,color: Color.fromARGB(255, 167, 164, 164))),
            TextButton(onPressed: (){
              Get.off(HomeScreen());
            }, child: Text("GoBack"))
            ],
          ),
        ),
        bottomNavigationBar: Navigationbar(),
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Color.fromARGB(201, 252, 187, 182),
          backgroundColor: Color.fromARGB(255, 255, 115, 115),
          automaticallyImplyLeading: false,
          title: Text(
            'Error',
            style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
            
          ),
        ));
  }
}











///https://public.trendyol.com/discovery-web-searchgw-service/v2/api/infinite-scroll/erkek-t-shirt-x-g2-c73?pi=50&culture=tr-TR&userGenderId=2&pId=0&sc
///
///https://public.trendyol.com/discovery-web-searchgw-service/v2/api/filter/sr?tag=AnasayfaAll
///url to git to sub item names and url
///https://public.trendyol.com/discovery-web-searchgw-service/v2/api/aggregations/kadin-giyim-x-g1-c82?culture=tr-TR&categoryRelevancyEnabled=false&priceAggregationType=DYNAMIC_GAUSS///
///https://public.trendyol.com/discovery-web-searchgw-service/v2/api/product-groups/color-options?productGroupIds[]=30676429&productGroupIds[]=31898377&productGroupIds[]=31896688&productGroupIds[]=30676429&productGroupIds[]=30676429&productGroupIds[]=31870354&productGroupIds[]=31896642&productGroupIds[]=30676429&productGroupIds[]=31868893&productGroupIds[]=31896485&productGroupIds[]=252789048&productGroupIds[]=252789048&productGroupIds[]=31896609&productGroupIds[]=30676429&productGroupIds[]=237837396&productGroupIds[]=107219994&productGroupIds[]=31896984&productGroupIds[]=76561196&productGroupIds[]=187316990&productGroupIds[]=120913932&productGroupIds[]=239042740&productGroupIds[]=124311323&productGroupIds[]=30676428&productGroupIds[]=31896643

