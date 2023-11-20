import 'package:flutter/material.dart';
import 'package:login_sharedpref/view/home_page.dart';
import 'package:login_sharedpref/view/sign_up.dart';
import 'package:login_sharedpref/view/splash_screen.dart';

import 'view/login_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => SplashScreen(),
      'login': (context) => LoginScreen(),
      'signUp': (context) => SignUp(),
      'home': (context) => HomePage(),
    },
  ));
}
