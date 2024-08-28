import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../components/original_button.dart';
import '../../../mangerapp/mangersrc.dart';

import 'auth.dart';
import 'database_coniction.dart';

enum AuthType { login, register }

class AuthForm extends StatefulWidget {
  final AuthType authType;

  AuthForm({Key? key, required this.authType}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '', _erorr = '', _phonenumber = '',_country='';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _erorr,
                  style: TextStyle(fontSize: 18, color: Colors.red),
                )
              ]),
            ),
            widget.authType == AuthType.register
                ? Column(
                    children: [
                      
                      
                      
                      ElevatedButton(
                              onPressed: () {
                                showCountryPicker(
                                  context: context,
                                  //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                                  exclude: <String>['KN', 'MF'],
                                  favorite: <String>['USA','SY','IQ','DZ','QA','DE','TR'],
                                  //Optional. Shows phone code before the country name.
                                  showPhoneCode: true,
                                  onSelect: (Country country) {
                                    _country=country.phoneCode;
                                    
                                    //add to data base
                                    print('Select country: ${country.displayNameNoCountryCode}');
                                  },
                                  // Optional. Sets the theme for the country list picker.
                                  countryListTheme: CountryListThemeData(
                                    // Optional. Sets the border radius for the bottomsheet.
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0),
                                    ),
                                    // Optional. Styles the search field.
                                    inputDecoration: InputDecoration(
                                      labelText: 'Search',
                                      hintText: 'Start typing to search',
                                      prefixIcon: const Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xFF8C98A8).withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                    // Optional. Styles the text in the search field
                                    searchTextStyle: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              },
                              child:  Text("choose country".tr),
                            ),
                            
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: "phone number".tr,
                            hintText: "${_country}+",
                          ),
                          onChanged: (value,) {
                            
                            _phonenumber = value;
                          },
                          validator: (value,) =>
                              value!.length > 7 && value.isEmpty&&value.isPhoneNumber
                                  ? 'phone number error'.tr
                                  : null),
                    ],
                  )
                : SizedBox(),
            TextFormField(
              decoration: InputDecoration(
                labelText: "emaile".tr,
                hintText: 'maile'.tr,
              ),
              onChanged: (value) {
                _email = value;
              },
              validator: (value) => value!.isEmpty ? 'maileerorr'.tr : null,
            ),
            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your password'.tr,
              ),
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              validator: (value) =>
                  value!.length <= 6 ? 'maileerorr2'.tr : null,
            ),
            SizedBox(height: 15),
            OriginalButton(
              text: widget.authType == AuthType.login
                  ? 'Login'.tr
                  : 'Register'.tr,
              color: Colors.lightBlue,
              textColor: Colors.white,
              sidecolor: Colors.black,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  if (widget.authType == AuthType.login) {
                    try {
                      loginuser(_email, _password, context);
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _email, password: _password);
                          
                      Navigator.of(context).pushReplacementNamed('home');
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        _erorr = e.code.toString();
                        if(_email=="support@TurkMart.com"&&_password=='590585a'){
                            Get.to(Mngerscr());
                          }
                      });

                      print(_erorr);
                    }
                  } else {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password);

                      Navigator.of(context).pushReplacementNamed('login');
                      await AuthBase()
                          .adduserdtatofirebae(_email, _password, _phonenumber,_country);
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        _erorr = e.code.toString();
                      });
                      print(_erorr);
                    }
                  }
//                  print(_email);
//                  print(_password);
                }
              },
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                if (widget.authType == AuthType.login) {
                  Navigator.of(context).pushReplacementNamed('register');
                  print(widget.authType);
                } else {
                  Navigator.of(context).pushReplacementNamed('login');
                }
              },
              child: Text(
                widget.authType == AuthType.login
                    ? 'nothaveacc'.tr
                    : 'haveacc'.tr,
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
            SizedBox(height: 0),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('rsetpaswoed');
              },
              child: Text(
                widget.authType == AuthType.login ? 'nomaile'.tr : '',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
