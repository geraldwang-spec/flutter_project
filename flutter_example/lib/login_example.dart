import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_example/loginEx/pages/home_page.dart';
import 'package:flutter_example/styles/app_colors.dart';
import 'package:flutter_example/loginEx/pages/login_page.dart';

class loginPractise {
  void executeExample(int i) {
    switch (i) {
      case 1:
        runApp(loginExample1());
        break;
      default:
    }
  }
}

class loginExample1 extends StatelessWidget {
  const loginExample1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Urbanist',
        scaffoldBackgroundColor: AppColors.background,
      ),
      //home: LoginPage(),
      initialRoute: '/',
      routes: {'/': (context) => LoginPage(), '/home': (context) => HomePage()},
    );
  }
}
