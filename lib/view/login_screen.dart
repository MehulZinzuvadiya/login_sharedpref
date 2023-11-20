import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/shared_preference.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txt_email = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/bg.jpg",
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Login",
                    style: GoogleFonts.poppins(fontSize: 50),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: txt_email,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.brown.shade700,
                      ),
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: txt_password,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.brown.shade700,
                      ),
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () async {
                        String userEmail = txt_email.text;
                        String userPassword = txt_password.text;

                        Map m1 = await SharedPrefDemo.sharedPref.readPref();
                        print("${m1['e1']}=${m1['p1']}");

                        if (userEmail == m1['e1'] && userPassword == m1['p1']) {
                          SharedPrefDemo.sharedPref
                              .createPref(userEmail, userPassword, true);
                          Navigator.pushNamed(context, 'home');
                        } else if (userEmail != m1['e1']) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Invalid email!!")));
                        } else if (userPassword != m1['p1']) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Invalid Password!")));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Invalid Credentials")));
                        }
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'signUp');
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.deepPurple.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
