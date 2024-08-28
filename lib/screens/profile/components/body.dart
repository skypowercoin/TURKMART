import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:turkmart/screens/home/home_screen.dart';
import 'package:turkmart/screens/nvibar/controler1/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../logine/controler/auth.dart';
import '../../splash/splash_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:  EdgeInsetsDirectional.only(top:2.h),
      child: Column(
        children: [
          
          
          ProfileMenu(
            text: "MyAccount".tr,
            icon: "assetss/icons/User Icon.svg",
            press: () => {
              Get.to(Accountscr())
            },
          ),
          ProfileMenu(
            text: "wallet".tr,
            icon: "assetss/icons/Cash.svg",
            press: () {
              Get.to(walletscr());
            },
          ),
          ProfileMenu(
            text: "Notification".tr,
            icon: "assetss/icons/Bell.svg",
            press: () {
              Get.to(Notificationscr());
            },
          ),
          ProfileMenu(
            text: "Setting".tr,
            icon: "assetss/icons/Settings.svg",
            press: () {
              Get.to(Settingscr());
            },
          ),
          ProfileMenu(
            text: "HelpCenter".tr,
            icon: "assetss/icons/Question mark.svg",
            press: () {
              
              Get.to(HelpScr());
            },
          ),
          ProfileMenu(
            text: "LogOut".tr,
            icon: "assetss/icons/Log out.svg",
            press: () {
              AuthBase().logout();
              Get.offAll(HomeScreen());
            },
          ),
        ],
      ),
    );
  }
  
  
}
class walletscr extends GetView {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset
                    ("assetss/icons/Cash.svg"
                    ,
                    color: Color.fromARGB(179, 231, 39, 25),
                    width: 30.w,
                  ),
              Text("appname".tr+" Wallet ",
              style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize:  1.w*1.h),),
            ],
          ),
        ),
        bottomNavigationBar: Navigationbar(),
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Color.fromARGB(202, 93, 247, 175),
          backgroundColor: Color.fromARGB(151, 93, 247, 175),
          automaticallyImplyLeading: false,
          title: Text(
            "wallet".tr,
            style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
          ),
        ));
  }
}

class Notificationscr extends GetView {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset
                  ("assetss/icons/Bell.svg"
                  ,
                  color: Color.fromARGB(179, 231, 39, 25),
                  width: 30.w,
                ),
              Text('No Notification yet',style: TextStyle(fontSize: 1.w*1.h,color: Color.fromARGB(255, 167, 164, 164))),
            ],
          ),
        ),
        bottomNavigationBar: Navigationbar(),
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Color.fromARGB(202, 93, 247, 175),
          backgroundColor: Color.fromARGB(151, 93, 247, 175),
          automaticallyImplyLeading: false,
          title: Text(
            "Notification".tr,
            style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
          ),
        ));
  }
}

class Settingscr extends GetView {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children:
         [
          ProfileMenu(text: "Themes".tr, icon: "assetss/icons/Phone.svg",press: (){
            Get.to(Themesscr());
          }),
          ProfileMenu(text: "lang".tr, icon: "assetss/icons/Discover.svg",press: (){
            Get.to(languagesscr());
          }),
          ProfileMenu(text:"Gifts".tr, icon: "assetss/icons/Gift Icon.svg",press: (){
            Get.to(Giftsscr());
          },),
        ],),),
        bottomNavigationBar: Navigationbar(),
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Color.fromARGB(202, 93, 247, 175),
          backgroundColor: Color.fromARGB(151, 93, 247, 175),
          automaticallyImplyLeading: false,
          title: Text(
            "Setting".tr,
            style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
          ),
        ));
  }
}

class Giftsscr  extends GetView{
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset
                  ("assetss/icons/Gift Icon.svg"
                  ,
                  color: Color.fromARGB(179, 231, 39, 25),
                  width: 30.w,
                ),
              Text("No Gifts",style: TextStyle(fontSize: 1.w*1.h,color: Color.fromARGB(255, 167, 164, 164))),
            ],
          ),
        ),
        bottomNavigationBar: Navigationbar(),
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Color.fromARGB(202, 93, 247, 175),
          backgroundColor: Color.fromARGB(151, 93, 247, 175),
          automaticallyImplyLeading: false,
          title: Text(
            "Gifts".tr,
            style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
          ),
        ));
  }
  
}

