// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled2/modules/login/Loginscreen.dart';
import 'package:untitled2/network/CacheHelper.dart';
import 'package:untitled2/network/DioHelper.dart';

import 'home_Layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  dynamic token = CacheHelper.getData(key: 'result');
  //Widget widget;
  // if (token != null)
  //  widget = HomeScreen();
  // else
  // widget = LoginScreen();

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  String? token;

  MyApp({
    Key? key,
    this.token,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,

          appBarTheme: AppBarTheme(

              titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
              iconTheme: const IconThemeData(color: Colors.black),
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.grey.shade100,
                  statusBarBrightness: Brightness.dark),
              backgroundColor: Colors.white,
              elevation: 0.0),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.cyan,
              elevation: 20.0,
              type: BottomNavigationBarType.fixed)),
      home: token != null ? const HomeLayout() : LoginScreen(),
    );
  }
}


//sondosehab67@gmail.com     email for api omara