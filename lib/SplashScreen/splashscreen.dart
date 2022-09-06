import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruit_market2/Pages/welcome_page.dart';
import 'package:fruit_market2/Shared%20Preferences%20class/login_shared_preferences.dart';
import 'package:fruit_market2/StartingPage/verificationpage.dart';

import '../onboardingScreen/eshopping.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreen();
  }

  Future<void> splashScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );


    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (LogInSharedPreferences.getFbName != '' &&
              LogInSharedPreferences.getFbName != null &&
              LogInSharedPreferences.getFbEmail != '' &&
              LogInSharedPreferences.getFbEmail != null) {
            return const WelcomePage();
          } else if (LogInSharedPreferences.getGlName != '' &&
              LogInSharedPreferences.getGlName != null) {
            return const WelcomePage();
            /// OTP
          } else if (LogInSharedPreferences.getFName != '' &&
              LogInSharedPreferences.getFName != null &&
              LogInSharedPreferences.getSName != '' &&
              LogInSharedPreferences.getSName != null &&
              LogInSharedPreferences.getOEmail != '' &&
              LogInSharedPreferences.getOEmail != null) {
            return const WelcomePage();
          } else {
            return const VerificationPage();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    double sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff69A03A),
      body: Column(
        children: [
          SizedBox(height: sizeheight * 0.390),
        Center(
          child: Text("Fruit Market",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w900)),
        ),
        SizedBox(height: sizeheight * 0.29),
        Image.asset("assets/image/img.png",
            fit: BoxFit.cover),
        ],
      ),
    );
  }
}
