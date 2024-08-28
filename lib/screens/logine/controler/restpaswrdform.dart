import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../components/original_button.dart';

class RsetPaswordForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RsetPaswordForm();
  }
}

@override
class _RsetPaswordForm extends State<RsetPaswordForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(children: <Widget>[
              TextFormField(
                ///decoration: const InputDecorator(
                /// labelText: 'Enter your email',
                ///hintText: 'ex: test@gmail.com',
                //),
                onChanged: (value) {
                  _email = value;
                },
                validator: (value) => value!.isEmpty ? 'maileerorr'.tr : null,
              ),
              SizedBox(
                height: 2.h,
              ),
              OriginalButton(
                  sidecolor: Colors.black,
                  text: 'send Password Reset link to Email'.tr,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: _email);
                        Navigator.of(context).pushReplacementNamed('login');
                      } on FirebaseException {
                        setState(() {});
                      }
                    }
                  },
                  color: Colors.blue.shade900,
                  textColor: Colors.white),
              const SizedBox(
                height: 20.0,
              ),
              OriginalButton(
                sidecolor: Colors.black,
                text: "Back".tr,
                color: Color.fromARGB(179, 255, 117, 67),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('login');
                },
              )
            ])));
  }
}
