import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruit_market2/BottomNavigationBar/Favorite/favorite_page.dart';
import 'package:fruit_market2/Colors/color.dart';
import 'package:fruit_market2/GoggleSignin/goggle_sign_in.dart';
import 'package:fruit_market2/Shared%20Preferences%20class/login_shared_preferences.dart';
import 'package:fruit_market2/StartingPage/verificationpage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:star_menu/star_menu.dart';

import '../Shopping Cart/shopping_cart.dart';
import 'All Account Pages/Help/help.dart';
import 'All Account Pages/My Orders/my_orders.dart';
import 'All Account Pages/Settings/settings.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late List<Widget> subEntries;
  File? file;
  late String getPofilePhoto;

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
    getPofilePhoto = LogInSharedPreferences.getPofilePhoto.toString();
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
              Icon(Icons.camera_alt_outlined, color: Colors.white),
              SizedBox(width: 4),
              Text('Camera', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      GestureDetector(
        onTap: () async {
          await pickImage();
          LogInSharedPreferences.setPofilePhoto = file!.path.toString();
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
              Icon(Icons.image_outlined, color: Colors.white),
              SizedBox(width: 4),
              Text('Gallery', style: TextStyle(color: Colors.white)),
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
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        backgroundColor: myColor,
        title:  Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: sizewidth * 0.06),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: StarMenu(
                      params: const StarMenuParameters(
                        linearShapeParams: LinearShapeParams(
                            alignment: LinearAlignment.right),
                        shape: MenuShape.linear,
                        openDurationMs: 1200,
                      ),
                      items: subEntries,
                      child: const Icon(Icons.edit_note_rounded,
                          color: Colors.white),
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
                            image: LogInSharedPreferences.getPofilePhoto == null
                                ? NetworkImage(LogInSharedPreferences.getFbPhoto.toString())
                                : FileImage(File(LogInSharedPreferences.getPofilePhoto.toString())) as ImageProvider,
                            fit: BoxFit.fill),
                        shape: BoxShape.circle),
                  ),
                ),
              )
            else if (userPhoto != null) // Google data null
              Center(
                child: CircleAvatar(
                  radius: 53,
                  backgroundColor: myColor,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: LogInSharedPreferences.getPofilePhoto == null
                                ? NetworkImage(LogInSharedPreferences.getGlPhoto.toString())
                                : FileImage(File(LogInSharedPreferences.getPofilePhoto.toString())) as ImageProvider,
                            fit: BoxFit.fill
                          // image: NetworkImage(userPhoto!),
                        ),
                        shape: BoxShape.circle),
                  ),
                ),
              )

            /// OTP
            else if (userPhoto != null)
                Center(
                  child: CircleAvatar(
                    radius: 53,
                    backgroundColor: Colors.blueAccent,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: file == null
                                ? NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWTercVL7lubQltMzul0sIR21CTX1fJUaIww&usqp=CAU")
                                : FileImage(File(file!.path))
                            as ImageProvider,
                            fit: BoxFit.fill,
                            // image: NetworkImage(userPhoto!),
                          ),
                          shape: BoxShape.circle),
                    ),
                  ),
                ),
            SizedBox(height: sizeheight * 0.01),
            if (LogInSharedPreferences.getFbName != '' &&
                LogInSharedPreferences.getFbName != null)
              Text(LogInSharedPreferences.getFbName.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15))
            else if (LogInSharedPreferences.getGlName != '' &&
                LogInSharedPreferences.getGlName != null)
              Text(LogInSharedPreferences.getGlName.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15))

            /// OTP First & Second Name
            else if (LogInSharedPreferences.getFName != '' &&
                  LogInSharedPreferences.getFName != null &&
                  LogInSharedPreferences.getSName != '' &&
                  LogInSharedPreferences.getSName != null)
                Text(
                    '${LogInSharedPreferences.getFName}\t'
                        '${LogInSharedPreferences.getSName}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white,fontSize: 15)),
            if (LogInSharedPreferences.getFbEmail != '' &&
                LogInSharedPreferences.getFbEmail != null)
              Text(LogInSharedPreferences.getFbEmail.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white,fontSize: 16))
            else if (LogInSharedPreferences.getGlEmail != '' &&
                LogInSharedPreferences.getGlEmail != null)
              Text(LogInSharedPreferences.getGlEmail.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white,fontSize: 16))

            /// OTP Email
            else if (LogInSharedPreferences.getOEmail != '' &&
                  LogInSharedPreferences.getOEmail != null)
                Text(LogInSharedPreferences.getOEmail.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white,fontSize: 16))
          ],
        ),
        toolbarHeight: 200,
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            //SizedBox(height: sizeheight * 0.01),
            // My Orders
            GestureDetector(
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 25),
                leading: Icon(Icons.shopping_bag_rounded, color: myColor),
                title: const Text("My Orders"),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyOrders()));
              },
            ),
            const Divider(),
            // Favourites
            GestureDetector(
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 25),
                leading: Icon(Icons.favorite, color: myColor),
                title: const Text("Favourites"),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FavoritePage()));
              },
            ),
            const Divider(),
            // Settings
            GestureDetector(
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 25),
                leading: Icon(Icons.settings, color: myColor),
                title: const Text("Settings"),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
            ),
            //const Divider(),
            // My Cart
            // GestureDetector(
            //   child: ListTile(
            //     contentPadding: const EdgeInsets.only(left: 25),
            //     leading: Icon(Icons.shopping_cart, color: myColor),
            //     title: const Text("My Cart"),
            //   ),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const ShoppingPage()));
            //   },
            // ),
            const Divider(),
            // Rate us
            GestureDetector(
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 25),
                leading: Icon(Icons.star_rate_sharp, color: myColor),
                title: const Text("Rate us"),
              ),
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Under Production",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
            ),
            const Divider(),
            // Refer a Friend
            GestureDetector(
              child: ListTile(
                contentPadding: const EdgeInsets.only(left: 25),
                leading: Icon(Icons.share_rounded, color: myColor),
                title: const Text("Refer a Friend"),
              ),
              onTap: () {
                Fluttertoast.showToast(
                  msg: "Under Production",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 3,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
            ),
            const Divider(),
            // Help
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
            // Log Out
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

                LogInSharedPreferences.setFName = "";
                LogInSharedPreferences.setSName = "";
                LogInSharedPreferences.setOEmail = "";
                LogInSharedPreferences.setOAddress = "";

                LogInSharedPreferences.setPofilePhoto = "";

                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const VerificationPage()),
                    (Route<dynamic> route) => false);
                Fluttertoast.showToast(
                    msg: "Logout Successfully", timeInSecForIosWeb: 2);
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
