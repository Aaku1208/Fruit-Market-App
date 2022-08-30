import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruit_market2/BottomNavigationBar/All%20Account%20Pages/Help/help.dart';
import 'package:fruit_market2/BottomNavigationBar/All%20Account%20Pages/Settings/settings.dart';
import 'package:fruit_market2/Colors/color.dart';
import 'package:fruit_market2/GoggleSignin/goggle_sign_in.dart';
import 'package:fruit_market2/Shared%20Preferences%20class/login_shared_preferences.dart';
import 'package:fruit_market2/StartingPage/verificationpage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star_menu/star_menu.dart';

import 'All Account Pages/My Orders/my_orders.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  late List<Widget> subEntries;
  File? file;

  pickImage() async {
    ImagePicker pickImg = ImagePicker();
    XFile? image = await pickImg.pickImage(source: ImageSource.gallery);
    file = File(image!.path);
    print('------------------- $file');
  }

  pickCamera() async {
    ImagePicker pickImg = ImagePicker();
    XFile? image = await pickImg.pickImage(source: ImageSource.camera);
    file = File(image!.path);
    print('------------------- $file');
  }

  @override
  void initState() {
    super.initState();
    subEntries = subMenuEntries();
  }

  List<Widget> subMenuEntries() {
    return [
      GestureDetector(
        onTap: () async {
          await pickCamera();
          setState(() {});
        },
        child: Container(
            width: 85,
            height: 40,
            decoration: BoxDecoration(
                color: myColor, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.camera_alt_outlined,color: Colors.white),
                SizedBox(width: 4),
                Text('Camera',style: TextStyle(color: Colors.white)),
              ],
            ),
        ),
      ),
      const SizedBox(height: 10),
      GestureDetector(
        onTap: () async {
          await pickImage();
          setState(() {});
        },
        child: Container(
            width: 85,
            height: 40,
            decoration: BoxDecoration(
                color: myColor, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.image_outlined,color: Colors.white),
                SizedBox(width: 4),
                Text('Gallery',style: TextStyle(color: Colors.white)),
              ],
            ),
        ),
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    double sizewidth = MediaQuery.of(context).size.width;
    //final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 215,
              width: double.infinity,
              color: myColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: sizeheight*0.05, right: sizewidth*0.06),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: StarMenu(
                            params: const StarMenuParameters(
                              linearShapeParams:
                              LinearShapeParams(alignment: LinearAlignment.right),
                              shape: MenuShape.linear,
                              openDurationMs: 1200,
                            ),
                            items: subEntries,
                            child: const Icon(Icons.edit_note_rounded,color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (userData != null) // Facebook data null
                    Center(
                      child: CircleAvatar(
                        radius: 53,
                        backgroundColor: myColor,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: file == null
                                      ? NetworkImage(
                                     LogInSharedPreferences.getFbPhoto.toString(),
                                  )
                                      : FileImage(File(file!.path))
                                  as ImageProvider,
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle),
                        ),
                      ),
                    )
                  else if (userPhoto != null)
                    Center(
                      child: CircleAvatar(
                        radius: 53,
                        backgroundColor: myColor,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: file == null
                                      ? NetworkImage(
                                      LogInSharedPreferences.getGlPhoto.toString())
                                      : FileImage(File(file!.path))
                                  as ImageProvider,
                                  fit: BoxFit.fill
                                // image: NetworkImage(userPhoto!),
                              ),
                              shape: BoxShape.circle),
                        ),
                      ),
                    ),

                  SizedBox(height: sizeheight * 0.01),
                  if (LogInSharedPreferences.getFbName != '' &&
                      LogInSharedPreferences.getFbName != null)
                    Text(
                        LogInSharedPreferences.getFbName.toString(),style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                  else if (LogInSharedPreferences.getGlName != '' &&
                      LogInSharedPreferences.getGlName != null)
                    Text(
                        LogInSharedPreferences.getGlName.toString(),style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  if (LogInSharedPreferences.getFbEmail != '' &&
                      LogInSharedPreferences.getFbEmail != null)
                    Text(
                        LogInSharedPreferences.getFbEmail.toString(),style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                  else if (LogInSharedPreferences.getGlEmail != '' &&
                      LogInSharedPreferences.getGlEmail != null)
                    Text(
                        LogInSharedPreferences.getGlEmail.toString(),style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),

                ],
              ),
            ),

            // Text(LogInSharedPreferences.getFbName.toString()),
            // Text(LogInSharedPreferences.getFbEmail.toString()),


            SizedBox(height: sizeheight * 0.02),
            GestureDetector(
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 25),
                leading: Icon(Icons.shopping_bag_rounded,color: myColor),
                title: const Text("My Orders"),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyOrders()));
              },
            ),
            const Divider(),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 25),
              leading: Icon(Icons.favorite, color: myColor),
              title: const Text("Favourites"),
            ),
            const Divider(),
            GestureDetector(
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 25),
                leading: Icon(Icons.settings, color: myColor),
                title: const Text("Settings"),
              ),
              onTap:  () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
            ),
            const Divider(),
                ListTile(
                contentPadding: const EdgeInsets.only(left: 25),
                  leading: Icon(Icons.shopping_cart, color: myColor),
                  title: const Text("My Cart"),
                ),
                const Divider(),
                ListTile(
                contentPadding: const EdgeInsets.only(left: 25),
                  leading: Icon(Icons.star_rate_sharp, color: myColor),
                  title: const Text("Rate us"),
            ),
            const Divider(),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 25),
              leading: Icon(Icons.share_rounded, color: myColor),
              title: const Text("Refer a Friend"),
            ),
            const Divider(),
            GestureDetector(
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 25),
                leading: Icon(Icons.help, color: myColor),
                title: const Text("Help"),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Help()));
              },
            ),
            const Divider(),
            GestureDetector(
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 25),
                leading: Icon(Icons.logout, color: myColor),
                title: const Text("Log Out"),
              ),
              onTap: () async {
                await fbLogout();
                LogInSharedPreferences.setFbName = "";
                LogInSharedPreferences.setFbEmail = "";
                LogInSharedPreferences.setFbPhoto = "";

                await googleLogOut();

                LogInSharedPreferences.setGlName = "";
                LogInSharedPreferences.setGlEmail = "";
                LogInSharedPreferences.setGlPhoto = "";

                Fluttertoast.showToast(msg: "Logout Successfully", timeInSecForIosWeb: 2);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const VerificationPage()),
                        (Route<dynamic> route) => false);
                setState(() {});

              },
            ),
          ],
        ),
      ),
    );
  }
}

fbLogout() async {
  await FacebookAuth.instance.logOut();
  userData = null;
}

googleLogOut() async {
  await FirebaseAuth.instance.signOut();
  userEmail = "";
  userName = "";
  userPhoto = "";
  await GoogleSignIn().signOut();
}


