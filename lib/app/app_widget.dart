// ignore_for_file: prefer_const_constructors

import 'package:alugai/shared/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/modules/chat/chat_page.dart';
import '../shared/modules/login/login_page.dart';
import '../shared/modules/splash/splash_page.dart';
import '../shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key}) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alugai',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/chat": (context) => ChatPage(),
      },
    );
  }
}
