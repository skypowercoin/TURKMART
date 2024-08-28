import 'package:get/get.dart';

import '../model/detals.dart';

import '../model/productgrubemodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductView extends GetxController {
  List<String> get images => _image;
  final List<String> _image = [];
  List<Contents> get colorimages => _colorsimage;
  final List<Contents> _colorsimage = [];
  List<String> get size => _size;

  final List<String> _size = [];
  RxInt isSelected = 0.obs;

  Rx<String> attrbutetype = ''.obs;
  RxInt isSelectedimage = 1.obs;
  late final List<String> _lovedattributeValue = [];
  List<String> get lovedattributeValue => _lovedattributeValue;

  final List<Contents> _lovedcolor = [];
  List<Contents> get lovedcolor => _lovedcolor;

  @override
  void onInit() {
    print("DetailsScreen controler - onInit");

    super.onInit();
  }

  @override
  void onReady() {
    print(" DetailsScreen _ on ready");
    super.onReady();
  }

  @override
  void onClose() {
    _image.clear();
    print('cccolse');

    super.onClose();
  }

  addimagetoslider(String imagelink) {
    _image.clear();
    _image.add(imagelink);
    //print(imagelink);
    update();
  }

  void changecolor(int index) {
    //lovedattributeValue.clear();

    /// used for change attrbute color with tap and sive  liked attrbute (ex:size 43 )
    isSelected = index.obs;
    //_lovedattributeValue.add(size[index]);

    update();
  }

  getproductimagescolors(String productGroupId) async {
    var url = Uri.https('public.trendyol.com',
        '/discovery-web-websfxproductgroups-santral/api/v1/product-groups/$productGroupId');
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body) as Map<String, dynamic>;
      Productgroups productdet = Productgroups.fromJson(data);
      var slicingAttributes = productdet.result.slicingAttributes;
      for (var i = 0; i < slicingAttributes.length; i++) {
        var attributes = slicingAttributes[i].attributes;
        for (var a = 0; a < attributes.length; a++) {
          var contents = attributes[a].contents;
          var colorName = attributes[a].name;
          //print('c$a color $colorName');
          for (var c = 0; c < contents.length; c++) {
            var proid = contents[c].id;
            var imageurl = contents[c];
            _colorsimage.add(imageurl);

            var color = contents[c].url;
            var praice = contents[c].price!.sellingPrice.value;
            print('$colorName  $praice   $proid $color');
          }
        }
      }
    } else {
      throw Exception('eror502');
    }

    /// product details we use for get size or other detail with product id
    update();
  }

  ///https://public.trendyol.com/discovery-web-productgw-service/api/size-expectation/682504885
  getproductsize(String productId) async {
    
    var url = Uri.https('public.trendyol.com',
        '/discovery-web-productgw-service/api/productDetail/$productId');
    var response = await http.get(url);
    // ignore: unrelated_type_equality_checks
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body) as Map<String, dynamic>;
      ProductDetail prodat = ProductDetail.fromJson(data);
      print(prodat.result.alternativeVariants);
      ///print(prodat.result!.variants[0].attributeName);
      //loop to fetch size and
      List<AllVariants> varints = prodat.result.allVariants;
      for (var i = 0; i < varints.length; i++) {
        print(i);
        var size = varints[i].value;
        _size.add(size!);
        var _attrbutetype = prodat.result.variants[0].attributeType;
        attrbutetype = _attrbutetype.obs;
        var isavilbale = varints[i].inStock;
        print(
            'stock is $attrbutetype pro advibel size is $size and$isavilbale');
      }
      update();

      ///print(data["result"]["variants"][0]["attributeValue"].toString());
    } else {
      throw Exception("filed to lode product data");
    }
  }

  ///useing for user selcted size
  void choesesize(int index) {
    if (_lovedattributeValue.isEmpty) {
      _lovedattributeValue.add(_size[index]);
    } else {
      _lovedattributeValue.clear();
      _lovedattributeValue.add(_size[index]);
    }
  }

  void changeselctedimage(int index) {
    isSelectedimage = index.obs;
    update();
  }

  ///clen list  befor update data to database
  void clearsizeandcolor() {
    _lovedcolor.clear();
    _lovedattributeValue.clear();
  }

  void choesedcolor(Contents colorimag) {
    if (_lovedcolor.isEmpty) {
      _lovedcolor.add(colorimag);
    } else {
      _lovedcolor.clear();
      _lovedcolor.add(colorimag);
    }
  }
}
