import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:get_storage/get_storage.dart';
import 'package:turkmart/mangerapp/gpt.dart';
import '../../screens/splash/splash_screen.dart';
import 'screens/home/home_screen.dart';

import '../../global_controler/binding.dart';
import 'local/local.dart';
import 'screens/logine/auth_screen.dart';
import 'screens/logine/controler/auth_form.dart';
import 'screens/logine/rest_paswoord_scren.dart';

////adb tcpip 5555
///adb connect xxx.xxx.xxx.xxx:5555 // IP address of your device xxx.xxx.xxx.xxx:5555
///https://www.foreks.com/api/historical/intraday?code=USD/TRL&period=1440&last=1
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyBt8k32ueCiE2Z37biqQBUqfXbsGHWBTmc',
          appId: '1:237231323721:android:1a7eb2b497492c84ca9d98',
          messagingSenderId: '237231323721',
          projectId: 'turkmart-64701'));
  GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.light(),
          translations: MyLocal(),
          initialBinding: MyBinding(),
          debugShowCheckedModeBanner: false,
          title: "appname".tr,
          theme: ThemeData(
            textTheme:
                GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', 'AE'), // English, no country code
            Locale('ar', 'SY'), // Spanish, no country code
            Locale('en', 'US')
          ],
          locale: Get.deviceLocale,
          home: Scaffold(
            body: AuthTypeSelector(),
          ),
          routes: {
            'home': (context) => HomeScreen(),
            'login': (context) => const AuthScreen(authType: AuthType.login),
            'register': (context) =>
                const AuthScreen(authType: AuthType.register),
            'rsetpaswoed': (context) => const rsetpaswoed(),
          });
    });
  }
}

class AuthTypeSelector extends StatelessWidget {
  // Navigates to a new page

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SplashScreen());
  }
}
