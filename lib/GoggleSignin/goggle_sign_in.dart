import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn(

  ).signIn();

  final GoogleSignInAuthentication googleAuth =
  await googleUser!.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  userEmail = googleUser.email;
  userName = googleUser.displayName;
  userPhoto = googleUser.photoUrl;

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Map<String, dynamic>? userData;

/// Facebook
fbLogin() async {
  final LoginResult result = await FacebookAuth.instance.login();
  if (result.status == LoginStatus.success) {
    // you are logged
    final AccessToken accessToken = result.accessToken!;
  } else {
    print(result.status);
    print(result.message);
  }
  final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
  final user = await FacebookAuth.instance.getUserData();
  userData = user;
}


String userEmail = '';
String? userName = '';
String? userPhoto = '';