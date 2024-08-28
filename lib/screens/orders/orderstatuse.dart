import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turkmart/screens/home/home_screen.dart';

import '../../components/original_button.dart';
import 'controler.dart';

class AdressStatuse extends GetView {
  AdressStatuse({Key? key}) : super(key: key);
  final Ordercontroler con = Get.put(Ordercontroler());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Ordercontroler>(
        init: Ordercontroler(),
        initState: (_) {},
        builder: (_) {
          return MyCustomForm();
        });
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
  String _name='', _country = '', _city = '', _addressInformation = '', _phonenumber = '';
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: EdgeInsetsDirectional.only(
                top: 1.h, bottom: 0.63.h, start: 2.w),
            child: Text(
              "name".tr,
              style: TextStyle(fontSize: 6.w),
            ),
          ),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value!.length <= 2 || value.isEmpty) {
                return 'Please enter a valid  name'.tr;
              }else{
                 _name=value;
              }
              return null;
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 1.h, bottom: 0.63.h, start: 2.w),
            child: Text(
               "phone number".tr,
              style: TextStyle(fontSize: 6.w),
            ),
          ),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value!.length <= 10 || value.isEmpty) {
                return 'phone number error'.tr;
              }else{
                 _phonenumber=value;
              }
              return null;
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 1.h, bottom: 0.63.h, start: 2.w),
            child: Text(
              "country".tr,
              style: TextStyle(fontSize: 6.w),
            ),
          ),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value!.length <= 2 || value.isEmpty) {
                return 'Please enter a valid country name'.tr;
              }else{
                 _country=value;
              }
              return null;
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 1.h, bottom: 0.63.h, start: 2.w),
            child: Text(
              "state&city ".tr,
              style: TextStyle(fontSize: 5.w),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value!.length <= 2 || value.isEmpty) {
                return 'Please enter a valid state&city name'.tr;
              }else{
                _city =value;
              }
              return null;
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: 1.h, bottom: 0.63.h, start: 2.w),
            child: Text(
              "more Address Information".tr,
              style: TextStyle(fontSize: 5.w),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value!.length <= 2 || value.isEmpty) {
                return 'more Address Information'.tr;
              }else{
                _addressInformation=value;
              }
              return null;
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 2.w),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  Ordercontroler().adduserinfotodatabase( _name, _country , _city , _addressInformation , _phonenumber );

                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  if(Ordercontroler().isuseraddaddress){ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'The address has been registered in the database. Thank you'
                                .tr)),
                  );}//Get.off(HomeScreen());
                }
              },
              child: Text('Submit'.tr),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentStatuse extends GetView {
  final int index;
  PaymentStatuse({Key? key, required this.index}) : super(key: key);
  final Ordercontroler con = Get.put(Ordercontroler());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Ordercontroler>(
      init: Ordercontroler(),
      initState: (_) {},
      builder: (_) {
        return Column(
          children: [
            Text(
              "totalwithshapin".tr,
              style: TextStyle(fontSize: 3.h),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 2.h, bottom: 2.h),
              child: Text(
                  ' ${_.listoforders[index].totalPayment.toString()}${' USD'}',
                  style: TextStyle(fontSize: 3.h, color: Colors.green)),
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: OriginalButton(
                textColor: Color.fromARGB(193, 13, 14, 13),
                sidecolor: Color.fromARGB(255, 118, 67, 248),
                color: Color.fromARGB(179, 255, 117, 67),
                text: 'allow&Payment'.tr,
                onPressed: () {
                  print('thnks for payments');
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class shapingStatuse extends GetView {
  shapingStatuse(this.index, {Key? key}) : super(key: key);
  final Ordercontroler con = Get.put(Ordercontroler());
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Ordercontroler>(
        init: Ordercontroler(),
        initState: (_) {},
        builder: (_) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 2.h, bottom: 2.h, start: 2.w),
                child: Text(
                  "shapemasge".tr,
                  style: TextStyle(fontSize: 6.w),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 2.h, bottom: 2.h, start: 2.w),
                child: Text(' ${_.listoforders[index].shapinginfo.toString()}',
                    style: TextStyle(fontSize: 3.h, color: Colors.green)),
              ),
            ],
          );
        });
  }
}

class FinishStatuse extends GetView {
  FinishStatuse({Key? key}) : super(key: key);
  final Ordercontroler con = Get.put(Ordercontroler());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Ordercontroler>(
        init: Ordercontroler(),
        initState: (_) {},
        builder: (_) {
          return Column(children: [
            Padding(
              padding:
                  EdgeInsetsDirectional.only(top: 2.h, bottom: 2.h, start: 2.w),
              child: Text(
                "FinishStatuse".tr,
                style: TextStyle(fontSize: 6.w),
              ),
            ),
          ]);
        });
  }
}
