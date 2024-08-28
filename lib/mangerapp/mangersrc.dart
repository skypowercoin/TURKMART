import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:turkmart/mangerapp/mangercontroler.dart';
import 'package:turkmart/screens/home/components/product_data_list_view.dart';
import 'package:turkmart/screens/home/controlers/productscontroller.dart';
import 'package:turkmart/screens/orders/model.dart';
import 'package:url_launcher/url_launcher.dart';


class Mngerscr extends GetView {
  Mngerscr({Key? key}) : super(key: key);
  final mangerontroler con = Get.put(mangerontroler());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         
          appBar: AppBar(
            shadowColor: Color.fromARGB(255, 17, 189, 219),
            backgroundColor: const Color(0xFFFFFFFF),
            automaticallyImplyLeading: false,
            title: Text(
              'manger app'.tr,
              style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
            ),
          ),
          body: GetBuilder<mangerontroler>(
            init: mangerontroler(),
            initState: (_) {},
            builder: (oc) {
              return oc.listoforders.length>0? ListView.builder(
                itemCount: oc.listoforders.length,
                itemBuilder: (BuildContext context, int index) {
                  DateTime t = con.listoforders[index].orderTime!.toDate();
      
                  return Container(
                    child: Padding(
                      padding:  EdgeInsets.all(1.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                              style: const ButtonStyle(),
                              onPressed: () {
                                ;
                                print(index);
                                //Get.to(MangerOrderinfo(
                                  
                               // ));
                              },
                              child: Text(
                                '${"order_Number".tr}\n${oc.listoforders[index].orderNo}${t.day}${t.month}${t.year}',
                                style: TextStyle(
                                    fontSize: 10.h/1.w,
                                    color: oc.listoforders[index].orderstatus == 5
                                        ? Colors.grey
                                        : Color.fromARGB(255, 7, 212, 168)),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [IconButton(onPressed: (){
                              oc.chatwithcustomer(oc.listoforders[index].shapinginfo.toString());
                              print(oc.listoforders[index].shapinginfo.toString());
                              //oc.listoforders[index].shapinginfo.toString()
                              
                              print("chat with customer");
                            },
                          icon: SvgPicture.asset
                ("assetss/icons/Chat bubble Icon.svg"
                ,
                color: Color.fromARGB(179, 59, 235, 153),
                width:10.h/1.w,
              )),
                              Text(
                                '${"Number of products".tr}\n${oc.listoforders[index].productList.length}',
                                style: TextStyle(fontSize: 10.h/1.w),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: 10.h/1.w, end:10.h/1.w),
                                child: Text(
                                    '${"total".tr}\n${roundDouble(oc.listoforders[index].totalPayment!/ProductController().exchangerate .toDouble(),4)}USD',
                                    style: TextStyle(fontSize: 10.h/1.w)),
                              ),
                            ],
                          ),
                          SizedBox(height:63.h,
                          child: MangerOrderinfo(productList:oc.listoforders[index].productList,)
                          
                          

                          
                          
                          ),
                          Divider()
                        ],
                      ),
                    ),
                  );
                },
              ):Center(child: Text("NOdata"),);
            },
          ));
    
  }
}
class MangerOrderinfo extends GetView {
  late final List<OrdProductList> productList;


   MangerOrderinfo({
    super.key,
    required this.productList,
  });
  



@override
  Widget build(BuildContext context,) {
    return  GetBuilder<mangerontroler>(
      init: mangerontroler(),
      initState: (_) {},
      builder: (_) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productList.length,
            itemBuilder: (context, index) => buildimagestList(index, context));
      },
    );
    
    
    
    
    
  }
  
  buildimagestList(int index, BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
                        child: Image.network(
                        productList[index].producturl,
                        height:100.h/2.w,
                      )),
                      
                               Text(
                                '\n${productList[index].productattributevalue}',
                                style: TextStyle(
                                    fontSize: 10.h/1.w,
                                    color: productList[index].isOrderd == true
                                        ? const Color.fromARGB(255, 224, 37, 37)
                                        : Color.fromARGB(255, 7, 212, 168)),
                              ),
                              TextButton(
                              style:  ButtonStyle(),
                              onPressed: () {
                                launch(productList[index].productweight );
                                
                                
                                //print(productList[index].productweight)
                                ;
                                //print(productList[index].producturl);
                                //print(index);
                                //Get.to(MangerOrderinfo(
                                  
                               // ));
                              },
                              child: Text(
                                'Buy now\n${productList[index].productbuyedprice} Tl',
                                style: TextStyle(
                                    fontSize: 10.h/1.w,
                                    color: productList[index].isOrderd == true
                                        ? const Color.fromARGB(255, 224, 37, 37)
                                        : Color.fromARGB(255, 7, 212, 168)),
                              )),
                              Text(
                                'isshaped\n',
                                style: TextStyle(
                                    fontSize:10.h/1.w,
                                    color: productList[index].isshaped == false
                                        ? const Color.fromARGB(255, 224, 37, 37)
                                        : Color.fromARGB(255, 7, 212, 168)),
                              ),
                               Text(
                                'shape info\n${productList[index].shelfNo}',
                                style: TextStyle(
                                    fontSize: 10.h/1.w,
                                    color: productList[index].isshaped == false
                                        ? Color.fromARGB(255, 59, 190, 241)
                                        : Color.fromARGB(255, 7, 212, 168)),
                              ),
                              Text(
                                'Notes\n${productList[index].notes}',
                                style: TextStyle(
                                    fontSize: 10.h/1.w,
                                    color: productList[index].isNotInmarket== false
                                        ? Color.fromARGB(255, 255, 137, 59)
                                        : Color.fromARGB(255, 250, 29, 202)),
                              ),
                              
      ],
    );
  }
 
}
