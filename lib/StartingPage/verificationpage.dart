// ignore_for_file: use_build_context_synchronously

import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market2/GoggleSignin/goggle_sign_in.dart';
import 'package:fruit_market2/Pages/welcome_page.dart';
import 'package:fruit_market2/Shared%20Preferences%20class/login_shared_preferences.dart';

import '../PhoneLoadingVarification/phone_no_otp.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool isLoading = false;
  bool darkMode = false;

  AuthButtonType? buttonType;
  AuthIconType? iconType;

  ThemeMode get themeMode => darkMode ? ThemeMode.dark : ThemeMode.light;

  String getFbName = "";
  String getFbEmail = "";
  String getFbPhoto = "";

  String getGlName = "";
  String getGlEmail = "";
  String getGlPhoto = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFbName = LogInSharedPreferences.getFbName.toString();
    getFbEmail = LogInSharedPreferences.getFbEmail.toString();
    getFbPhoto = LogInSharedPreferences.getFbPhoto.toString();

    getGlName = LogInSharedPreferences.getGlName.toString();
    getGlEmail = LogInSharedPreferences.getGlEmail.toString();
    getGlPhoto = LogInSharedPreferences.getGlPhoto.toString();
  }

  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    double sizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            //padding: EdgeInsets.fromLTRB(75, 100, 40, 0),
            margin: const EdgeInsets.only(top: 60),
            child: Image.asset("assets/image/home.png"),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            margin: const EdgeInsets.only(top: 10),
            child: const Text(
              "Fruit Market",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Color(0xff69A03A),
              ),
            ),
          ),

          /// Phone Number TextField
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PhoneNoAndOTP()));
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                margin: const EdgeInsets.only(top: 70),
                height: 52,
                width: 345,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: Colors.grey.shade500,
                      width: 1.4,
                    )),
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: const Text(
                    "Enter Your Mobile Number",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          ),

          /// OR Text
          SizedBox(height: sizeheight * .08),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: sizewidth * 0.1),
              const Expanded(
                  child: Divider(thickness: 0.5, color: Colors.black)),
              SizedBox(width: sizewidth * .01),
              const Text(
                "OR",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: sizewidth * .01),
              const Expanded(
                  child: Divider(
                thickness: 0.5,
                color: Colors.black,
              )),
              SizedBox(width: sizewidth * 0.1),
            ],
          ),

          SizedBox(height: sizeheight * .06),

          GoogleAuthButton(
            onPressed: () async {
              //LogInSharedPreferences.setLogin =
              await signInWithGoogle();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                  (Route<dynamic> route) => false);

              LogInSharedPreferences.setGlName = userName;
              LogInSharedPreferences.setGlEmail = userEmail;
              LogInSharedPreferences.setGlPhoto = userPhoto;
            },
            themeMode: themeMode,
            isLoading: isLoading,
            style: AuthButtonStyle(
              buttonType: buttonType,
              iconType: iconType,
              width: 200,
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: sizeheight * .02),
          FacebookAuthButton(
            onPressed: () async {
              await fbLogin();
              //print(userData!);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const WelcomePage()),
                  (Route<dynamic> route) => false);
              LogInSharedPreferences.setFbName = userData!['name'].toString();
              LogInSharedPreferences.setFbEmail = userData!['email'].toString();
              LogInSharedPreferences.setFbPhoto = userData!['picture']['data']['url'];
              },
            themeMode: themeMode,
            isLoading: isLoading,
            style: AuthButtonStyle(
              buttonType: buttonType,
              iconType: iconType,
              width: 200,
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  /// Exit Dialog box
  void exitDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Center(
                child: Text(""),
              ),
              content: const Text("Are you sure to exit this app"),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: () async {},
                  child: const Text("Exit"),
                ),
                OutlinedButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }

// String? userEmail = "";
// String? userName = "";
// String? userPhoto = "";
//
// Map<String, dynamic>? userData;

}
