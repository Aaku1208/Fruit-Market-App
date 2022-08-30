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
    // Timer(const Duration(seconds: 1),(){
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  Future<void> splashScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    // Navigator.pushReplacement(context, MaterialPageRoute(
    //   builder: (context) {
    //    return LogInSharedPreferences.getFbName == '' ||
    //         LogInSharedPreferences.getFbName == null
    //        ? WelcomePage()
    //        : VerificationPage();
    //   },
    // ));

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
          } else {
            return const VerificationPage();
          }
        },
      ),
    );



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff69A03A),
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 50, right: 10, top: 280, bottom: 0),
            child: const Text(
              "Fruit Market",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 50, right: 0, top: 210),
                child: Image.asset(
                  "assets/image/img.png",
                  fit: BoxFit.cover,
                ),
              ),
            ],
              // Padding(
              //   padding: const EdgeInsets.all(18),
              //   child: Row(
              //     children: [
              //       Column(
              //         children: [
              //           Container(
              //             height: 100,
              //             width: 100,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               image: DecorationImage(
              //                 image: NetworkImage(image),
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           Row(
              //             children: [
              //               Container(
              //                 margin: const EdgeInsets.only(left: 15),
              //                 child: Row(
              //                   children: [
              //                     Column(
              //                       children: [
              //                         Text(text1,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
              //                       ],
              //                     ),
              //                     SizedBox(width: MediaQuery.of(context).size.width *12),
              //                     Column(
              //                       children: const [
              //                         Icon(Icons.arrow_forward_ios,size: 15),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //           Container(
              //             margin: const EdgeInsets.only(right: 80,bottom: 7),
              //             child: GiveStarReviews(
              //               starData: [
              //                 GiveStarData(
              //                   text: "",
              //                   onChanged: (rate) {},
              //                   size: 20,
              //                   activeStarColor: const Color(0xffA6A1A1),
              //                   inactiveStarColor: const Color(0xffA6A1A1),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           Container(
              //               margin: const EdgeInsets.only(right: 103,bottom: 7),
              //               child: Text(text2,
              //                 style: const TextStyle(color: Color(0xffB2B2B2),fontSize: 12),
              //               )
              //           ),
              //           Container(
              //               margin: const EdgeInsets.only(right: 37),
              //               child: Text(text3)
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );
          ),
        ],
      ),
    );
  }
}
