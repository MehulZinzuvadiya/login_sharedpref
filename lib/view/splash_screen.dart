import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_sharedpref/Utils/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    checkLogin();
    checkFirstSeen();
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 200),
            Text(
              'Welcome',
              style: GoogleFonts.lato(fontSize: 30),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> checkLogin() async {
    Map map = await SharedPrefDemo.sharedPref.readPref();
    if (map['isLogin'] == true) {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, 'home'),
      );
    } else {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, 'login'),
      );
    }
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushReplacementNamed(context, 'login');
    }
  }
// Future<void> main() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var status = prefs.getBool('isLoggedIn') ?? false;
//   print(status);
//   runApp(MaterialApp(home: status == true ? Login() : Home()));
// }
}
