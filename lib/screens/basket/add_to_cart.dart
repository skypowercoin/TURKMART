import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

import 'package:sizer/sizer.dart';

import '../../global_controler/constants.dart';
import '../home/components/product_data_list_view.dart';
import '../home/controlers/productscontroller.dart';
import '../home/model/apidatamodel.dart';
import '../orders/controler.dart';
import 'basketcontroler.dart';
import 'body.dart';

class AddToCart extends GetView {
  AddToCart({
    required this.product,
  });

  final Products product;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.blueGrey,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assetss/icons/add_to_cart.svg",
              ),
              onPressed: () {
                String lovedproduct = jsonEncode(product);

                ///add data to basket
                box.write('basket', lovedproduct);

                ///var data = box.read<Products>('basket');
                Get.to(basket());

                ///print(data!.discountedPriceInfo);
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Buy  Now".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CartBody extends GetView<Basketcon> {
  Basketcon cont = Get.put(Basketcon());

  CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.h, bottom: 0.5.h),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cont.productsbasket.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Dismissible(
            movementDuration: Duration(milliseconds: 5000),
            resizeDuration: Duration(milliseconds: 1000),
            key: Key(cont.productsbasket[index].name.toString()),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              print('data removed');
              Ordercontroler().updaateindex(1);

              cont.removeproduct(index);

              ///rmove data from list
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 1.h),
              decoration: BoxDecoration(
                color: Color.fromARGB(58, 252, 132, 132),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w),
                    child: SvgPicture.asset(
                      "assetss/icons/recyclebin.svg",
                      width: 5.w,
                    ),
                  ),
                ],
              ),
            ),

            ///child: Text(cont.productsbasket[index].id.toString())

            child: CartCard(cart: cont.productsbasket[index], index: index),
          ),
        ),
      ),
    );
  }
}

class CartCard extends GetView {
  final int index;

  CartCard({
    Key? key,
    required this.cart,
    required this.index,
  }) : super(key: key);

  late Products cart;
  final String _startlink = 'https://cdn.dsmcdn.com';
  Basketcon cont = Get.put(Basketcon());

  @override
  Widget build(BuildContext context) {
    final noi = cont.order[index];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AnimatedContainer(
          height: 16.h,
          width: 20.w,
          duration: const Duration(milliseconds: 1000),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Image.network(
              noi.colorinfo.imageUrl.isEmpty
                  ? _startlink + cart.images![0]
                  : _startlink + noi.colorinfo.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              cart.id.toString(),
              style: TextStyle(
                  color: Color.fromARGB(255, 236, 100, 8), fontSize: 16),
              maxLines: 5,
            ),
            Row(
              children: <Widget>[
                buildOutlineButton(
                  icon: Icons.remove,
                  press: () {
                    if (noi.numberofitems > 1) {
                      noi.numberofitems--;
                      cont.updatetotal();
                    }
                    cont.update();
                  },
                ),
                GetBuilder<Basketcon>(
                  init: Basketcon(),
                  initState: (_) {},
                  builder: (_) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        noi.numberofitems.toString().padLeft(1, 'x'),
                        // if our item is less  then 10 then  it shows 01 02 like that

                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  },
                ),
                buildOutlineButton(
                    icon: Icons.add,
                    press: () {
                      noi.numberofitems++;
                      cont.updatetotal();
                      cont.update();
                    }),
              ],
            ),
            Text.rich(
              TextSpan(
                text: "\$${roundDouble(cart.price!.sellingPrice/ProductController().exchangerate,2)}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 2, 201, 92)),
                children: [
                  TextSpan(
                      text: " ${noi.attributeName}  ${noi.attributeValue}",
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({required icon, required press}) {
    return SizedBox(
      width: 100.w/6,
      height: 100.h/20,
      child: OutlinedButton(
      ///buttonst: EdgeInsets.zero,
        //shape: RoundedRectangleBorder(
        ///borderRadius: BorderRadius.circular(13),
        //),
        onPressed: press,
        child: Padding(
          padding:  EdgeInsetsDirectional.only(start: 1.w),
          child: Icon(
            icon,
            size: 1.w * 1.h,
          ),
        ),
      ),
    );
  }
}
