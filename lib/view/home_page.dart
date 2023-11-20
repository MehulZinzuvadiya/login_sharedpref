import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_sharedpref/Utils/shared_preference.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Center(
              child: Text(
            "Welcome Back!!",
            style: GoogleFonts.poppins(fontSize: 25),
          )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade300,
              ),
              onPressed: () {
                SharedPrefDemo.sharedPref.clearPref();
                Navigator.pushReplacementNamed(context, 'login');
              },
              child: Text("Logout")),
        ],
      ),
    ));
  }
}