class Themesscr extends GetView {
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset
                  ("assetss/icons/Phone.svg",
                  
                  color: Color.fromARGB(179, 231, 39, 25),
                  width: 30.w,
                ),
              Text('No Themes',style: TextStyle(fontSize: 1.w*1.h,color: Color.fromARGB(255, 167, 164, 164))),
            ],
          ),
        ),
        bottomNavigationBar: Navigationbar(),
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Color.fromARGB(202, 93, 247, 175),
          backgroundColor: Color.fromARGB(151, 93, 247, 175),
          automaticallyImplyLeading: false,
          title: Text(
            "Themes".tr,
            style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
          ),
        ));
  }

}
class languagesscr extends GetView {
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset
                  ("assetss/icons/Discover.svg"
                  ,
                  color: Color.fromARGB(179, 231, 39, 25),
                  width: 30.w,
                ),
              Text('lang'.tr,style: TextStyle(fontSize: 1.w*1.h,color: Color.fromARGB(255, 167, 164, 164))),
            ],
          ),
        ),
        bottomNavigationBar: Navigationbar(),
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Color.fromARGB(202, 93, 247, 175),
          backgroundColor: Color.fromARGB(151, 93, 247, 175),
          automaticallyImplyLeading: false,
          title: Text(
            "lang".tr,
            style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
          ),
        ));
  }
}


class Accountscr extends GetView {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Padding(
          padding:  EdgeInsetsDirectional.only(start:2.w ,top: 2.h),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfilePic(),
              SizedBox(height: 2.h,),
              Divider(),
              
              ListTile(
                title: Text(
                      "pname".tr,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize:  1.w*0.9.h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "******".tr,
                      style: TextStyle(
                        fontSize: 1.w*0.6.h,
                      ),
                    ),
              ),Divider(),
              ListTile(
                title: Text(
                      "phone number".tr,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize:  1.w*0.9.h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "******".tr,
                      style: TextStyle(
                        fontSize: 1.w*0.6.h,
                      ),
                    ),
              ),Divider(),
              ListTile(
                title: Text(
                      "pemail".tr.tr,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize:  1.w*0.9.h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "******".tr,
                      style: TextStyle(
                        fontSize: 1.w*0.6.h,
                      ),
                    ),
              ),Divider(),
              ListTile(
                title: Text(
                      "Address".tr,
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize:  1.w*0.9.h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "******".tr,
                      style: TextStyle(
                        fontSize: 1.w*0.6.h,
                      ),
                    ),
              ),Divider(),
              
              
              
            ],
          ),
        ),
        
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Color.fromARGB(202, 93, 247, 175),
          backgroundColor: Color.fromARGB(151, 93, 247, 175),
          automaticallyImplyLeading: false,
          title: Text(
            "MyAccount".tr,
            style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
          ),
        ));
  }
}

class HelpScr extends GetView {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assetss/images/helpcentr.png",height: 30.h,),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 0.5.w,end: 0.5.w),
              child: Text("helpcentermsg".tr,style: TextStyle(fontSize: 1.w*0.6.h)),
            ),
            Text("appname".tr,style: TextStyle(fontSize: 1.5.w*1.h),),
            Padding(
              padding:  EdgeInsetsDirectional.only(end:75.w,top: 10.h),
              child: FloatingActionButton(
                child:  SvgPicture.asset
                ("assetss/icons/Chat bubble Icon.svg"
                ,
                
                color: Color.fromARGB(179, 252, 249, 248),
                width: 10.w,
              )
              ,onPressed: (){reachUs();},tooltip: "chat with us",backgroundColor: Color.fromARGB(151, 91, 240, 116),),
            )
          ],
        )),
        
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Color.fromARGB(202, 93, 247, 175),
          backgroundColor: Color.fromARGB(151, 93, 247, 175),
          automaticallyImplyLeading: false,
          title: Text(
            "HelpCenter".tr,
            style: TextStyle(color: Color.fromARGB(255, 2, 2, 2), fontSize: 20),
          ),
        ));
  }
}


reachUs() async{

  var contact = "+905317356511";
   var userdata= "appname".tr;
   

  var android_url = "https://api.whatsapp.com/send?phone=$contact=${Uri.parse("HI NED HELP ")}";

  var iOS_url = "https://wa.me/$contact/?text=${Uri.parse("Hi, I need some help")}";

  if(Platform.isIOS){

    if(await canLaunch(iOS_url)){
      await launch(iOS_url, forceSafariVC: false);
    }else{
      print('Whatsapp is not installed');
    }
  }else{
    if(await canLaunch(android_url)){
      await launch(android_url);
      print(android_url);
    }else{
      print('Whatsapp is not installed');
    }
  }

}
