import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'controler/auth_form.dart';

class AuthScreen extends StatelessWidget {
  final AuthType authType;

  const AuthScreen({Key? key, required this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[BackgroundImage(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.618 / 2,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(113, 205, 252, 236),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10.h,
                          ),
                          Hero(
                            tag: 'logoAnimation',
                            child: FadeInDownBig(
                              duration: Duration(milliseconds: 2000),
                              child: Image.asset('assetss/images/mark.png',
                                  height: 30.h),
                                  ///Image.asset('assetss/images/mark.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                AuthForm(authType: authType),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
class AuthScreen1 extends StatelessWidget {
   final AuthType authType;
  const AuthScreen1({Key? key, required this.authType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class BackgroundImage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.black, Colors.black12],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assetss/images/splash_2.png'),
            fit: BoxFit.fitWidth,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
      ),
    );
  }
}